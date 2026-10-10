---
type: framework
source: CXL Campaign Engine workshop. Gate 1 and the first six Gate 2 rows come from Tyler Durman's briefs, plans and feedback (2022 to 2026). The remaining rows and the channel weights draw on CXL course instructors: Jessica Best (Email Marketing Fundamentals), Andy Crestodina (Content Strategy for Demand Generation), Michael Aagaard (Landing Page Optimization), AJ Wilcox (Validate and Scale your LinkedIn Ads), Steve Armenti (Create sales enablement assets with AI), Mason Cosby (ABM, Get ROI in 6 Weeks; Align sales, marketing and leadership), Tycho Luijten (B2B Demand Generation), Louis Grenier (Unique Positioning, Radical Differentiation), plus Nick Christensen's ad scoring. The channel workflows in frameworks/workflows/ cite the same courses step by step. Lesson citations are in the row notes.
used_by: /campaign-brief (Gate 1), /campaign-review (Gate 2), /quality-gate (tuning)
tags: [campaign-engine, quality-gate]
---

# Quality gate

> **A gate that passes everything is not a gate.** This one fails loudly on the things that sank real campaigns, and it is yours to tune: the criteria, the channels, the weights. Setup copies this file to `projects/campaign-engine/quality-gate.md`; edit that copy, by hand or with `/quality-gate`.

Two gates, two moments. **Gate 1** checks the brief before any copy exists. **Gate 2** scores every draft against the brief, the workflow for its channel, and the brand brain. A human decides at both: the gate recommends, you accept or fix.

## The lesson the gate is built around

A 2024 campaign for an HR tech SaaS platform set out to book 5 meetings. It drove 17 downloads, 4 of them qualified, and booked none. LinkedIn cost $371 per lead, Google $70. The team's own readout: "we need a more direct approach", and the fix was a product-based funnel with a four-step email sequence that builds value and then asks for the demo. (Tyler Durman, TAP campaign plan, October 2024. The client stays unnamed.)

Every channel converted on the asset and stopped. Nothing moved the buyer to the goal. That is the failure the **Goal** row exists to catch, and why it is a non-negotiable.

## Gate 1: the brief

Pass or fail, all of them. `/campaign-brief` will not ask for approval while any row fails. The source column says who taught us the row.

| # | Check | Fails when | Source |
|---|---|---|---|
| 1 | One KPI, a number, a date | "Awareness", three KPIs, no number, no date | Tyler: every brief that worked had one; the 2023 experiments plan left the metric "TBD" and never logged a result |
| 2 | The KPI is a buying action, not an asset action | The KPI is downloads, clicks or registrations when the business goal is meetings or revenue | Tyler, TAP plan; Luijten: optimize for qualified pipeline, never clicks or downloads |
| 3 | The KPI can be tracked today | The CRM or email tool cannot capture it; the attribution plan names no method | Cosby: do not adopt a measurement standard your stack cannot track |
| 4 | Approach fits one sentence: get [who] to [do what] by [mechanism] | Two sentences, or no mechanism | Tyler's briefs open with "Approach" in one line |
| 5 | Audience has an include list and an exclude list | No exclusions; existing customers or people in an active sales conversation not excluded; the segment is a demographic with no shared struggle | Tyler's ads briefs exclude converters; Grenier: niche by shared struggle, not demographics |
| 6 | Every angle has proof, or is marked (no proof) | A claim with no source; a number from an old deck; a claim legal has not cleared | Tyler's video: "supporting sources"; the Acme Q2 readout |
| 7 | Proof comes from customers or third parties, not only from the brand | All proof is the brand's own assertion | Best: customer voice over brand claim; Armenti: proof points from customer interviews |
| 8 | Buying stage is stated, with the buyer's thought quoted | No stage; the "thought" is the marketer's paraphrase | Tyler's journey map: "Buyer thoughts by stage"; Luijten: 5 to 10 interviews per ICP |
| 9 | The offer passes "would they miss it" | A rebranded ebook; an offer the segment would not forward to a colleague | CXL B2B lead gen process; Best: it has to feel like a deal from their side |
| 10 | The ask matches the stage | A demo ask to a problem-unaware audience; next-step content only, to a sales-qualified account | Cosby: "we have rarely seen this work"; Best: button copy matches stage |
| 11 | The handoff rule names a person, a place and a time | "Sales follows up"; no time limit | Tyler: MQLs called within one business day, HubSpot alerts the rep in Slack with the campaign and the action |
| 12 | Sales has agreed the lead definition and the metric in writing | Marketing wrote it alone | Cosby: the first ABM failure cause is misalignment; the Acme sales feedback |
| 13 | A kill rule and a scale rule, each with a number and a date | "Review at end of quarter" | Tyler's 2022 proposal: track leading indicators to optimize or adjust; Best: name the winning metric before the test |
| 14 | Consistent with the positioning | The angle contradicts the owned key message, or claims a difference tied to no struggle | Grenier: "different for the sake of being different is a fool's errand" |
| 15 | Budget is stated: a total, and the paid channels' share | No budget line; a paid channel with no spend cap. "Not set" passes only when no channel is paid | Tyler Durman, Campaign Engine review, 9 Oct 2026: budget is a constraint ("if we only have $10,000 to spend in ads, or if we are trying to run an event at the same time"); Wilcox: size the budget to the metric you will judge |
| 16 | The alternatives the buyer weighs are named | The buying stage is solution aware or later and the brief names no competitor, do-it-yourself or do-nothing option | Tyler Durman, Campaign Engine review, 9 Oct 2026 ("why wouldn't I do a Reforge cohort?") |

