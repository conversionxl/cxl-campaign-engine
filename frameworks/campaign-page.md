---
type: framework
used_by: /campaign-brief, /campaign-channels, /campaign-draft, /campaign-review, /campaigns
tags: [campaign-engine, campaign-page, sharing]
---

# Campaign page

One shareable page per campaign. Each step adds or updates its own tab, so the brief, the channels, the drafts, the review and the results end up in one place you can send to a teammate, a manager or sales.

Template: `frameworks/campaign-page-template.html`. Copy its `<style>` and `<script>` unchanged; fill only the `{{...}}` slots.

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
| **Brief** | `/campaign-brief` | The At a glance block as a card, then sections 1 to 9 as a compact table (field, decision). Evidence folded in a `<details>` "Evidence and sources". Gate 1 result as one line |
| **Channels** | `/campaign-channels` | One card per channel: the steps as a numbered list (step, who), with steps you own marked with a "You" pill. A line per change from the starter |
| **Drafts** | `/campaign-draft` | One `<details>` per channel, closed by default, holding that channel's draft. The decisions you made at each pause, as a short list |
| **Review** | `/campaign-review` | The summary table (channel, score, SHIP / REVIEW / FIX pill), then one `<details>` per channel with its failing rows and fixes. Your Gate 2 decisions |
| **Results** | `/campaigns close` | KPI against target, what worked, what did not, the lesson |

**Header:** the campaign name, the KPI line ("70 sales by 10 Nov · 12 so far"), the stage bar (seven stages: brief, approved, channels set, drafted, reviewed, running, closed), and the date updated.

## Rules

- No personal data on the page: no lead names or email addresses, ever. Companies and segments only.
- Never put the rep-only flags (missing data, assumptions, verify before sending) in a tab that might reach a prospect. They go in the Review tab, under a heading "For the team only".
- Example and practice campaigns can have a page; title it "Practice: <name>".
- The visual style is CXL's web system (Work Sans 900 headings, Lato body, teal, red, beige, black, white). Do not restyle.
- No em dashes.
