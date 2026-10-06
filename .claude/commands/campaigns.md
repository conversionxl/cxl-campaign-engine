---
description: The Campaign Engine board. See every campaign, its stage, KPI against target, channels and next step; refresh results from connected tools; mark a campaign running or closed; render the board as a page.
argument-hint: [refresh | running <slug> | close <slug> | page]
---

# /campaigns

The board for every campaign in this repo. Read `frameworks/campaigns-board.md` first (with the plugin and no local copy, `${CLAUDE_PLUGIN_ROOT}/frameworks/campaigns-board.md`).

## No argument: show the board

1. Read `projects/campaigns/campaigns.md`. If it is missing, create it from the framework.
2. **Reconcile it with the folders.** For every folder in `projects/campaigns/`, check its files and set the stage the files prove: `brief.md` with `status: draft` is `brief`; `approved` is `approved`; a `workflows/` folder is `channels set`; a `drafts/` folder is `drafted`; `review.md` with `status: closed` is `reviewed`; `results.md` is `closed`. Add rows for folders the board does not list. Never move a stage backwards without saying why. Say in one line what you corrected.
3. Show the active campaigns as a table, then the closed ones, then the examples. For each active campaign, the next command to run.
4. Render the page (below).

## `refresh`

For every campaign at `running`:
1. Read the brief's KPI, the tracking in section 8, and the tools it names.
2. Say which of those tools this session can reach. For each, propose the read-only pull that answers the KPI over the campaign's dates (demos booked from the CRM by campaign source; replies and clicks from the email tool; leads and cost from the ad account). Wait for a yes.
3. Save each pull to `raw/campaigns/live/<slug>-<tool>-<date>.md` with the tool, the query, the date range and today's date at the top. Aggregates only, no personal data.
4. Write the number into the board's **Actual** with the snapshot path. A tool that is not connected: ask the user for the number, or leave it blank.
5. Check each against the brief's kill rule and scale rule. If one has tripped, say so plainly at the top: "agency-upgrade: 4 demos by 21 Oct against a kill rule of 8. The brief says stop or change." The decision is the user's.

Then render the page.

## `running <slug>`

Ask for the launch date and confirm the channels that went live (some may have been cut after Gate 2). Set the stage to `running`, update **Dates**, and render the page.

## `close <slug>`

1. Ask for the final result against the KPI, or offer to pull it as in `refresh`.
2. Ask three questions: what worked, what did not, and **the one lesson the next brief should start from**.
3. Write `projects/campaigns/<slug>/results.md`: the result with its source, the answers, per-channel numbers if known, and the Gate 2 overrules from `review.md` with whether they turned out right.
4. Move the row to **Closed** with the lesson. Copy `results.md` to `raw/campaigns/results/<slug>.md` so the next `/campaign-brief` reads it.
5. If the lesson points at a criterion the gate does not have, or a weight that was wrong, suggest `/quality-gate` and name the row.

## `page`

Render only. The page follows "The page" in the framework: one card per active campaign with a stage progress bar, KPI against target, channel pills, the Gate 2 result and the next command; closed campaigns with their lessons below. Copy the styling rules from the framework; never invent colours.

- If this session can publish an Artifact, publish it privately as "<Brand> Campaigns" (the brand from `wiki/brand/` or the user's "About me"; "My Campaigns" if neither), to the same link every time. Record the link at the top of `campaigns.md`.
- Otherwise write `projects/campaigns/campaigns.html` and give the path.

## Rules

- The Markdown board is the source of truth; the page is a view.
- Read only in connected tools. Never change a campaign in an ad, email or CRM tool.
- No personal data on the board or the page.
- No em dashes.