## Gate 2: the drafts

Every draft is scored on every row that has a weight above 0 for its channel. A channel with no column of its own (a webinar, a partner email you added with `/campaign-channels`) is scored with the closest column until you add one with `/quality-gate`. The engine (or you) gives each row a score, the sheet does the arithmetic.

**Score per row:** 0 fails, 1 partly, 2 passes. **Weight per channel:** 0 not checked, 1 matters, 2 matters a lot, 3 decides it. **Weighted score** = sum of (score × weight) ÷ sum of (2 × weight), as a percentage.

**Routes:** SHIP at 85% and above. REVIEW from 70% to 84%, with the failing rows listed. FIX below 70%. A score of 0 on a row marked **\*** (non-negotiable) is FIX regardless of the total. These thresholds are yours to move.

| # | Criterion | Passes when | Email seq | Email camp | Sales enablement | Landing page | Ad tests | Blog post | Social | Source |
|---|---|---|---|---|---|---|---|---|---|---|
| G1\* | **Goal** | Every CTA moves the reader to the brief's KPI action, every email in a sequence carries the ask, and the sequence or page ends on it, not on the asset | 3 | 3 | 3 | 3 | 3 | 2 | 2 | Tyler, TAP plan: "a more direct approach"; his 2022 rewrite attached the calendar ask to the asset in the same sentence |
| G2\* | **Fidelity** | Every statistic, customer, quote and case study traces to the brief's proof column or the brand brain; nothing invented; an unverified claim is flagged, not softened | 3 | 3 | 3 | 3 | 3 | 3 | 3 | Tyler's video: "supporting sources"; workshop page: "make an unverified claim fail loudly"; Eric Siu's draft gate: "invented stats" |
| G3 | **Workflow** | Every output the channel's workflow names exists, within its specs (counts, character limits, formats, timing) | 3 | 2 | 2 | 2 | 3 | 2 | 2 | Tyler's briefs retype LinkedIn 150/70/100 every time; now the workflow holds them |
| G4 | **Stage** | The copy fits the buyer's quoted thought at the stated stage, and its ask fits that stage's exit: no product-specific messaging to accounts still at awareness or initial engagement | 3 | 2 | 2 | 3 | 2 | 3 | 2 | Tyler's journey map; Cosby, Mapping your Playbooks to the Account Progression Model |
| G5 | **Voice** | Passes every Always and Never in `voice-guide.md`, no banned word in `vocabulary.md`, in the buyer's words from `icp.md`; no AI tells (em dashes, "it's not X, it's Y") | 2 | 2 | 1 | 2 | 3 | 2 | 3 | The brand brain; Eric Siu's draft gate; the Acme Q2 "unlock" variants |
| G6 | **Consistency** | Headline, offer and CTA agree across every channel in the campaign; the ad says what the page says | 2 | 2 | 2 | 3 | 3 | 1 | 2 | Deck Gate 2; the Acme landing page that promised white-label for two weeks after legal pulled it |
| G7 | **Audience** | Targeting, segment and exclusions match the brief; personalization uses only data the recipient expects you to have | 2 | 3 | 1 | 1 | 3 | 1 | 1 | Tyler's exclusion lists; Best: "creepy, creepy, creepy"; the Acme in-house downloads |
| G8 | **One idea** | One angle and one CTA per asset; the email sells the click and the page carries the detail | 3 | 3 | 1 | 2 | 3 | 2 | 3 | Best, Copywriting; Nick Christensen, ad scoring |
| G9 | **Offer up front** | The offer or the "what's in it for me" is in the subject line or headline, within the first 25 characters where the channel allows | 3 | 3 | 0 | 2 | 2 | 1 | 1 | Best: "the offer should go in the subject line. Don't test this." 43% lift from the first 25 characters |
| G10 | **Proof from others** | At least one customer voice or third-party proof per asset, where the stage calls for it | 2 | 2 | 3 | 3 | 1 | 2 | 2 | Best; Cosby: a case study per vertical; the Acme 9 July customer-story email at 44% open |
| G11 | **Differentiation** | Consistent with the positioning statement; the difference claimed is tied to a struggle alternatives ignore; a competitor could not run it unchanged | 1 | 1 | 2 | 3 | 2 | 3 | 3 | Grenier, Unique Positioning M1L1; Luijten: "the danger is to say the same as everybody else" |
| G12 | **Why now** | Names the trigger the campaign rides (a price change, an event, a stage entry, a question asked) and it is real | 2 | 2 | 1 | 1 | 1 | 1 | 2 | Cosby: a target without a trigger is "one step removed from spray and pray"; Grenier: brand cues plus timing-sensitive hooks |
| G13 | **Sales handoff** | The lead definition, the owner, the alert and the time limit are written into the asset where a lead can appear | 2 | 1 | 3 | 2 | 1 | 0 | 0 | Tyler: one business day, Slack alert with campaign and action; the Acme sales feedback |
| G14 | **Measurement** | UTM and tracking per the brief; any test names one hypothesis and one winning metric in advance | 2 | 2 | 1 | 3 | 3 | 1 | 1 | Best: one test per month, winner metric named first; the CXL B2B process: test submission before traffic |
| G15 | **Skimmable** | Paragraphs of 2 to 3 sentences, one visual, bullets where it helps; buttons over text links; literal button copy | 2 | 2 | 1 | 2 | 0 | 1 | 2 | Best, Copywriting: "maybe 4 seconds, maybe 8" |
| G16 | **Distribution** | Long-form has a paired short-form plan; content is fronted by a named person, not only the company | 0 | 0 | 0 | 0 | 1 | 3 | 3 | Luijten: personal profile 10x the company page; long-form always paired |

