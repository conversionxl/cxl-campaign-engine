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
channels: []            # from projects/campaign-engine/workflows/
sources: []             # files, brain files, tool pulls with date range, user answers
tags: [campaign]
---

# <Campaign name>

## 1. Goal
One KPI, a number, a date. Not three KPIs. Not "awareness".
- **KPI:**
- **Target number:**
- **By:**
- **Baseline and source:** <!-- where the current number comes from -->
- **Why this number:** <!-- the math or the history behind it -->

## 2. Approach
One sentence: get [who] to [do what] by [mechanism].

## 3. Audience
From `wiki/brand/icp.md` when it exists. Otherwise collected here and tagged (inferred).
- **Include:** <!-- segment, role, company type and size, buying context -->
- **Exclude:** <!-- who this is not for: the negative ICP, existing customers, wrong stage -->
- **Named accounts or list:** <!-- ABM: the account list and its source -->
- **Size:** <!-- how many people or accounts, and where the number comes from -->

## 4. Offer
- **Asset or offer:** <!-- what they get -->
- **Destination:** <!-- the page or place the CTA lands -->
- **CTA:** <!-- the one action -->
- **Why they would miss it:** <!-- the test: would the segment forward it to a colleague? -->

## 5. Messaging
Three to five angles, each with proof. Proof comes from `wiki/brand/positioning-messaging.md` (proof points row) or a file in `raw/`. An angle with no proof is marked (no proof) and the draft may not state it as fact.

| # | Angle | Proof | Source |
|---|---|---|---|
| 1 | | | |

- **Owned key message used:** <!-- from the hub, verbatim -->
- **Differentiation claim:** <!-- what makes this true of us and not the alternatives -->

## 6. Buying stage
- **Stage:** <!-- unaware / problem aware / solution aware / product aware / most aware, or the team's own stage names -->
- **The buyer's thought, quoted:** <!-- "I ..." in their words, from raw/voc/ or the ICP -->
- **What moves them to the next stage:**

## 7. Sales enablement
- **Lead definition:** <!-- MQL, meeting, hand-raise; what counts -->
- **Handoff rule:** <!-- who is alerted, where, how fast (e.g. MQL called within one working day) -->
- **Rep briefing needed:** yes / no
- **Sequence and talk track needed:** yes / no
- **Owner on the sales side:**

## 8. Measurement
- **Tracking:** <!-- UTM convention, conversion events, CRM fields, test submission done -->
- **Report cadence:**
- **Kill rule:** <!-- the number and date at which the campaign stops or changes -->
- **Scale rule:** <!-- the number at which budget goes up -->

## 9. Constraints
- **Assets available:**
- **Brand and voice:** <!-- wiki/brand/voice-guide.md and vocabulary.md, or the rules given -->
- **Legal, compliance, claims that need sign-off:**
- **Budget:**
- **Deadlines and dependencies:**

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

## Sources

-

## Open (inferred) tags

-
```
