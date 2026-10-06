---
type: framework
source: Eric Siu, "9 Jev Use Cases for Work" (X post 2026-10-02, YouTube 2026-09-29) and his X Article "How to Build Fast AI Evals With Jev, Grok Bots, and Grill Me" (2026-09-27); Cloudflare, "Introducing Clef" (2026-10-01); TypeSafe AI docs; Claire Vo on Lenny Rachitsky's How I AI (2026-09-28). Compiled 2026-10-06. Full research notes with every URL in the Campaign Engine workshop deck sources.
used_by: /quality-gate (optional step), /campaign-review (optional step)
tags: [campaign-engine, quality-gate, decision-models, jev, clef]
---

# Decision models: running the quality gate with Jev or Clef

The quality gate in `frameworks/quality-gate.md` is a sheet: criteria down the side, channels across the top, a weight in each cell, a threshold at the bottom. Claude scores it by reading the draft. That is enough for a workshop and for most teams.

A **decision model** is the optional step after that: a small, fast AI model that answers the gate's questions on every draft in under a second, so the gate can run on 200 drafts, or run before every expensive step, not only at the end. Two are available, with the same request shape:

| | Jev (TypeSafe AI) | Clef (Cloudflare) |
|---|---|---|
| Released | 2026-09-15, early access | 2026-10-01, open source (Apache 2.0), on Workers AI and Hugging Face |
| Input | Text, 32k context | Text and images, 64k context |
| Output | Typed answers with probabilities. No prose | Same. Jev-API compatible |
| Latency (vendor-reported) | about 500 ms | about 200 ms (Clef-flash about 40 ms) |
| Cost (vendor-reported) | $0.042 per million input tokens | Workers AI pricing |

The workshop content is identical for both. Only the vendor changes.

## What a decision model is, and is not

- **It is** a classifier. You send a block of text (the "state": a brief, a draft, a comment) and a set of named questions. It returns a probability for each.
- **It is not** a writer. It never explains why. You get 0.91, not a sentence.
- **It is not** a weighted matrix. The weights, the threshold and the routing live in your sheet or your code. The model only answers the questions.
- **It cannot** break the schema (every answer is one of the options you gave), but it **can** pick the wrong option with high confidence. Cloudflare's own workflow benchmarks land in the 60s and 70s out of 100: triage grade, not auto-approve grade.

## Three question types

| Type | Asks | Returns | Gate use |
|---|---|---|---|
| **Noul** | A yes/no proposition. "Does every statistic in this draft cite a source in the brief?" | One probability that the answer is yes | Non-negotiables: a Noul under the floor is an automatic HOLD, whatever the total |
| **Choice** | Pick one option, each with a one-line description | A probability per option | Routing: which buying stage does this read as? Which channel is it for? |
| **Score** | A position on an ordered scale, each level described | A score plus a distribution over levels | Graded criteria: "Offer clarity: 0 unclear, 1 vague, 2 clear, 3 clear and specific to the brief's goal" |

One proposition per question. Compound questions ("is it on-brand and does it have one CTA?") degrade the answer; split them. Keep counting, arithmetic and date logic in code, not in the model: those are documented weaknesses of this model class.

Cloudflare's example request, verbatim from the post:

```
"state": "Checkout has been failing for every customer for the last hour.",
"questions": {
  "urgent":   { "type": "noul",   "instructions": "Is this support request urgent?" },
  "team":     { "type": "choice", "instructions": "Which team should handle this request?",
                "criteria": { "billing": "Payments, invoices, and refunds",
                              "technical": "Outages, errors, and configuration",
                              "sales": "Plans and upgrades" } },
  "severity": { "type": "score",  "instructions": "How severe is the customer impact?",
                "criteria": ["No impact", "Minor", "Major", "Critical"] }
}
```

## From the gate sheet to questions

