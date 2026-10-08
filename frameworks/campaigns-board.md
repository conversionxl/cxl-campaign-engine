---
type: framework
used_by: /campaigns, /campaign-brief, /campaign-channels, /campaign-draft, /campaign-review
tags: [campaign-engine, campaigns, board]
---

# Campaigns board

`projects/campaigns/campaigns.md` is the list of every campaign this repo has run or is running, one row each. Every Campaign Engine command updates its row when it changes a campaign's stage. `/campaigns` reads it, refreshes it, and renders it as a page.

## Stages

| Stage | Set when | Next command |
|---|---|---|
| `brief` | `/campaign-brief` writes a draft brief | `/campaign-brief <slug>` to finish and approve |
| `approved` | You approve the brief at Gate 1 | `/campaign-channels <slug>` |
| `channels set` | `/campaign-channels` writes the campaign's workflows | `/campaign-draft <slug>` |
| `drafted` | `/campaign-draft` writes the drafts | `/campaign-review <slug>` |
| `reviewed` | `/campaign-review` closes Gate 2 | Load the drafts, start the campaign, then `/campaigns running <slug>` |
| `running` | You say it is live | `/campaigns refresh` to pull the KPI |
| `closed` | `/campaigns close <slug>`: the result and the lesson are recorded | The next brief reads `results.md` |

## The file

```markdown
---
type: campaigns-board
last_updated: ""
---

# Campaigns

| Campaign | Scale | Stage | KPI | Target | Actual | Dates | Channels | Gate 2 | Next |
|---|---|---|---|---|---|---|---|---|---|
| [agency-upgrade](agency-upgrade/brief.md) | small-c | drafted | Demos booked | 25 by 31 Oct | | 7 to 31 Oct | email-sequence, sales-enablement, landing-page | | `/campaign-review agency-upgrade` |

## Closed

| Campaign | KPI | Target | Actual | Lesson | Closed |
|---|---|---|---|---|---|
```

- **Campaign** links to the brief. **Gate 2** is the review's summary (for example "3 SHIP, 1 REVIEW") with a link to `review.md`.
- **Actual** is blank until a result is pulled or entered, and always says where it came from (a snapshot in `raw/campaigns/live/` or "entered by you, date").
- Example and practice campaigns (`example-*`, `practice-*`) get their own section, **Examples**, so they never mix with real ones.
- A big-C plan is a row too; its small-c children are rows below it, with the parent's slug in front (`h2-plan / phase-2-upgrade`).

## The page

`/campaigns` renders the board as one self-contained HTML page in the CXL web styling: Work Sans 900 headings, Lato body, the teal, red, beige, black and white tokens, cards at 8 to 16 px radius. One card per active campaign, showing the stage as a progress bar across the seven stages, the KPI against the target, the channels as pills, the Gate 2 result, and the next command. Closed campaigns as a table below, with their lessons. No em dashes.

Where it goes:
- **Claude app, Cowork, or Claude Code with the Artifact tool:** published as a private Artifact titled "<Brand> Campaigns". Each refresh republishes to the same link. The link is recorded at the top of `campaigns.md`.
- **Anywhere else:** written to `projects/campaigns/campaigns.html`, to open in a browser.

The Markdown file is always the source of truth. The page is a view of it.