Maximum score per channel at weights above: email sequence 70, email campaign 66, sales enablement 52, landing page 70, ad tests 68, blog post 56, social 64. The sheet recomputes these when you change a weight.

## Reading a scorecard

`/campaign-review` writes one table per draft, then a campaign summary:

```
| Row | Criterion | Weight | Score | Weighted | Note |
| G1 | Goal | 3 | 1 | 3/6 | 2 | Email 4 asks for a reply, not the demo; the brief's KPI is demos booked |
...
| | Total | | | 54/70 = 77% | REVIEW |
```

A REVIEW or FIX always comes with the failing rows, the line in the draft that failed, and the fix the engine proposes. You accept the fix, write your own, or overrule the gate and say why. Overrules are logged in `review.md`; three overrules of the same row is a sign the weight is wrong, not the draft.

## Tuning it: the exercise

The default weights are a reasonable B2B demand gen opinion. Yours should match the campaigns you run. In the workshop, and again whenever a campaign misses:

1. **Which channel is missing?** Add a column for it. Give every row a weight, 0 included.
2. **Which row did your last miss fail?** If it is not here, add it, with the line from the readout that taught you.
3. **Which row do you overrule every time?** Lower its weight or cut it. A criterion nobody honours is noise.
4. **Which row would have stopped the miss?** Raise it to 3, or mark it non-negotiable.
5. **Where should the lines sit?** A team that ships daily might set SHIP at 80%. A team with legal review might set REVIEW to start at 60% so more goes past a human.
6. Record the change and the reason in the Changes section below. `/quality-gate` walks through all six.

Then, optionally, write the gate as a question set for a decision model (`frameworks/decision-models.md`) so it can run on every draft automatically. The sheet stays the authority; the model only answers the questions.

## Changes

| Date | Change | Why | By |
|---|---|---|---|
| 2026-10-06 | Default gate | Built for the workshop | CXL |
