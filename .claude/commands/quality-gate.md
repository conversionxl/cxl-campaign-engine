---
description: Tune the Campaign Engine's quality gate to the campaigns you run: add or cut criteria, add channels, change weights and thresholds, learn from your last miss. Optionally write the gate as a Jev or Clef decision-model question set.
argument-hint: [example] [channel]
---

# /quality-gate

The exercise behind Gate 2. The default gate in `frameworks/quality-gate.md` is one B2B demand gen opinion. This command makes `projects/campaign-engine/quality-gate.md` yours.

Read the `quality-gate` skill and both gate files first. If `projects/campaign-engine/quality-gate.md` is missing, copy the default there and say so.

## Mode

- **No argument:** tune the user's gate from their campaigns.
- **`example`:** walk the six tuning questions on Acme Deals, using `raw/campaigns/example/results/` and `sales-feedback-2026-q2.md` as the miss to learn from. Write to `projects/campaign-engine/quality-gate-example.md`, never to the user's gate.
- **`<channel>`:** jump to adding or re-weighting one channel column.

## 1. Show the gate as it stands

The rows, the channel columns, the weights, the thresholds, the non-negotiables, and the Changes table. Say how many campaigns have been reviewed with it (count `review.md` files in `projects/campaigns/`), the lessons recorded in the Closed section of `projects/campaigns/campaigns.md`, and list the rows most often overruled in their Decisions tables, if any.

## 2. Ask about their campaigns

In one message:
1. Which channels do you run that are not columns here? (Check `projects/campaigns/*/workflows/` and `projects/campaign-engine/workflows/` for channels added with `/campaign-channels` and name them.) Which columns do you never use?
2. What did your last campaign that missed fail on? Point to the readout in `raw/campaigns/results/` if there is one, or tell the story.
3. Which check do you find yourself ignoring every time?
4. Which check would have stopped the miss?
5. Who signs off before something ships, and what do they always catch? (Legal? Sales? The founder?)
6. How fast do you ship? Daily, weekly, quarterly?

Wait for the answers.

## 3. Propose the changes

As a table: `change | row or column | before | after | why (their words)`. Cover:
- **Channels:** add a column per missing channel, with a proposed weight per row copied from the closest channel and adjusted; drop columns they never use (set to 0, keep the column, or remove it on their say).
- **Rows:** add a criterion for the miss, with the readout line that taught it in the Source column; cut or down-weight rows they always overrule.
- **Weights:** raise the row that would have stopped the miss to 3, or mark it non-negotiable.
- **Thresholds:** daily shippers may set SHIP at 80%; teams with a sign-off step may start REVIEW at 60% so more reaches the human.
- **Sign-off rows:** whatever the approver always catches becomes a row, weighted 3 on the channels it applies to.

Wait for a yes, with edits.

## 4. Write the gate

Apply the changes to `projects/campaign-engine/quality-gate.md`. Recompute the maximum score per channel. Append a line per change to the Changes table with the date, the reason in their words, and their name. Keep the Source column honest: a row they added says so.

## 5. Optional: a decision-model question set

Ask: "Do you want this gate as a question set a decision model can run on every draft?" Read `frameworks/decision-models.md` first. On a yes:
- Write `projects/campaign-engine/quality-gate-questions.json`: one question per row. Pass or fail rows become `noul`; graded rows become `score` with the levels written out; routing questions (which stage does this read as) become `choice`. Keep the row's wording.
- Put the weights, the thresholds and the non-negotiable floors in a `routing` block in the same file, with a note that they live here, not in the model.
- Say which vendor shape it follows (the Jev API, which Cloudflare's Clef also accepts), that running it needs API access the workshop does not provide, and that the sheet remains the authority.
- Point to the calibration steps in the framework: 20 to 30 labelled past drafts, three runs, flip rate, precision on SHIP.

## 6. Checks

- Could a new teammate read the gate and score a draft the same way you would?
- Is there a row that nobody could fail? Cut it.
- Is there a row that everybody fails? Either the bar is wrong or the workflow is; say which.
- Does every row still have a source, including yours?

Then the file path, and: run `/campaign-review` on the next campaign with the new gate.
