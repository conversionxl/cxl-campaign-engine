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

Every channel converted on the asset and stopped. Nothing moved the buyer to the goal. That is the failure the **Goal** row exists to catch, and why it is a must-pass row.

## Gate 1: the brief

Pass or fail, all of them. `/campaign-brief` will not ask for approval while any row fails. The rows follow the brief's sections. The source column says who taught us the row; rows marked R come from the review of 28 cohort demos (Campaign Engine demo reviews, 19 Oct 2026), where the same gaps showed up in almost every brief. **R1, R2 and R3 matter most:** the At a glance block is what the engine reads before every draft, so a weak offer or key message there weakens every piece.

**No data is not a fail on its own.** Where a row asks for past data, market size or capacity and the user has none, it passes when the brief says so and gives its reasoning in Sources, tagged (inferred). It fails when the line is missing or the reasoning is not there.

| # | Check | Fails when | Source |
|---|---|---|---|
| 1 | One KPI, a number, a date | "Awareness", three KPIs, no number, no date | Tyler: every brief that worked had one; the 2023 experiments plan left the metric "TBD" and never logged a result |
| 2 | The KPI is a buying action, not an asset action | The KPI is downloads, clicks or registrations when the business goal is meetings or revenue | Tyler, TAP plan; Luijten: optimize for qualified pipeline, never clicks or downloads |
| 3 | The KPI can be tracked today | The CRM or email tool cannot capture it; "Counted by" names no event or tool | Cosby: do not adopt a measurement standard your stack cannot track |
| 4 | The target is grounded (R4) | No "Grounded in" line; a target with no past campaign, send or page behind it and no reasoning in Sources | Demo reviews, 19 Oct 2026 (3 demos) |
| 5 | Kill and scale rules fire early (R5) | A rule waits for the KPI itself; a rule has no leading metric, threshold, check date or action; the scale rule fires on hitting the goal instead of being ahead of pace | Tyler's 2022 proposal: track leading indicators to optimize or adjust; Best: name the winning metric before the test; demo reviews, 19 Oct 2026 (5 demos) |
| 6 | Audience has an include list and an exclude list | No exclusions; existing customers or people in an active sales conversation not excluded; the segment is a demographic with no shared struggle | Tyler's ads briefs exclude converters; Grenier: niche by shared struggle, not demographics |
| 7 | Buying stage is stated, with the buyer's thought quoted | No stage; the "thought" is the marketer's paraphrase | Tyler's journey map: "Buyer thoughts by stage"; Luijten: 5 to 10 interviews per ICP |
| 8 | The offer fits one sentence: get [who] to [do what] by [offer] | Two sentences, or no offer in it | Tyler's briefs open with the approach in one line |
| 9 | The offer is worth taking now (R1) | "What they get", "Why it is worth their time" or "Why now" is missing, or reads as an internal label ("agency upgrade") or a rebranded asset the segment would not miss | CXL B2B lead gen process; Best: it has to feel like a deal from their side; demo reviews, 19 Oct 2026 (3 demos) |
| 10 | The offer beats the alternatives (R2) | The alternatives table is empty, or a named alternative has no reason to choose this offer over it | Tyler Durman, Campaign Engine review, 9 Oct 2026 ("why wouldn't I do a Reforge cohort?"); demo reviews, 19 Oct 2026 (5 demos) |
| 11 | The ask matches the stage | A demo ask to a problem-unaware audience; next-step content only, to a sales-qualified account | Cosby: "we have rarely seen this work"; Best: button copy matches stage |
| 12 | Every claim has proof, or is marked (no proof) | A supporting message cites no proof and is not marked; a number from an old deck; a claim legal has not cleared | Tyler's video: "supporting sources"; the Acme Q2 readout |
| 13 | Proof comes from customers or third parties, not only from the brand | All proof is the brand's own assertion | Best: customer voice over brand claim; Armenti: proof points from customer interviews |
| 14 | The key message sells the offer (R3) | The key message, or the message a segment leads with, says how the product works, describes the product, uses an internal label, or tells the story of the content, instead of the buyer's reason to take the offer | Demo reviews, 19 Oct 2026 (4 demos) |
| 15 | Consistent with the positioning | The key message contradicts the owned key message, or claims a difference tied to no struggle | Grenier: "different for the sake of being different is a fool's errand" |
| 16 | The goal is worked back to volume (R6) | No campaign structure; no weekly volume per channel; the math does not reach the target and says nothing about the gap | Demo reviews, 19 Oct 2026 (4 demos) |
| 17 | The goal is sized to the market and the team (R7) | No sense check line | Demo reviews, 19 Oct 2026 (1 demo) |
| 18 | Paid channels have their own targets and runway (R8) | A paid channel with no spend, no return target, or a timeline that leaves no room for the platform's learning phase before the goal date | Wilcox: size the budget to the metric you will judge; demo reviews, 19 Oct 2026 (1 demo) |
| 19 | The handoff names a person, a place, a time, and what sales does next | "Sales follows up"; no time limit; no next action for the rep | Tyler: MQLs called within one business day, HubSpot alerts the rep in Slack with the campaign and the action; Tyler Durman, demo reviews, 21 Oct 2026: "they know exactly what to do with it" |
| 20 | Sales has agreed the lead definition and the metric in writing | Marketing wrote it alone | Cosby: the first ABM failure cause is misalignment; the Acme sales feedback |
| 21 | Budget is stated: a total, and the paid channels' share | No budget line; a paid channel with no spend cap. "Not set" passes only when no channel is paid | Tyler Durman, Campaign Engine review, 9 Oct 2026: budget is a constraint ("if we only have $10,000 to spend in ads, or if we are trying to run an event at the same time"); Wilcox: size the budget to the metric you will judge |
| 22 | A colleague coming in cold could run it (R13) | The brief carries raw answers to the engine's questions, an internal label or an undefined term, or the At a glance block does not show the goal, the offer and the key message | Demo reviews, 19 Oct 2026 (3 demos) |
| 23 | The evidence is not one customer's | Most of the buyer's words and the proof come from one or two customers, and the brief does not say so. Passes when the brief names the thin evidence in Sources and the audience is still the segment the user wants, not copies of those customers | Demo reviews, 19 Oct 2026: with few clients, a campaign can end up targeting copies of one founder |
| 24 | The scale matches the goal | The goal or the timeline meets the big-C triggers but the brief plans one small-c set of pieces; or a big-C brief's Architecture has no parallel programs (a launch event, a lead magnet, analyst relations) or no sustained cadence per channel | Tyler Durman, demo reviews, 21 Oct 2026: "This feels like a big C campaign that's being run like a small C campaign" |

