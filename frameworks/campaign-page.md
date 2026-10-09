---
type: framework
used_by: /campaign-brief, /campaign-channels, /campaign-draft, /campaign-review, /campaigns
tags: [campaign-engine, campaign-page, sharing]
---

# Campaign page

One shareable page per campaign. Each step adds or updates its own tab, so the brief, the channels, the drafts, the review and the results end up in one place you can send to a teammate, a manager or sales.

Template: `frameworks/campaign-page-template.html`. Copy its `<style>` and `<script>` unchanged; fill only the `{{...}}` slots. When publishing as an Artifact, drop the `<!doctype>`, `<html>`, `<head>` and `<body>` tags and keep everything inside them, `<title>` first: the Artifact adds its own skeleton.

**Worked example:** the November AI Native Marketer sprint page in the CXL vault.

## When it is offered

At the end of `/campaign-brief`, after the approve question is answered, ask once: **"Want a page for this campaign you can share? Each step adds a tab to it. 1 Yes · 2 No"**.

- **Yes:** build the page with the Brief tab filled and the other tabs showing "Not started yet". Record where it lives in the brief's frontmatter as `page:` (the Artifact link, or the file path).
- **No:** record `page: none`. Never ask again for this campaign.

Every later command checks `page:`. If there is one, it updates its own tab and the header at the end of its run, without asking, and ends its reply with the link. If it is `none`, it does nothing.

## Where it goes

- **The Claude app, Cowork, or Claude Code with Artifacts:** publish as a private Artifact titled "<Campaign name>". Each update republishes to the same link, so the link never changes.
- **Anywhere else:** write `projects/campaigns/<slug>/page.html` and give the path. It opens in any browser and can be emailed.

The campaign board (`/campaigns`) links each campaign to its page.

## What goes in each tab

Short, like everything this engine writes. The page is a view of the files, not a copy of them: the files stay the source.

| Tab | Filled by | Shows |
|---|---|---|
| **Brief** | `/campaign-brief` | The At a glance block as a card, then sections 1 to 9 as a compact grid. Evidence and the Gate 1 table folded. Never decision-model results |
| **Channels** | `/campaign-channels`, `/campaign-draft` | A sub-tab per channel. In each: the tools as pills; the workflow folded ("Workflow: 14 steps"), one pill per step for who does it; then **every piece of content folded on its own** (each `###` under the draft's `## Pieces`: one email, post, Short, sequence, ad set); then "Plan and notes" folded |
| **Review** | `/campaign-review` | The At a glance card; the scores table (Claude, and Jev and Clef when they ran); then **one list of recommendations** with a switch to group it by step, by channel or by piece. Each recommendation shows where, the problem, who flagged it, and a starter prompt with a Copy button. Scores by channel, dismissed model flags and the decisions log folded underneath |
| **Results** | `/campaigns close` | KPI against target, what worked, what did not, the lesson |

**Header:** the campaign name, the KPI line ("70 sales by 10 Nov · 12 so far"), the stage bar (seven stages: brief, approved, channels set, drafted, reviewed, running, closed), and the date updated.

**Pills** are capped at about 14 characters wide; longer text is cut with an ellipsis and shown in full in the `title` tooltip. One pill per workflow step, for who does it. Notes never go in a pill.

**Reading a workflow file:** only the rows of its `## Steps` table are steps. Never read the "Changes from the version it was based on" table as steps.

## Rules

- No personal data on the page: no lead names or email addresses, ever. Companies and segments only.
- Never put the rep-only flags (missing data, assumptions, verify before sending) in a tab that might reach a prospect. They go in the Review tab, under a heading "For the team only".
- Example and practice campaigns can have a page; title it "Practice: <name>".
- The visual style is CXL's web system (Work Sans 900 headings, Lato body, teal, red, beige, black, white). Do not restyle.
- No em dashes.
