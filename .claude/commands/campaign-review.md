---
description: Campaign Engine step 4, Gate 2. Score every draft with your weighted quality gate, check every piece with the decision models if you use them, and merge it all into one list of recommendations, each with a starter prompt. Wait for the human to accept or overrule. Runs automatically at the end of /campaign-draft; run it yourself to score again after editing a draft.
argument-hint: <campaign slug> [channel ...]
---

# /campaign-review

Step 4 of the Campaign Engine, and Gate 2. `/campaign-draft` runs it automatically on the drafts it just wrote; run it on its own to score again after you edit a draft by hand, or to review only some channels. The gate recommends; the human accepts or fixes. Nothing ships on vibes, and nothing ships because the gate said so either.

**Keep it short.** Follow "Keep it short" in the `campaign-engine` skill for every reply and file: answer first, eight lines at most, one round of questions at a time, detail in the file. Draft first, as that skill says.

Read the `quality-gate` skill, then `projects/campaign-engine/quality-gate.md` (the user's tuned copy; fall back to `frameworks/quality-gate.md` only if it is missing, and say so), then the brief, the workflows and the drafts.

**New default rows.** Compare the row IDs in the user's copy with the default gate (`${CLAUDE_PLUGIN_ROOT}/frameworks/quality-gate.md`, or `frameworks/quality-gate.md` in the repo copy). If the default has rows the copy lacks (G17 to G19 arrived in 0.10.0), say so in one line and ask once: "Add them with the default weights? 1 Yes · 2 No". On yes, add only the missing rows and a line in its Changes table; never change a weight, a threshold or a row the user already has. On no, score with the user's copy as it is.

## Mode

- **`<slug>`:** reviews every file in `projects/campaigns/<slug>/drafts/`, or only the channels named. Writes `projects/campaigns/<slug>/review.md`; if one exists, `review-v2.md`.
- **`example-agency-upgrade`** (or `example`): the Acme drafts, with the example brain.

## 1. Load

The brief (KPI action, CTA, key message and supporting messages with their proof, alternatives, buyer's thought, exclusions, handoff rule, constraints). Each draft's workflow from `projects/campaigns/<slug>/workflows/` (Specs and Outputs). The brand brain from its recorded source (or example brain). The gate: its rows, each channel's weights, the thresholds, the must-pass rows.

**Assumed calls (fast and balanced modes).** If the brief says `run: fast` or `balanced`, collect every `decisions` entry marked (assumed) from the drafts. They go first in the one list of recommendations, under the step they came from, as "I chose <the call> at step <n>. Keep it, or change it?", each with a starter prompt to change it. The user accepts or changes them at Gate 2 with the rest.

**Pieces built elsewhere.** A draft whose frontmatter lists `external:` links (see "Built elsewhere" in `frameworks/campaign-page.md`): open each link if you can (a public page with the web fetch tool, an image or file in this folder with the file reader) and score what it shows as that piece. If you cannot open it, add one recommendation: "Could not open <link>: paste the copy here or add the file to the campaign folder."

## 2. Score each draft

For every row with a weight above 0 for the draft's channel, give a score of 0, 1 or 2 and a note that quotes the line in the draft that earned it. Rules for the rows that need judgment:

- **Goal:** read every CTA. Does it move the reader to the KPI action? A sequence that ends on the asset, a page whose CTA is the download when the KPI is demos: 0.
- **Fidelity:** list every statistic, customer, quote and case study in the draft. Each must appear in the brief's proof table or in the brain. One invented or unsourced item: 0, and name it. A claim the brief marked (no proof) that is stated as fact: 0.
- **Workflow:** compare against the Outputs list and every Specs row. Count characters and words. A missing output or a spec breach: 1 if minor, 0 if an output is missing.
- **Stage:** read the buyer's thought in the brief; does the copy answer it, at that stage?
- **Voice:** run every Always and Never in the voice guide, every banned word, the AI tells (em dashes, "it's not X, it's Y", stacked adjectives).
- **Consistency:** put the headline, offer and CTA of every draft side by side. Do they agree?
- The remaining rows as the gate's "Passes when" column says.

Compute the weighted score and the route (SHIP, REVIEW, FIX). A 0 on a must-pass row is FIX whatever the total. G21 Compliance is scored only when the brief's Regulated line names a regulated area.

**Then the checks across the campaign** (X1 to X3 in the gate): add up the spend across the drafts and workflows against the brief's budget; put every offer, price, date and trial in the ads and emails beside the landing page; follow every link and button to the brief's destination. Each fail is a Fix, flagged by Code, under the step Drafts and "all pieces".

## 2b. Second check: decision models (only if `CLAUDE.md` records one)

If `**Decision model:**` is `jev`, `clef` or `both`, check **every piece**, not whole files: each `### ` heading under `## Pieces` in a draft is one piece (older drafts without a Pieces section: one piece per `### ` heading that holds customer-facing copy). Also check the brief once, with the questions in `frameworks/brief-gate-questions.json` and the brief as the state.

- **Questions:** `frameworks/quality-gate-questions.json`, one proposition each, asked only for rows with a weight above 0 on the piece's channel. Never send the long "passes when" text: compound questions are less accurate.
- **State:** a header, then the piece. The header carries the brief's goal, CTA, who it is for, buyer's thought, objections, the **Alternatives** (the Weighing against line and the alternatives table, for G19), the **Regulated** line (for G21) and approved proof (as a list, from the proof table), the lines that won and lost in testing, and blocks the value prop rows read: **ICP top priorities** and **ICP** (from `wiki/brand/icp.md`), **Brand voice** (the Always and Never rules from `wiki/brand/voice-guide.md`), **Known terms** (from `wiki/brand/vocabulary.md`) and **Positioning and messaging** (owned key message, pillars, differentiators, alternatives and rules from `wiki/brand/positioning-messaging.md`). Keep each block to its points; the models only see what is in the header.
- **Ads are one piece:** the image text (pill, headline, supporting line, offer line, CTA) and its ad text together, as the platform shows them. Ads use V1A, not V1.
- **Report the value prop rows on their own** beside the total (the VP rows' weighted score, and the want score from VP7: 1 + 2 x the sum of its four answers), so they are not averaged away.
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
- **Prompt:** a starter prompt the user can paste back into Claude to make the fix, naming the file and the piece: "In drafts/email-campaign-v2.md, rewrite Email 6's subject line so the 10 Nov date comes first. Keep the angle and stay under 45 characters." One sentence or two. For a Fidelity problem, the prompt cuts or cites the claim, never softens it. When the problem is missing proof, the recommendation also says how to get it (a customer quote, before-and-after numbers, a source from a parallel industry written as an opinion) or how to lead with the value instead, and adds it to the launch tasks. For a Goal problem, it attaches the ask where the asset is.

Order the list by step, then channel, then piece. Group it on the page three ways (by step, by channel, by piece) from the same list.

**Top three fixes.** Then pick the three recommendations that would change the campaign most, in this order: a must-pass fail; a root problem that repeats across pieces or channels (one fix, many pieces: say how many it touches); then the highest-weighted fail. One line each, with its prompt. These lead the review file, the chat and the page, so the person approving sees the root problems before the full list.

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

## Top three fixes
<!-- Three numbered lines: where, the problem, how many pieces it touches. The prompts are in the Recommendations table. -->

## Summary
| Channel | Claude (self-review) | Jev | Clef | Route | Recommendations |
<!-- Jev and Clef columns only when they ran. Under the table, always this line: "Claude scored drafts it wrote: read its score as a signal, not a check. The decision models and you are the check." -->

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

In the chat, show the At a glance lines and the top three fixes first, then the summary table (channel, Claude's self-review score, the models' scores when they ran, route); link the review file for the rest. Ask: **"1 Walk the top three · 2 Walk all <N> · 3 I'll read the page first"**. In fast and balanced modes, the calls Claude made at the user's steps are walked before anything else. Then walk the recommendations one at a time, Fix before Check, three short lines each: where, what failed, and **"Your call: 1 Use the fix · 2 Write my own · 3 Leave it as is"**. Offer to run the starter prompt for a Use the fix. Ship-ready drafts are not walked. Say "the other N are fine" and move on. Apply accepted fixes to a new version of the draft (`<channel>-v2.md`), never to the original. Record every decision in the Decisions table with the reason. "Leave it as is" overrules the gate and needs a reason in a few words.

When every draft is SHIP, or every remaining flag is overruled, set `status: closed`, update this campaign's row in `projects/campaigns/campaigns.md` (create the board from `frameworks/campaigns-board.md` if it is missing; example campaigns go in its Examples section) with stage `reviewed` and the Gate 2 summary, and say what the human does next: load the drafts into the tools, run the test submission, start the campaign. Offer once: **"Want a load sheet per tool? 1 Yes · 2 No"**. On a yes, write `drafts/load-sheet-<tool>.md` for each tool the workflows name, field by field in the tool's own order (an email tool: from, subject, pre-header, body, button URL with UTMs, segment, suppression, send time; an ad platform: campaign, objective, audience, exclusions, budget, bid, then each ad's fields; a CRM: properties, lists, the workflow trigger and the alert), and a `drafts/creative-handoff.md` for the pieces with a visual: size, image text, what the image shows, the brand's colours and fonts, and the copy beside it, ready for a designer or a design tool. Nothing is loaded by this command.

**Approval handoffs.** When a piece is approved by someone other than the user (a named role in its workflow, such as a sales lead, legal or a designer), write `drafts/handoffs.md`: one short message per person saying what is ready, where it is, what they decide, and by when, for the user to send in Slack or email. The engine never sends it and never ships the piece. If the user says "I'll take it from here" for a channel, mark that channel's draft `handled: outside` and say how to bring the result back: `/campaign-engine:campaigns refresh`, or paste the number. Loading is theirs; this command never writes to a connected tool. Then the next step: once it is live, `/campaign-engine:campaigns running <slug>` marks it running on the board. Ask whether it is live yet, and on a yes run it.

## 6. Learn from it

**Campaign page.** If the brief's `page:` is set (not `none`), update the Content tab and the header: the review summary at the top, each piece's route and review items inside its fold, and the full list folded at the bottom as `frameworks/campaign-page.md` says, without asking, and end your reply with the link. Rep-only flags go under "For the team only".


- Three overrules of the same row across campaigns means the weight is wrong, not the drafts: suggest `/quality-gate` and name the row.
- A fail that the gate did not have a row for: suggest the row, with the line from this review that taught it.
- When the campaign is live, `/campaigns running <slug>`; when it ends, `/campaigns close <slug>` records the result and the lesson the next brief reads.

In `example` mode, stop after step 4 and say the practice run ends with the scorecard; Gate 2 is theirs to practise on their own campaign. Then the next step: `/campaign-engine:campaign-brief <your campaign>` starts their own. Ask for the campaign's name in a few words and offer to run it now.