**For a decision model,** the R rows are written as one yes or no question each in `frameworks/brief-gate-questions.json`, asked with the brief as the state.

## Gate 2: the drafts

Every draft is scored on every row that has a weight above 0 for its channel. A channel with no column of its own (a webinar, a partner email you added with `/campaign-channels`) is scored with the closest column until you add one with `/quality-gate`. The engine (or you) gives each row a score, the sheet does the arithmetic.

**Two numbers, two jobs.** The numbers in the table below are **weights**: how much a check counts for that channel. 0 not checked, 1 matters, 2 matters a lot, 3 decides it. The engine then gives each draft a **score** on every row: 0 fails, 1 partly, 2 passes.

**The percentage** = sum of (score × weight) ÷ sum of (2 × weight). Example: with the default weights an email sequence can score at most 70, so a draft that scores 54 is 77%, and goes to REVIEW.

**Routes:** SHIP at 85% and above. REVIEW from 70% to 84%, with the failing rows listed. FIX below 70%. A score of 0 on a row marked **must pass** is FIX, whatever the percentage. These thresholds are yours to move.

| # | Criterion | Passes when | Email seq | Email camp | Sales enablement | Landing page | Ad tests | Blog post | Social | Source |
|---|---|---|---|---|---|---|---|---|---|---|
| G1 | **Goal** (must pass) | Every CTA moves the reader to the brief's KPI action, every email in a sequence carries the ask, and the sequence or page ends on it, not on the asset | 3 | 3 | 3 | 3 | 3 | 2 | 2 | Tyler, TAP plan: "a more direct approach"; the 2022 rewrite attached the calendar ask to the asset in the same sentence |
| G2 | **Fidelity** (must pass) | Every statistic, customer, quote and case study traces to the brief's proof table or the brand brain; nothing invented; an unverified claim is flagged, not softened | 3 | 3 | 3 | 3 | 3 | 3 | 3 | Tyler's video: "supporting sources"; workshop page: "make an unverified claim fail loudly"; Eric Siu's draft gate: "invented stats" |
| G3 | **Workflow** | Every output the channel's workflow names exists, within its specs (counts, character limits, formats, timing) | 3 | 2 | 2 | 2 | 3 | 2 | 2 | Tyler's briefs retype LinkedIn 150/70/100 every time; now the workflow holds them |
| G4 | **Stage** | The copy fits the buyer's quoted thought at the stated stage, and its ask fits that stage's exit: no product-specific messaging to accounts still at awareness or initial engagement | 3 | 2 | 2 | 3 | 2 | 3 | 2 | Tyler's journey map; Cosby, Mapping your Playbooks to the Account Progression Model |
| G5 | **Voice** | Passes every Always and Never in `voice-guide.md`, no banned word in `vocabulary.md`, in the buyer's words from `icp.md`; no AI tells (em dashes, "it's not X, it's Y") | 2 | 2 | 1 | 2 | 3 | 2 | 3 | The brand brain; Eric Siu's draft gate; the Acme Q2 "unlock" variants |
| G6 | **Consistency** | Headline, offer and CTA agree across every channel in the campaign; the ad says what the page says | 2 | 2 | 2 | 3 | 3 | 1 | 2 | Deck Gate 2; the Acme landing page that promised white-label for two weeks after legal pulled it |
| G7 | **Audience** | Targeting, segment and exclusions match the brief; personalization uses only data the recipient expects you to have | 2 | 3 | 1 | 1 | 3 | 1 | 1 | Tyler's exclusion lists; Best: "creepy, creepy, creepy"; the Acme in-house downloads |
| G8 | **One idea** | One message and one CTA per asset; the email sells the click and the page carries the detail | 3 | 3 | 1 | 2 | 3 | 2 | 3 | Best, Copywriting; Nick Christensen, ad scoring |
| G9 | **Offer up front** | In every piece that drives the offer, the subject line or headline (or the first line of the body) says who it is for, what the offer is and why to take it, within the first 25 characters where the channel allows. The pre-header alone does not count. Value-led pieces with no offer are exempt | 3 | 3 | 0 | 2 | 2 | 1 | 1 | Best: "the offer should go in the subject line. Don't test this." 43% lift from the first 25 characters; demo reviews, 19 Oct 2026 (R9, 4 demos): the offer sat in the pre-header or at the end |
| G10 | **Proof from others** | At least one customer voice or third-party proof per asset, where the stage calls for it | 2 | 2 | 3 | 3 | 1 | 2 | 2 | Best; Cosby: a case study per vertical; the Acme 9 July customer-story email at 44% open |
| G11 | **Differentiation** | Consistent with the positioning statement; the difference claimed is tied to a struggle alternatives ignore; a competitor could not run it unchanged | 1 | 1 | 2 | 3 | 2 | 3 | 3 | Grenier, Unique Positioning M1L1; Luijten: "the danger is to say the same as everybody else" |
| G12 | **Why now** | Names the trigger the campaign rides (a price change, an event, a stage entry, a question asked) and it is real | 2 | 2 | 1 | 1 | 1 | 1 | 2 | Cosby: a target without a trigger is "one step removed from spray and pray"; Grenier: brand cues plus timing-sensitive hooks |
| G13 | **Sales handoff** | The lead definition, the owner, the alert, the time limit and what the rep does next are written into the asset where a lead can appear | 2 | 1 | 3 | 2 | 1 | 0 | 0 | Tyler: one business day, Slack alert with campaign and action; the Acme sales feedback |
| G14 | **Measurement** | UTM and tracking per the channel's workflow, counting the brief's KPI and leading metrics; any test names one hypothesis and one winning metric in advance | 2 | 2 | 1 | 3 | 3 | 1 | 1 | Best: one test per month, winner metric named first; the CXL B2B process: test submission before traffic |
| G15 | **Skimmable** | Paragraphs of 2 to 3 sentences, one visual, bullets where it helps; buttons over text links; literal button copy | 2 | 2 | 1 | 2 | 0 | 1 | 2 | Best, Copywriting: "maybe 4 seconds, maybe 8" |
| G16 | **Distribution** | Long-form has a paired short-form plan; content is fronted by a named person, not only the company | 0 | 0 | 0 | 0 | 1 | 3 | 3 | Luijten: personal profile 10x the company page; long-form always paired |
| G17 | **One specific CTA** | The piece ends with one specific action the reader can take ("Book your 30-minute check"), not a vague word or a generic "Learn more" | 3 | 3 | 2 | 3 | 3 | 2 | 2 | Demo reviews, 19 Oct 2026 (R10, 2 demos); Aagaard L11: the button names what they get |
| G18 | **Offer claims proven** (must pass) | Every claim the piece makes about the offer's value rests on proof the brief lists (section 3), or is written as an opinion, never as fact | 2 | 2 | 3 | 3 | 2 | 2 | 2 | Demo reviews, 19 Oct 2026 (R11); Tyler's video: "supporting sources" |
| G19 | **Named alternatives answered** | The objection answers and battlecards cover the main named competitors in the brief's Weighing against line, each with a reason to choose this offer. Internal only: buyer-facing copy never names a competitor | 0 | 0 | 3 | 0 | 0 | 0 | 0 | Demo reviews, 19 Oct 2026 (R12); Tyler Durman's battlecard templates |
| G20 | **Platform rules** (must pass) | The ad's targeting and copy follow the platform's rules for the brief's Regulated line: a special ad category (on Meta: housing, employment, credit, social issues, elections or politics) locks age, gender and postcode targeting and lookalike audiences; check the platform's current list before launch | 0 | 0 | 0 | 0 | 3 | 0 | 0 | Demo reviews, 19 Oct 2026: no row caught that Meta's housing category locks age targeting for a retiree audience |
| G21 | **Compliance** (must pass when on) | Scored only when the brief's Regulated line names a regulated area (health, finance, legal, insurance): no claim its rules forbid, every required disclaimer present, and the sign-off owner named | 3 | 3 | 3 | 3 | 3 | 3 | 3 | Demo reviews, 19 Oct 2026: a medical compliance check the member valued |
| V1 | **What it is** (must pass) | The first two lines say what is offered (a webinar, a demo, a trial, a course) and what the reader gets or learns. Must pass on the first piece of a page; session blocks and later sections inherit it. Ads use V1A | 2 | 2 | 1 | 3 | 0 | 2 | 2 | Wynter Message Layers, layer 1 (Laja): if they don't get it, nothing else matters; Fletch: positioning's first job is explaining what we do; Peep, 16 Oct 2026: "Webinar 1 is unclear: what is this"; Wynter round 1: "I couldn't immediately identify that it was a webinar" |
| V1A | **What it is, on an ad** (must pass) | Read the creative as a whole (pill, headline, supporting line, offer or event line): together it says what is offered and what the reader gets | 0 | 0 | 0 | 0 | 3 | 0 | 0 | Hesh, 20 Oct 2026: an 8-word headline cannot say what is offered and what you learn; read the ad creative as a whole |
| V2 | **Who it's for** | Makes clear who it is for, by naming the reader or by naming work only they do and own | 2 | 2 | 1 | 2 | 2 | 1 | 1 | Wynter layer 2, Relevance; Fletch: positioning = target market + differentiation; Kaminski, 22 Sep 2026: "You're already doing this. Here's a much better way"; round 2: "using my role in the opening line would make me stop and read" |
| V3 | **One sentence** | After one read, a reader could repeat the main benefit to a colleague in one plain sentence | 2 | 2 | 1 | 3 | 3 | 2 | 2 | Laja, CXL UVP article (8 Oct 2026): "If a reader can't explain your offer back to a friend in one sentence, the value proposition has failed" |
| V4 | **Specific** | Every benefit claim is tied to a concrete example, a number, a named person or a named tool, not a general promise | 2 | 2 | 2 | 3 | 3 | 3 | 2 | Laja: specificity, evidence, customer language; Wynter round 2: the winner was "the only one that made it tangible"; Wynter differentiation survey, June 2026: tangible proof points and third-party validation made the winner different |
| V5 | **Believable** | No cost, speed or outcome claim reads as unrealistic, evasive or cheap-sounding ("for cents", "10x", "replace your team") | 2 | 2 | 2 | 3 | 3 | 2 | 2 | Laja, LinkedIn 2026: the biggest leak is a clear claim buyers do not believe; round 2: "for cents" read as "unrealistic", "forced", "avoiding telling me something"; vocabulary.md: no unsourced multipliers |
| V6 | **Why not the alternative** | Says why this beats what the reader does today (the alternatives in the positioning hub), not only what it covers | 1 | 1 | 2 | 3 | 2 | 2 | 1 | Fletch: "better than [alternative] because [difference]"; Wynter layer 4: name the alternative; Laja, Wynter 8, Apr 2026: 6 of 10 homepages name no alternative, 8 of 10 never say why buyers should leave their current solution; Pierri, 6 Oct 2026: in a mature category the ad's only job is why you over the other vendors; icp.md: "why not just use ChatGPT" asked by about 57% |
| V7 | **Five-second headline** | The headline reads in about five seconds (14 words or fewer; 8 on an ad), carries one promise a competitor could not make, and leaves the qualifiers (free, dates, length) to the line under it | 2 | 2 | 0 | 3 | 3 | 2 | 1 | Laja: understood in about five seconds; Laja, 23 Sep 2026: "Mention the qualifiers. Sell on the determiners"; Aagaard L11: as short as possible; Peep, 16 Oct 2026: "way too long and reads like AI slop"; Bruno: too long for a 9:16 image |
| V8 | **Flow** | Problem, then what they get, then the next step, in that order, without doubling back | 2 | 2 | 1 | 2 | 1 | 2 | 1 | Wynter: the layers are in order; round 2: "choppy and don't flow naturally from a problem > solution > call to action flow" |
| V9 | **One thread** | Several sessions, products or examples on one page read as one offer with a single thread, not unrelated topics | 0 | 0 | 0 | 2 | 1 | 0 | 0 | Round 2: "too disconnected to be part of the same series"; Peep, 9 Oct 2026: "This seems unfocused to me" |
| V10 | **Tested words kept** | Keeps the words, names and examples that won a message test, not a simplified or generalised version | 1 | 1 | 0 | 2 | 3 | 1 | 1 | Hesh to Bruno, Loom 16 Oct 2026: the draft was simplified beyond what 100 people tested; "keep the stuff we have evidence of working"; Wynter decisions study, Sept 2026: 9% of decisions rest on buyer research |
| V11 | **Teaches something specific** | Promises something the reader learns to do, sets up or gets, not a recap of what the company learned | 1 | 1 | 0 | 3 | 2 | 2 | 1 | Peep, 9 Oct 2026: "teaching something specific (more aligned with what CXL is)", "who cares what we have learned"; icp.md: 11.7% chose CXL for practical reasons |
| V12 | **Buyer's words** | Words the buyer uses about their own work; any product name explained on first use; no internal label. Terms on the brand brain's known-terms list need no definition | 2 | 2 | 1 | 2 | 2 | 2 | 2 | Laja: no jargon propositions; Laja, compete and win: reject a position that "depends on an internal category label buyers do not use"; vocabulary.md: "quality gate" used by zero respondents |
| V13 | **Objection answered** | Answers at least one objection the brief lists (from the ICP, the message tests and sales feedback), in a way a skeptic would accept | 1 | 1 | 2 | 2 | 1 | 1 | 0 | Wynter message-layer checklist: "the key objection is addressed"; icp.md objections table; Laja's Goldcast test: answer the objection right after the claim |
| V14 | **Capability before AI** | The headline and first line lead with what the reader does or gets; the product, tool or AI is the means, not the subject | 1 | 1 | 0 | 2 | 2 | 2 | 1 | positioning-messaging.md, cross-pillar rule 1; Wynter: 99.1% of 445 category-leader sites claim AI; Laja's Goldcast test: "AI at scale" read as slop |
| V15 | **Named proof** | Every example names the person or company, never "a B2B agency" or "a founder" | 1 | 1 | 2 | 2 | 2 | 2 | 1 | Hesh, 16 Oct 2026: "put the names back"; round 2: a person they had heard of (Claire Vo) caught attention |
| V16 | **Said once** | Each example, fact and promise appears once | 1 | 1 | 0 | 2 | 1 | 1 | 0 | Hesh, 16 Oct 2026: "lost some repetition", "super long page"; Laja's Goldcast test: "text-heavy, busy, and repetitive" |
| V17 | **When you'd use it** | Says when the reader would use it, not only what it does | 1 | 1 | 0 | 2 | 2 | 1 | 1 | Kaminski, 27 Sep 2026: a page answers what is it, who is it for, when would I use it; Laja on Pierri, 15 Oct 2026: "Say exactly what the AI does and when you'd use it. Most people won't figure it out on their own." |
| VP1 | **Already wanted** (must pass) | The headline promises an outcome the buyer already names as a goal of their job (the brief's ICP priorities), not a fix for a problem they may not know they have. Examples come from the ICP research, never from a draft the gate scores | 3 | 3 | 2 | 3 | 3 | 2 | 3 | Peep, 19 Oct 2026: "the topics should be about something that people already know they want", "now we show them a better or new way to get it"; Kaminski, 22 Sep 2026: "You're already doing this. Here's a much better way" |
| VP2 | **Value without the method** | Take the product, tool and method words out of the headline: what is left still names something the reader gains, not only a problem avoided | 2 | 2 | 2 | 3 | 3 | 2 | 2 | Peep, 19 Oct 2026, on webinar 1: "unclear why would I want that... no value prop"; webinar 3: "at face value its not interesting". Calibrated 19 Oct on 11 labelled headings: Clef 9, Jev 8 |
| VP3 | **A job they own** (must pass) | The piece is about a job the reader already does and owns, not a new check, safeguard or task they would have to take on | 2 | 2 | 2 | 3 | 3 | 2 | 2 | Peep, 19 Oct 2026: "who wants to verify metrics? nobody... its not a job to be done"; Fletch: "For [segment doing JTBD]" |
| VP4 | **Better than today, shown** | Shows the new way as faster, cheaper or better than how the reader gets the same outcome today, with one example | 2 | 2 | 3 | 3 | 2 | 2 | 1 | Peep, 19 Oct 2026: "now we show them a better or new way to get it"; Fletch: "better than [alternative] because [difference]" |
| VP5 | **Outcome before problem** | States the outcome before any problem, and does not assume the reader already knows the problem it solves | 1 | 1 | 1 | 1 | 1 | 1 | 1 | Peep, 19 Oct 2026, on webinar 2: "makes me question why would i send anyone unverified claims... assumes people are problem aware" |
| VP6 | **Fits the ICP's priorities** | The value proposition serves at least one priority the brief lists for the ICP, as the reader would see it | 2 | 2 | 2 | 3 | 3 | 2 | 2 | Peep, 19 Oct 2026: "does this value prop align with ICPs top priorities?"; Wynter ICP Pulse, Jan 2026; icp.md jobs to be done |
| VP7 | **How badly they want it** | Asked how badly they want what the piece offers, 1 to 10, the reader answers 7 or higher. The models answer it as four thresholds (3, 5, 7, 9); report the want score (1 + 2 x the sum) beside the total | 1 | 1 | 1 | 1 | 1 | 1 | 1 | Peep, 19 Oct 2026: "on a scale of 1-10, how badly would that want what the webinar is offering?" |
| VP8 | **A job they're judged on** (must pass) | The headline names work the reader already owns and is judged on, in their words, not something the offer invents (a list, a framework, a check) | 3 | 3 | 3 | 3 | 3 | 2 | 3 | Peep, 20 Oct 2026, his rewrite of the three sessions. Calibrated on 9 pieces: his copy above ours 6 of 6, ours above the rejected page 6 of 6 |
| VP9 | **Today's way, named** | Names how the reader does it today in a detail they'd recognize, in a sentence of its own, and makes clear the new way beats it | 2 | 2 | 3 | 3 | 3 | 2 | 2 | Peep, 20 Oct 2026. Calibrated: his copy above ours 6 of 6 |
| VP10 | **Their own data** | Names the reader's own data or tools the work runs on | 1 | 1 | 2 | 2 | 2 | 1 | 1 | Peep, 20 Oct 2026: "your reviews, sales calls and comments", "your GA4, Google Ads and CRM data". Calibrated: 6 of 6 |
| B1 | **Our ICP** | Written for the ICP in `wiki/brand/icp.md`: speaks to one of their pains or wants in their words, and would not read as written for someone else | 3 | 3 | 3 | 3 | 3 | 3 | 3 | Hesh, 20 Oct 2026. Checked against an ICP block in the brief, drawn from icp.md |
| B2 | **Our brand voice** | Follows `wiki/brand/voice-guide.md`: reads like someone who built it or studied closely how others built it, numbers carry the weight, every Always kept and no Never broken | 2 | 2 | 2 | 2 | 2 | 2 | 3 | Hesh, 20 Oct 2026. Checked against a voice block in the brief, drawn from voice-guide.md |
| B3 | **Our messaging hub** | Carries the owned key message, a pillar or a differentiator from `wiki/brand/positioning-messaging.md`, follows its rules, and contradicts none of it | 2 | 2 | 3 | 3 | 2 | 2 | 2 | Hesh, 20 Oct 2026. Checked against a positioning block in the brief, drawn from positioning-messaging.md |

Maximum score per channel at weights above: email sequence 180, email campaign 176, sales enablement 156, landing page 230, ad tests 218, blog post 168, social 162. G21 adds 6 to every channel when the brief switches it on. The sheet recomputes these when you change a weight.

**The value prop rows (V, VP, B), in one line.** The V rows check that the offer is clear, specific and believable; the VP rows check that the reader already wants it (the job they are judged on, how they do it today, their own data); the B rows check it against your brand brain: `wiki/brand/icp.md`, `voice-guide.md` and `positioning-messaging.md`. Report the VP rows as their own score beside the total, so a few rows among many are not averaged away. **Ads are scored whole:** the image and its ad text together, as the platform shows them.

## Checks across the campaign

Some failures only show when the pieces are put side by side. `/campaign-review` runs these on the whole campaign after scoring the drafts, as facts, not judgment: a fail is always a Fix.

| # | Check | Fails when | Source |
|---|---|---|---|
| X1 | The budgets add up | The spend in the channels' drafts and workflows adds up to more or less than the brief's budget, or than the paid share in its campaign structure | Demo reviews, 19 Oct 2026: a 5,000 against 4,000 budget mismatch reached a human reviewer |
| X2 | The offer matches everywhere | An offer, price, date, trial or guarantee in an ad or email does not appear on the landing page it points to, in the same words | Demo reviews, 19 Oct 2026: an ad promised a trial the page never mentioned |
| X3 | Every CTA lands on the destination | A link or button in any piece points somewhere other than the brief's destination, without a reason in the draft | Campaign Engine rule |

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

The default weights are a reasonable B2B demand gen opinion. Yours should match the campaigns you run. In the workshop, and again whenever a campaign misses its goal:

1. **Which channel is missing?** Add a column for it. Give every row a weight, 0 included.
2. **What did your last campaign that missed its goal fail on?** If no row covers it, add one, with the line from the results report that explains why.
3. **Which row do you overrule every time?** Lower its weight or cut it. A criterion nobody honours is noise.
4. **Which row would have stopped that campaign from missing?** Raise it to 3, or make it must pass.
5. **Where should the lines sit?** A team that ships daily might set SHIP at 80%. A team with legal review might set REVIEW to start at 60% so more goes past a human.
6. Record the change and the reason in the Changes section below. `/quality-gate` walks through all six.

Then, optionally, write the gate as a question set for a decision model (`frameworks/decision-models.md`) so it can run on every draft automatically. The sheet stays the authority; the model only answers the questions.

## Changes

| Date | Change | Why | By |
|---|---|---|---|
| 2026-10-06 | Default gate | Built for the workshop | CXL |
| 2026-10-27 | Gate 1 rows 23 (thin evidence) and 24 (scale matches the goal); G20 Platform rules and G21 Compliance; checks across the campaign X1 to X3 | Demo reviews, 19 and 21 Oct 2026: a budget mismatch and an offer mismatch got past the gate, no row caught a Meta housing restriction, and a six-month launch ran as one small-c set | CXL |
| 2026-10-27 | Gate 1 rebuilt around the new brief sections, with R1 to R8 and R13 from the demo reviews; G9 made stricter (R9); added G17 One specific CTA (R10), G18 Offer claims proven (R11), G19 Named alternatives answered (R12); G8, G13 and G14 reworded for the new brief | The review of 28 cohort demos (19 Oct 2026) found the same gaps in almost every brief: no differentiation, an angle that described the product, kill and scale rules that waited for the goal. Claude's self-review scored those briefs 93 to 99 | CXL |
| 2026-10-20 | Added the value prop rows: V1 to V17, V1A for ads, VP1 to VP10, B1 to B3; ads scored as a whole | From CXL's own November webinar series: a page that passed the default rows failed its own CEO ("no value prop", "not a job to be done"). The VP rows were calibrated against his rewrite on Jev and Clef; the B rows check the brand brain | CXL |
