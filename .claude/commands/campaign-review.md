---
description: Campaign Engine step 4, Gate 2. Score every draft against the brief, the channel workflow and the brand brain using your weighted quality gate; route each to SHIP, REVIEW or FIX; propose fixes; wait for the human to accept or overrule.
argument-hint: <campaign slug> [channel ...]
---

# /campaign-review

Step 4 of the Campaign Engine, and Gate 2. The gate recommends; the human accepts or fixes. Nothing ships on vibes, and nothing ships because the gate said so either.

Read the `quality-gate` skill, then `projects/campaign-engine/quality-gate.md` (the user's tuned copy; fall back to `frameworks/quality-gate.md` only if it is missing, and say so), then the brief, the workflows and the drafts.

## Mode

- **`<slug>`:** reviews every file in `projects/campaigns/<slug>/drafts/`, or only the channels named. Writes `projects/campaigns/<slug>/review.md`; if one exists, `review-v2.md`.
- **`example-agency-upgrade`** (or `example`): the Acme drafts, with the example brain.

## 1. Load

The brief (KPI action, CTA, angles and proof, buyer's thought, exclusions, handoff rule, constraints). Each draft's workflow from `projects/campaigns/<slug>/workflows/` (Specs and Outputs). The brand brain (or example brain). The gate: its rows, each channel's weights, the thresholds, the non-negotiables. If a decision-model output file exists for this campaign (`projects/campaigns/<slug>/gate-output.json`), load it too.

## 2. Score each draft

For every row with a weight above 0 for the draft's channel, give a score of 0, 1 or 2 and a note that quotes the line in the draft that earned it. Rules for the rows that need judgment:

- **Goal:** read every CTA. Does it move the reader to the KPI action? A sequence that ends on the asset, a page whose CTA is the download when the KPI is demos: 0.
- **Fidelity:** list every statistic, customer, quote and case study in the draft. Each must appear in the brief's proof column or in the brain. One invented or unsourced item: 0, and name it. A claim the brief marked (no proof) that is stated as fact: 0.
- **Workflow:** compare against the Outputs list and every Specs row. Count characters and words. A missing output or a spec breach: 1 if minor, 0 if an output is missing.
- **Stage:** read the buyer's thought in the brief; does the copy answer it, at that stage?
- **Voice:** run every Always and Never in the voice guide, every banned word, the AI tells (em dashes, "it's not X, it's Y", stacked adjectives).
- **Consistency:** put the headline, offer and CTA of every draft side by side. Do they agree?
- The remaining rows as the gate's "Passes when" column says.

Compute the weighted score and the route (SHIP, REVIEW, FIX). A 0 on a non-negotiable row is FIX whatever the total.

## 3. Propose fixes

For every row scored 0 or 1: the line that failed, why, and a concrete fix written in the brand's voice from the brief's proof. For Fidelity fails, the fix is to cut the claim or cite it; never to soften it. For Goal fails, the fix is the ask, attached where the asset is.

## 4. Write the review

`projects/campaigns/<slug>/review.md`:

```
---
type: campaign-review
campaign: <slug>
gate: projects/campaign-engine/quality-gate.md (last_updated of the gate)
reviewed: <date>
status: open          # open until every draft is SHIP or the human has overruled
---
# Review: <campaign>

## Summary
| Channel | Score | Route | Non-negotiable fails | Fixes proposed |

## <channel>
| Row | Criterion | Weight | Score | Weighted | Note |
...
| | Total | | | nn/NN = nn% | ROUTE |
### Fixes
1. ...

## Decision-model comparison   (only if gate-output.json exists)
| Row | Gate score | Model probability | Agree? |

## Decisions
| Date | Channel | Row | Decision (accepted fix / own fix / overruled) | Reason | By |
```

## 5. Gate 2: the human decides

Walk the fixes channel by channel. For each: **accept the fix, write your own, or overrule the gate.** Apply accepted fixes to a new version of the draft (`<channel>-v2.md`), never to the original. Record every decision in the Decisions table with the reason. An overrule needs a reason; say so.

When every draft is SHIP, or every remaining flag is overruled, set `status: closed`, update this campaign's row in `projects/campaigns/campaigns.md` (create the board from `frameworks/campaigns-board.md` if it is missing; example campaigns go in its Examples section) with stage `reviewed` and the Gate 2 summary, and say what the human does next: load the drafts into the tools, run the test submission, start the campaign. Loading is theirs; this command never writes to a connected tool.

## 6. Learn from it

- Three overrules of the same row across campaigns means the weight is wrong, not the drafts: suggest `/quality-gate` and name the row.
- A fail that the gate did not have a row for: suggest the row, with the line from this review that taught it.
- When the campaign is live, `/campaigns running <slug>`; when it ends, `/campaigns close <slug>` records the result and the lesson the next brief reads.

In `example` mode, stop after step 4 and say the dry run ends with the scorecard; Gate 2 is theirs to practise on their own campaign.
