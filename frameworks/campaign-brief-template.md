---
type: framework
source: CXL Campaign Engine workshop. Sections 1 to 9 distilled from six small-c briefs and sections 10 to 15 from three big-C plans shared by Tyler Durman; channel craft from CXL courses (see frameworks/quality-gate.md for the full source list)
used_by: /campaign-brief, /campaign-draft, /campaign-review
tags: [campaign-engine, brief]
---

# Campaign brief template

The brief holds **decisions only, no copy.** Copy lives in the drafts, so the brief stays reviewable in five minutes and gives the quality gate something to check drafts against. Sections 1 to 9 apply to every campaign. Sections 10 to 15 are filled only when the campaign is classified big-C.

Every line traces to an input: a file in `raw/campaigns/`, the brand brain in `wiki/brand/`, a connected tool, or the user's own answer. Anything else is tagged **(inferred)**. Metrics, customers, quotes and case studies are never generated: missing means blank.

## Small-c or big-C

Two kinds of campaign, one brief shape. **Small-c** is tactical: one goal, one number, two or three channels, one offer, an approach that fits in a sentence, a timeframe of weeks. **Big-C** is strategic: a revenue, pipeline or category goal, many channels plus sales, PR or events, one or two quarters, a goal tree and pipeline math. A big-C plan does not replace small-c briefs; it spawns them (section 14).

**Classification rule (confirm at Gate 1):** the goal decides. Propose big-C when the goal is strategic (trigger 1) **and** at least one of triggers 2 to 5 also holds. A tactical goal stays small-c however many channels it uses; Tyler Durman's own six-campaign vertical brief and four-campaign ads funnel were both small-c because each had one tactical goal (meetings, demo requests).

| # | Trigger | Big-C when |
|---|---|---|
| 1 | Goal (decides) | Revenue, pipeline or category, not a single action (a demo, a download, a signup, a meeting count) |
| 2 | Timeframe | Longer than 8 weeks |
| 3 | Segments | More than one segment, or more than one program |
| 4 | Channels | Four or more channel types |
| 5 | Teams | Needs sales, product, PR or events, not only marketing |

The engine proposes; the user confirms in the brief review. Classification decides whether sections 10 to 15 are filled and whether `/campaign-draft` drafts channels (small-c) or spawns small-c briefs (big-C).

## The file

**Length.** Above the Evidence section, a small-c brief fits on one screen: about 300 words. Each field is one line; a list has three lines at most. Reasoning, maths, baselines and long source notes go to Evidence. Source tags in the fields are short: `(Metorik)`, `(icp.md)`, `(your answer)`; the full path is in Evidence or `sources`.

```markdown
---
type: campaign-brief
campaign: <slug>
scale: small-c | big-C
status: draft | approved | running | closed    # approved only after Gate 1, by a human
owner:
approved_by:
approved_on:
dates: { start: "", end: "" }
page:                   # the campaign page link or path, or none (asked once at the end of /campaign-brief)
channels: []            # proposed here, confirmed in /campaign-channels
sources: []             # files, brain files, tool pulls with date range, user answers
tags: [campaign]
---

# <Campaign name>

## At a glance
<!-- Six lines. Someone who reads only this knows what is decided. -->
- **Goal:** <KPI, number, date> · **Scale:** <small-c | big-C>, <the reason in a few words>
- **Who:** <who it is for> · **Not for:** <the main exclusion>
- **Offer:** <what they get> → **CTA:** <the one action>
- **Angle:** <the lead angle, one line>
- **Channels:** <list>
- **Gate 1:** <passes / what still fails>

## 1. Goal
- **KPI:** <one action, counted>
- **Target:** <number> by <date>
- **Baseline:** <today's number> (<source tag>)

## 2. Approach
<One sentence: get [who] to [do what] by [mechanism].>

## 3. Audience
- **Include:** <up to 3 lines, one segment each>
- **Exclude:** <up to 3 lines>
- **Size:** <about N> (<source tag>)

## 4. Offer
- **Offer:** <one line>
- **Destination:** <page; one per offer, two at most>
- **CTA:** <the one action>

## 5. Messaging
| # | Angle | Proof |
|---|---|---|
| 1 | <one line> | <one line, or (no proof)> |

## 6. Buying stage
- **Stage:** <one stage>
- **Their words:** "<one quote>" (<source tag>)
- **Weighing against:** <up to 3 alternatives they would choose instead: a named competitor, doing it themselves, doing nothing> (<source tag>)

## 7. Sales handoff
- **Lead:** <what counts>
- **Handoff:** <who, where, how fast>

## 8. Measurement
- **Tracking:** <one line>
- **Kill rule:** <number> by <date>
- **Scale rule:** <number> by <date>

## 9. Constraints
- **Budget:** <total, and the paid channels' share; or "not set"> (<source tag>)
<Up to 3 more lines: deadlines, events running at the same time, claims that need sign-off, assets missing.>

<!-- Sections 10 to 15: big-C only -->

## 10. Goal tree
- **Lagging goal:** <!-- revenue, pipeline, category position -->
- **KPI:** <!-- the number this plan is accountable for -->
- **Leading indicators:** <!-- the weekly numbers that predict the KPI -->

## 11. Pipeline math
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

## 12. TAM check
IF [the segment is this size] AND [we can reach this share at this conversion] THEN [the goal is reachable / not reachable]. State the numbers and their source.

## 13. Journey map

| Stage | The buyer's thought | Content or touch | Channel | Owner |
|---|---|---|---|---|
| | | | | |

## 14. Architecture
The programs this plan runs, in phases. Each program becomes a small-c brief in `projects/campaigns/`.

| Phase | Program (small-c brief) | Goal | Dates | Status |
|---|---|---|---|---|
| 1 | | | | not started |

## 15. Team and budget
- **Roles and responsibilities:** <!-- who owns what, including sales, product, PR, events -->
- **Budget by program:**
- **Expected return:** <!-- against the pipeline math -->

## Evidence
<!-- Everything that supports the lines above and does not fit on one line: baselines in full, the maths behind the target, list sizes and how they were counted, past results, quotes, open questions. One bullet each, with its source. The only place where long goes. -->

-

## Gate 1 check
Filled by /campaign-brief before asking for approval. See frameworks/quality-gate.md, "Gate 1".

| Check | Pass? | Note |
|---|---|---|
| One KPI, a number, a date | | |
| Approach fits one sentence | | |
| Audience has exclusions | | |
| Every angle has proof, or is marked (no proof) | | |
| Buying stage is stated, with the buyer's thought | | |
| Offer passes the "would they miss it" test | | |
| Handoff rule names a person, a place and a time | | |
| Kill rule has a number and a date | | |
| Budget is stated, or "not set" with no paid channel | | |
| The alternatives they weigh are named | | |

## Sources

-

## Open (inferred) tags

-
```