1. **Every row of `quality-gate.md` becomes one question.** Pass / fail rows become Nouls. Graded rows become Scores with the levels written out. Keep the row's wording; the question is the criterion.
2. **Weights stay in the sheet.** Weighted score = sum over rows of (weight for this channel × probability). A Noul on a non-negotiable row below its floor (say 0.5) is a HOLD regardless of the total.
3. **Thresholds by the cost of being wrong.** TypeSafe's guidance, inherited by Clef: high confidence acts, the middle band goes to a human, low does not act. Raise the floor on a question where a false pass is expensive (an invented statistic), lower it where a missed pass only costs a re-read.
4. **Three routes, not two.** SHIP above the top threshold; REVIEW in the band around it, with the failing questions listed; FIX below the floor, back to the draft.
5. **Gate before the expensive step, then again after.** Eric Siu's lesson: he was classifying after the costly work (outreach sent, frontier-model analysis run). Move the gate in front of it (which briefs are worth drafting, which drafts are worth a human's review) and keep a second gate before anything ships or sends.

## Calibrate before you trust it

From Eric Siu's eval checklist (his words: "proposed starting settings, not performance we achieved") and Buena AI's small published test:

1. Pick 20 to 30 real past drafts or briefs: clear passes, clear fails, boundary cases. One owner labels the expected route and says why. Freeze the labels before running anything. Keep "missing evidence" separate from "evidence against".
2. Hold some back, unseen, for after tuning.
3. Run each item three times; take the median per question; apply the sheet's weights and routing; count route flips. Proposed ceiling: 10% flips.
4. Make the boundary visible: a Noul between 0.45 and 0.55 is BORDERLINE and goes to review.
5. Score the costly route separately: proposed targets of 80% agreement with the owner's labels overall, 90% precision on SHIP.
6. Log-only until a person approves any change to the questions or thresholds.
7. Re-run the frozen set weekly; flag a mean shift over 0.05 or any route change.

Then **measure the hit rate of what passes.** Half of the transcript chunks that cleared one of Eric Siu's gates were still not useful on a hand check. The gate removes the obvious misses; it does not certify the rest.

## Where it fails

- Anything that needs a reason, a rewrite or an open-ended answer. The gate can say a headline fails "outcome-led"; it cannot say what the outcome should be. That is Claude's job in `/campaign-review`, and the human's at Gate 2.
- Decisions whose options are not known up front: positioning, strategy, which campaign to run.
- Compound questions, counting, dates, very long noisy inputs.
- Auto-approving anything with a real cost: a send, a publish, a budget change. Eric Siu's "send door" rule: nothing sends as him without a yes or a locked rule with a daily cap.

## What the people who tested it report

All self-reported by the people who ran them; none independently reproduced.

| Who | What | Numbers |
|---|---|---|
| Eric Siu (Single Grain, Single Brain) | Draft quality gates: duplicate of a live page, thin evidence, invented stats, AI tells, image quality, ship-ready | 11 of 149 AI drafts cleared over three days, about 7%. "Most AI drafts should not ship." 3,208 pages triaged in 178 seconds; the first pass flagged 2,200 because the scraper was broken, which is the point of checking the hit rate |
| Claire Vo (ChatPRD) on Lenny Rachitsky's How I AI | Classified 4,500 YouTube comments by sentiment and "contains an episode idea"; published the exact questions | 58 episode ideas found; 80% positive on one episode; 200,000 decisions for about $4; under $10 for the week |
| Matthew Berman (Emerald Digital, StealAds) | Broke down 724 live ads from 37 brands: hook, format, offer, CTA, awareness stage, landing page mismatch | 40 seconds, 9 cents of tokens; 1.09 million views of the demo. No published question set or accuracy check |
| Buena AI | 8 outreach drafts, two Nouls each (claims grounded in research? conversation fits the role?), labels frozen first | 16 of 16 matched the authored labels at a 0.5 cutoff, in 0.93 seconds. They say it is "not a representative accuracy benchmark" |

## In this module

- `/quality-gate` ends with an optional step that writes the gate as a Jev or Clef question set (`projects/campaign-engine/quality-gate-questions.json`) alongside the sheet, so a team with API access can run it. Nothing in the workshop depends on it.
- `/campaign-review` scores the sheet itself by reading the drafts. If a decision model has been run and its output file is present, the review shows both scores side by side and says where they disagree.
