---
type: framework
source: CXL Campaign Engine workshop. Sections 1 to 7 distilled from six small-c briefs shared by Tyler Durman, reorganised in 0.10.0 from cohort feedback (a member's structure review, 21 Oct 2026, and the demo reviews of 19 Oct 2026); sections 8 to 13 from three big-C plans shared by Tyler Durman; channel craft from CXL courses (see frameworks/quality-gate.md for the full source list)
used_by: /campaign-brief, /campaign-draft, /campaign-review
tags: [campaign-engine, brief]
---

# Campaign brief template

The brief holds **decisions only, no copy.** Copy lives in the drafts, so the brief stays reviewable in five minutes and gives the quality gate something to check drafts against. Sections 1 to 7 apply to every campaign. Sections 8 to 13 are filled only when the campaign is classified big-C.

The seven sections answer seven questions, in order: what are we trying to achieve, and how will we know early (1)? Who are we targeting (2)? What are we offering, and why should they believe it (3)? How do we say it (4)? Where and when does it reach them, and is that enough to hit the goal (5)? What does sales do with a lead (6)? What limits us (7)?

Every line traces to an input: a file in `raw/campaigns/`, the brand brain in `wiki/brand/`, a connected tool, or the user's own answer. Anything else is tagged **(inferred)**. Metrics, customers, quotes and case studies are never generated: missing means blank.

**How-to stays out of the brief.** UTM conventions, tracking setup, test submissions and character limits live in each channel's workflow. The brief says what is decided; the workflow says how it is done.

**Briefs written before 0.10.0** use the earlier nine sections (Approach, Messaging with angles, Buying stage, Measurement, Evidence). Read them by section name. Never restructure one unless the user asks; when they do, move each line to its new section and change no decision.

## Small-c or big-C

Two kinds of campaign, one brief shape. **Small-c** is tactical: one goal, one number, two or three channels, one offer, a timeframe of weeks. **Big-C** is strategic: a revenue, pipeline or category goal, many channels plus sales, PR or events, one or two quarters, a goal tree and pipeline math. A big-C plan does not replace small-c briefs; it spawns them (section 12).

**Classification rule (confirm at Gate 1):** the goal decides. Propose big-C when the goal is strategic (trigger 1) **and** at least one of triggers 2 to 5 also holds. A tactical goal stays small-c however many channels it uses; Tyler Durman's own six-campaign vertical brief and four-campaign ads funnel were both small-c because each had one tactical goal (meetings, demo requests).

| # | Trigger | Big-C when |
|---|---|---|
| 1 | Goal (decides) | Revenue, pipeline or category, not a single action (a demo, a download, a signup, a meeting count) |
| 2 | Timeframe | Longer than 8 weeks |
| 3 | Segments | More than one segment, or more than one program |
| 4 | Channels | Four or more channel types |
| 5 | Teams | Needs sales, product, PR or events, not only marketing |

The engine proposes; the user confirms in the brief review. Classification decides whether sections 8 to 13 are filled and whether `/campaign-draft` drafts channels (small-c) or spawns small-c briefs (big-C).

## The file

**Length.** Above the Sources section, a small-c brief fits on one screen: about 350 words. Each field is one line; a list has three lines at most. Reasoning, maths, baselines and long source notes go to Sources. Source tags in the fields are short: `(Metorik)`, `(icp.md)`, `(your answer)`; the full path is in Sources.

**The cold-colleague test.** A colleague who reads only this brief can say what the offer is worth to the buyer and what the key message is, without asking. So the brief holds no raw answers to the engine's questions, no internal labels and no undefined terms.

```markdown
---
type: campaign-brief
campaign: <slug>
scale: small-c | big-C
run: full | fast           # full: Claude stops at every step you own; fast: Claude makes those calls and lists them for Gate 2
status: draft | approved | running | closed    # approved only after Gate 1, by a human
owner:
approved_by:
approved_on:
dates: { start: "", end: "" }
page:                   # the campaign page link or path, or none (asked once at the end of /campaign-brief)
parent: none            # the main campaign's slug if this is a sub-campaign (frameworks/linked-campaigns.md)
links: []               # campaigns alongside: - { campaign: <slug>, relation: feeds | fed-by | shares-audience | alongside, note: "" }
channels: []            # proposed here, confirmed in /campaign-channels
sources: []             # files, brain files, tool pulls with date range, user answers
tags: [campaign]
---

# <Campaign name>

## At a glance
<!-- Seven lines. Someone who reads only this knows what is decided. The engine writes every draft from these lines, so a weak offer or key message here weakens every piece. -->
- **Goal:** <KPI, number, date> · **Scale:** <small-c | big-C>, <the reason in a few words>
- **Who:** <who it is for> · **Not for:** <the main exclusion>
- **Offer:** <what they get> → **CTA:** <the one action>
- **Why take it now:** <what it is worth to them, and why now rather than any time>
- **Why us:** <why this over the main alternative, in a few words>
- **Key message:** <the buyer's reason to take the offer, one line>
- **Channels:** <list> · **Gate 1:** <passes / what still fails>

## Linked campaigns
<!-- Leave out when it stands alone. Names only; each campaign's details stay in its own brief. -->
- **Part of:** <main campaign, and the goal of it this one serves> or none
- **Sub-campaigns:** <slugs, one line each with their goal> or none
- **Alongside:** <slug: relation, one line> or none

## 1. Goal and metrics
- **KPI:** <one action, counted> · **Counted by:** <the event and the tool that records it>
- **Target:** <number> by <date>
- **Baseline:** <today's number> (<source tag>)
- **Grounded in:** <the past campaign, send or page that shows this target, offer or window can work> (<source tag>), or "no past data" with the reasoning in Sources, tagged (inferred)
- **Leading metrics:** <up to 3 numbers that move before the KPI: page visits, CTA clicks, ad click-through rate, email clicks, replies>

| Rule | Leading metric | Threshold | Check date | Action |
|---|---|---|---|---|
| Kill | <metric> | <below N> | <date, well before the goal date> | <what stops or changes> |
| Scale | <metric> | <ahead of pace: for example half the goal by the halfway point> | <date> | <what gets more budget or volume> |

## 2. Audience
- **Include:** <up to 3 lines, one segment each>
- **Exclude:** <up to 3 lines>
- **Size:** <about N> (<source tag>)
- **Buying stage:** <one stage> · **Their words:** "<one quote>" (<source tag>)
- **Weighing against:** <up to 3 alternatives they would choose instead: a named competitor, doing it themselves, doing nothing> (<source tag>)

## 3. Offer and proof
<One sentence: get [who] to [do what] by [offer].>

- **What they get:** <one line>
- **Why it is worth their time:** <one line, in the buyer's terms>
- **Why now:** <the trigger: a price change, a deadline, an event, a stage entry> (<source tag>)
- **Destination:** <page; one per offer, two at most; with more than one, each page gets its own section in the draft and on the campaign page>
- **CTA:** <the one action>

| Alternative | Why choose this offer over it |
|---|---|
| <from Weighing against> | <one line> (<source tag>, or (inferred)) |

**Proof** (supports the offer; the drafts may use only these):

| # | Proof | Source |
|---|---|---|
| P1 | <a number, a customer, a quote you may use> | <source tag> |

## 4. Messages
- **Key message:** <why the buyer should take the offer, in their terms: not how the product works, not a product description, not the story of the content>
- **Supporting messages:** <up to 4, each one line, each citing the proof it rests on (P1, P2) or marked (no proof)>

| Segment | Leads with | Why it lands for them |
|---|---|---|
| <from Include> | <supporting message number> | <one line, from their words> |

## 5. Campaign structure
<!-- What the campaign consists of, worked back from the goal. Not an execution plan: the steps live in each channel's workflow. -->

| Channel | Touchpoints | Assets | Weekly volume | Expected step conversion |
|---|---|---|---|---|
| <email> | <4 sends over 2 weeks> | <4 emails> | <2 sends to N> | <click N%, page to KPI N%> (<source tag>, or (inferred)) |

- **The math:** <weekly volume × step conversions = the target, or the gap and what closes it>
- **Paid channels:** <per paid channel: spend, return target (cost per KPI action), and the learning-phase runway before the goal date> or "none"
- **Sense check:** <how the goal compares with the size of the market and with what the team can deliver in the time>

## 6. Sales handoff
- **Lead:** <what counts as a lead, the qualification criteria> (agreed with <sales owner> in writing, or (inferred))
- **Handoff:** <who is alerted, where, how fast>
- **What sales does with it:** <the next action, the asset they use, and what counts as done>

## 7. Constraints
- **Budget:** <total, and the paid channels' share; or "not set"> (<source tag>)
<Up to 3 more lines: deadlines, events running at the same time, claims that need sign-off, assets missing.>

<!-- Sections 8 to 13: big-C only -->

## 8. Goal tree
- **Lagging goal:** <!-- revenue, pipeline, category position -->
- **KPI:** <!-- the number this plan is accountable for -->
- **Leading indicators:** <!-- the weekly numbers that predict the KPI -->

## 9. Pipeline math
Gap ÷ average contract value × pipeline coverage = opportunities needed. Then back out meetings, MQLs and reach using the current conversion rates (from the CRM or `raw/performance/`; blank if unknown).

| Step | Number | Source |
|---|---|---|
| Revenue gap | | |
| Average contract value | | |
| Pipeline coverage ratio | | |
| Opportunities needed | | |
| Meetings needed (at __% opp rate) | | |
| MQLs needed (at __% meeting rate) | | |
| Reach needed (at __% MQL rate) | | |

## 10. TAM check
IF [the segment is this size] AND [we can reach this share at this conversion] THEN [the goal is reachable / not reachable]. State the numbers and their source.

## 11. Journey map

| Stage | The buyer's thought | Content or touch | Channel | Owner |
|---|---|---|---|---|
| | | | | |

## 12. Architecture
The programs this plan runs, in phases. Each program becomes a small-c brief in `projects/campaigns/`.

| Phase | Program (small-c brief) | Goal | Dates | Status |
|---|---|---|---|---|
| 1 | | | | not started |

## 13. Team and budget
- **Roles and responsibilities:** <!-- who owns what, including sales, product, PR, events -->
- **Budget by program:**
- **Expected return:** <!-- against the pipeline math -->

## Sources
<!-- Everything that supports the lines above and does not fit on one line: baselines in full, the maths behind the target, list sizes and how they were counted, past results, quotes, open questions. One bullet each, with its source. Then the full list of files, brain files, tool pulls and answers used. The only place where long goes. -->

-

## Gate 1 check
Filled by /campaign-brief before asking for approval. One row per Gate 1 check in frameworks/quality-gate.md, "Gate 1".

| # | Check | Pass? | Note |
|---|---|---|---|
| 1 | | | |

## Open (inferred) tags

-
```
