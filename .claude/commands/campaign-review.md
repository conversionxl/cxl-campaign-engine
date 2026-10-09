---
description: Campaign Engine step 4, Gate 2. Score every draft with your weighted quality gate, check every piece with the decision models if you use them, and merge it all into one list of recommendations, each with a starter prompt. Wait for the human to accept or overrule.
argument-hint: <campaign slug> [channel ...]
---

# /campaign-review

Step 4 of the Campaign Engine, and Gate 2. The gate recommends; the human accepts or fixes. Nothing ships on vibes, and nothing ships because the gate said so either.

**Keep it short.** Follow "Keep it short" in the `campaign-engine` skill for every reply and file: answer first, eight lines at most, one question at a time, detail in the file.

Read the `quality-gate` skill, then `projects/campaign-engine/quality-gate.md` (the user's tuned copy; fall back to `frameworks/quality-gate.md` only if it is missing, and say so), then the brief, the workflows and the drafts.

## Mode

- **`<slug>`:** reviews every file in `projects/campaigns/<slug>/drafts/`, or only the channels named. Writes `projects/campaigns/<slug>/review.md`; if one exists, `review-v2.md`.
- **`example-agency-upgrade`** (or `example`): the Acme drafts, with the example brain.

## 1. Load

The brief (KPI action, CTA, angles and proof, buyer's thought, exclusions, handoff rule, constraints). Each draft's workflow from `projects/campaigns/<slug>/workflows/` (Specs and Outputs). The brand brain from its recorded source (or example brain). The gate: its rows, each channel's weights, the thresholds, the non-negotiables.

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

## 2b. Second check: decision models (only if `CLAUDE.md` records one)

If `**Decision model:**` is `jev`, `clef` or `both`, check **every piece**, not whole files: each `### ` heading under `## Pieces` in a draft is one piece (older drafts without a Pieces section: one piece per `### ` heading that holds customer-facing copy). Also check the brief's Gate 1 rows.

- **Questions:** `frameworks/quality-gate-questions.json`, one proposition each, asked only for rows with a weight above 0 on the piece's channel. Never send the long "passes when" text: compound questions are less accurate.
- **State:** a short header (the brief's goal, CTA, buyer's thought, and the approved proof as a list), then the piece.
- **Run:** `bash "${CLAUDE_PLUGIN_ROOT}/plugin/decision-model.sh" <jev|clef> <questions.json> <state-file>` per piece and per model. Run the `code_checks` in code (em dashes, banned words, long paragraphs, subject length), not through the model.
- **Save** every answer to `projects/campaigns/<slug>/gate-output.json`: per piece, per row, per model. This file and the review are the only places the results live; the brief never shows them.

## 3. One set of recommendations

Combine Claude's scores, the decision models' answers and the code checks into **one list**. Never show three reports.

| Claude | Models | Result |
|---|---|---|
| Fails a row | any | **Fix.** Claude's sheet is the authority |
| Passes | both fail the same piece and row (under 0.5) | **Check.** Reread that piece. If they are right, it becomes a Fix; if not, dismiss it with a reason in a few words |
| Passes | one fails, or both borderline | Not listed. Kept in `gate-output.json` |
| any | a code check fails | **Fix**, always: these are facts, not opinions |

Without decision models, the list is Claude's fails and the code checks.

Every recommendation is one row with:
- **Where:** the step (Brief, Channels, Drafts, Launch), the channel, and the piece (`Email 6`, `H3`, `S2`, `Talk track`); "all pieces" when it applies to a whole channel.
- **Problem:** one line, quoting the words that fail.
- **Flagged by:** Claude, Jev, Clef, Code (whichever agree).
- **Prompt:** a starter prompt the user can paste back into Claude to make the fix, naming the file and the piece: "In drafts/email-campaign-v2.md, rewrite Email 6's subject line so the 10 Nov date comes first. Keep the angle and stay under 45 characters." One sentence or two. For a Fidelity problem, the prompt cuts or cites the claim, never softens it. For a Goal problem, it attaches the ask where the asset is.

Order the list by step, then channel, then piece. Group it on the page three ways (by step, by channel, by piece) from the same list.

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

## At a glance
<!-- Three lines: how many drafts SHIP / REVIEW / FIX, the one biggest problem, what you decide next. -->

## Summary
| Channel | Claude | Jev | Clef | Route | Recommendations |
<!-- Jev and Clef columns only when they ran. -->

## Recommendations
| # | Step | Channel | Piece | Problem | Flagged by | Prompt |
<!-- One row per recommendation, Fix first, then Check. The prompt is the full starter prompt. -->

## Scores by channel
<!-- Only the rows that lost points, per channel: row, score, note. Every other row scored full marks. With decision models: one line per channel with each model's weighted score beside Claude's. -->

## Dismissed
<!-- Model flags Claude checked and rejected: piece, row, reason. -->

## Decisions
| Date | Channel | Row | Decision (accepted fix / own fix / overruled) | Reason | By |
```

## 5. Gate 2: the human decides

In the chat, show only the summary table (channel, score, route) and the At a glance lines; link the review file for the rest. Then walk the recommendations one at a time, Fix before Check, three short lines each: where, what failed, and **"Your call: 1 Use the fix · 2 Write my own · 3 Leave it as is"**. Offer to run the starter prompt for a Use the fix. Ship-ready drafts are not walked. Say "the other N are fine" and move on. Apply accepted fixes to a new version of the draft (`<channel>-v2.md`), never to the original. Record every decision in the Decisions table with the reason. "Leave it as is" overrules the gate and needs a reason in a few words.

When every draft is SHIP, or every remaining flag is overruled, set `status: closed`, update this campaign's row in `projects/campaigns/campaigns.md` (create the board from `frameworks/campaigns-board.md` if it is missing; example campaigns go in its Examples section) with stage `reviewed` and the Gate 2 summary, and say what the human does next: load the drafts into the tools, run the test submission, start the campaign. Loading is theirs; this command never writes to a connected tool. Then the next step: once it is live, `/campaign-engine:campaigns running <slug>` marks it running on the board. Ask whether it is live yet, and on a yes run it.

## 6. Learn from it

**Campaign page.** If the brief's `page:` is set (not `none`), update the Review tab and the header as `frameworks/campaign-page.md` says, without asking, and end your reply with the link. Rep-only flags go under "For the team only".


- Three overrules of the same row across campaigns means the weight is wrong, not the drafts: suggest `/quality-gate` and name the row.
- A fail that the gate did not have a row for: suggest the row, with the line from this review that taught it.
- When the campaign is live, `/campaigns running <slug>`; when it ends, `/campaigns close <slug>` records the result and the lesson the next brief reads.

In `example` mode, stop after step 4 and say the practice run ends with the scorecard; Gate 2 is theirs to practise on their own campaign. Then the next step: `/campaign-engine:campaign-brief <your campaign>` starts their own. Ask for the campaign's name in a few words and offer to run it now.
