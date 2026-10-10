---
type: framework
used_by: /campaign-brief, /campaign-draft, /campaigns, every command that updates a campaign page
tags: [campaign-engine, linked-campaigns]
---

# Linked campaigns

Campaigns rarely run alone. A sprint sits inside a bigger push to own a category, a webinar series feeds the sprint, a product launch shares its audience. This file says how the engine records those relationships, where the folders go, and how the pages show them.

## Three relationships

| Relationship | Means | Where it lives | Recorded as |
|---|---|---|---|
| **Main and sub-campaign** | The sub-campaign is one program of a bigger campaign. Its goal feeds the main campaign's goal | The sub-campaign's folder sits **inside** the main campaign's folder, under `campaigns/` | `parent: <main slug>` in the sub-campaign's brief. The main brief lists its sub-campaigns in "Linked campaigns" (and, for big-C, in section 14) |
| **Alongside** | Two campaigns run in parallel, each with its own goal, and touch each other: one feeds the other, or they share an audience or dates | Each in its **own folder**, side by side | A `links:` entry on **both** briefs, with the relation |
| **None** | Stands alone | Its own folder at the top | `parent: none`, `links: []` |

Relations for `links:`:
- `feeds`: this campaign sends people to the other one (the webinar series feeds the sprint).
- `fed-by`: the reverse. Every `feeds` on one brief is a `fed-by` on the other.
- `shares-audience`: the same people get both in the same weeks. Decide who sends what, and when.
- `alongside`: same dates or same team, no direct flow.

**Two levels only.** A main campaign holds sub-campaigns; a sub-campaign does not hold its own. Anything deeper is a sub-campaign with `links:` to its neighbours. This keeps every path readable.

**Usually the main campaign is big-C and its sub-campaigns are small-c**, because a big-C plan spawns small-c programs (template section 14). A small-c campaign can still be a main campaign with one or two subs, for example a launch with a separate partner push.

## Folders

```
projects/campaigns/
  campaigns.md                                  the board, every campaign at every level
  cxl-ai-native-leader/                         main campaign (big-C)
    brief.md                                    lists its sub-campaigns
    campaigns/
      ai-native-sprint-nov26/                   sub-campaign (small-c), parent: cxl-ai-native-leader
        brief.md  workflows/  drafts/  review.md  results.md
      webinar-series-nov26/                     sub-campaign, links: feeds ai-native-sprint-nov26
        brief.md ...
  q4-partner-launch/                            stands alone, or alongside via links:
    brief.md ...
```

- **Slugs are unique across the whole board**, at every level, so a slug is enough to find a campaign.
- **Finding a campaign folder:** read the board; its Campaign link gives the folder. Not on the board: search `projects/campaigns/` for the `brief.md` whose frontmatter says `campaign: <slug>`. Every command that says `projects/campaigns/<slug>/` means this folder, nested or not.
- **Main campaign folders hold only their own files** (brief, review, results, page) plus `campaigns/`. A sub-campaign's drafts never sit in the main folder.

## Frontmatter

On every brief:

```yaml
parent: none              # the main campaign's slug, or none
links: []                 # campaigns alongside, one entry each:
#  - campaign: webinar-series-nov26
#    relation: fed-by     # feeds | fed-by | shares-audience | alongside
#    note: registrants get the sprint as the next step
```

Sub-campaigns are not listed in the frontmatter: they are the folders in `campaigns/`. The brief's "Linked campaigns" section names them for a reader.

## The brief asks

`/campaign-brief` asks once, after the goal and before drafting (show the board's active campaigns as numbered choices):

> **Linked campaigns.** 1 Is this part of a bigger campaign? 2 Will it have sub-campaigns of its own? 3 Does anything run alongside it: feeding it, fed by it, or reaching the same people in the same weeks?

Then:
- **Read every linked brief** before drafting: the main campaign's goal tree and audience, each neighbour's audience, dates, offer and kill rule. A number from a linked brief is cited to that brief.
- **Shared audience:** if two campaigns reach the same people in overlapping weeks, the brief's Constraints say who sends what and the combined cadence. Never let two campaigns each plan four sends a week to the same list without saying so.
- **The main campaign does not exist yet:** offer to start it as a draft stub (name, goal in one line, `scale: big-C`, `status: draft`) so the sub-campaign has a home. On a yes, create the main folder and put this campaign inside it. The stub is finished later with `/campaign-brief <main slug>`.
- **A neighbour does not exist yet:** record the link with the slug it will have, and say "not briefed yet" on the page.
- **Write both sides.** A link added here is added to the other brief too (`feeds` here, `fed-by` there), with a one-line note. Say so.

## Moving a campaign

A campaign that gains a main campaign after it started has to move inside it. **Propose before moving:** show the old and new paths and ask. On a yes, move the whole folder with `git mv` when the folder is a git repo, set `parent:`, fix the board link, and update both pages. Never move without a yes. The `page:` link does not change.

## The board

`projects/campaigns/campaigns.md` shows families together: a main campaign's row, then its sub-campaigns indented below it with `↳`, then the campaigns that stand alone. A **Links** column lists the alongside relations (`feeds webinar-series-nov26`). `/campaigns` checks that every `feeds` has its `fed-by`, every `parent:` folder exists, and every sub-campaign sits inside its parent's folder, and says in one line what it fixed or what needs a yes.

## The page

Every campaign page shows its family, so one link leads to all of them.

- **Header:** the scale badge next to the title (`small-c` or `big-C`, always), then one line under it: "Part of: <main> · Sub-campaigns: <a>, <b> · Alongside: <x> (feeds this)". Each name links to that campaign's page when it has one; otherwise it shows the name and "not briefed yet" or "no page".
- **Linked tab** (shown whenever the campaign has a parent, sub-campaigns or links): one card per linked campaign, grouped as Main campaign, Sub-campaigns, Alongside. Each card: name with its scale badge, the relation in plain words, stage bar, KPI against target, dates, and the link to its page.
- **A main campaign's page holds all its sub-campaigns.** Its Linked tab carries every sub-campaign's card, and its Results tab rolls their KPIs up against the main goal tree. Whenever a command updates a sub-campaign's page, it also refreshes that sub-campaign's card on the main campaign's page (and on each alongside campaign's page), without asking.

## Rules

- One fact, one place: a sub-campaign's details live in its own brief; the main campaign links to it and never copies it.
- Links are symmetric. A link on one brief and not on the other is a defect `/campaigns` reports.
- Never invent a linked campaign's numbers. Missing means blank and "not briefed yet".
- No em dashes.
