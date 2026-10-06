---
type: workflow
channel: sales-enablement
layer: starter
based_on: ""
status: starter
tools: [CRM, sales engagement platform, Slack]
last_updated: "2026-10-06"
tags: [campaign-engine, workflow, sales]
---

# Sales enablement

Everything sales needs so a lead from this campaign gets the right call, fast: a rep briefing, a play per lead type, a sequence, a talk track, customer stories, and a battlecard when a competitor is in play. Claude drafts it; sales owns the calls. Used by every campaign whose KPI is MQLs, meetings or deals.

The spine is how Tyler Durman runs enablement with reps and SDRs. The steps marked Bastien come from Kyle Bastien's CXL course, Sales and Customer Success Enablement.

## Pulls in
- The brief: 1 Goal, 3 Audience, 4 Offer, 5 Messaging (angles and proof), 6 Buying stage, 7 Sales enablement, 8 Measurement
- The brand brain: `positioning-messaging.md` (proof points, competitive alternatives, differentiation), `icp.md` (their words), `vocabulary.md`
- `raw/campaigns/`: sales feedback on past leads, past sequences, the CRM snapshot (stage conversion, lost reasons); call transcripts in `raw/voc/` for the customer's real objections

## Steps

| # | Step | Who | Rule | Source | Check before moving on |
|---|---|---|---|---|---|
| 1 | Set the campaign, the dates and the goal | You | One goal type, MQLs or meetings and deals, with a number and the campaign's start and end date | Tyler Durman, Slack 23 Sep 2026; Nov 2025 vertical brief ("10 meetings, 2 live deals, 1 closed") | Goal type, number and dates match the brief's section 1 |
| 2 | Place the leads on the buyer's journey | Claude | Name the stage leads arrive at (MQL at solution aware, meeting at product seeking) and which question the rep must answer there: why do anything, why now, or why with you | Bastien, The Buyer's Journey ("the Three Whys"); Tyler, Integrated Campaign Strategy Template | One stage and one of the three whys named |
| 3 | Get briefed by sales, and name the experts | You, Sales lead | Record the messaging and offers sales is already sending before drafting anything, and name one expert per input (product, best seller, customer success). Enablement is "the conductor, not the orchestra" | Tyler, TAP plan ("get briefed by sales on the messaging and offers they're sending"); Bastien, Three Principles of Enablement | Sales' current messaging is in the file; each input has a named person |
| 4 | Write the lead play | Claude | MQLs: "call the lead within one business day and put them in your follow up sequence." Meetings: "confirm the meeting with the prospect, research them, then prepare your demo and discovery conversation." Each action has an owner and an exit the customer confirms (a meeting booked and accepted) | Tyler, Slack 23 Sep 2026 (verbatim); Bastien, The Sales Process | One play per lead type; every exit is something the customer does |
| 5 | Check what already exists | Claude | Mark every asset the play needs green (exists, fit), yellow (exists, needs work) or red (missing). Every red item needed before launch gets an owner and a date. Fix the start of the journey first | Bastien, Gap Analysis | No red item without an owner and date |
| 6 | Draft the rep sequence | Claude | 8 touches over 10 working days: email, call, LinkedIn, email, call, email, call, email. Four emails. Email 1 asks "are you the right person" with a calendar link and a named customer; email 2 is a threaded reply with one statistic; every email ends on the meeting ask | Tyler, Nov 2025 vertical brief (Salesloft cadence and copy) | 8 touches in that order; 4 emails; each ends on the ask |
| 7 | Version it per segment and per rep | Claude | One variant per vertical or segment in the brief (same emails, the case study swapped), and one version per sending rep, loaded against that rep's own list | Tyler, Nov 2025 vertical brief ("Ken and Logan versions", one case study per vertical) | A variant for every segment in the brief's audience |
| 8 | Turn each case study into a customer story | Claude | For each segment, one case study to send and one story for the rep to tell: three to four sentences in STAR order (situation, task, action, a quantified result). Only customers and results the brief clears | Bastien, Enablement Content ("you can't just send case studies to your sellers") | Every story has a number in its result, and it is in the brief's proof |
| 9 | Write the email blurbs and the talk track | Claude | The talk track is a cue card, shorter and simpler than customer copy, built on 3 to 4 points of performance the rep must hit on the call. Every blurb and talk-track line maps to one of them | Tyler, Slack 23 Sep 2026 ("email blurbs, or talk track/bullet points"); Bastien, Enablement Content, Measuring Enablement | 3 to 4 points of performance; no line that serves none |
| 10 | Prepare the battlecard, if a competitor is in play | Claude | List only differentiators the customer already values: comparative (they have it, we do it better) and unique (only we have it, and we can prove it), each with its proof, plus the objections reps will hear and the answer to each. What both sides have is table stakes and stays off the card | Tyler, Slack 15 Sep 2026 (prep for pitching against competitors); Bastien, The Buyer's Journey | Every line has proof; every alternative in the brand brain's competitive table has an answer |
| 11 | Sales lead approves; one rep reviews | Sales lead | Nothing is loaded until the sales lead approves it and at least one rep has said whether it helps. Customer-facing and internal material are reviewed separately. Human sends, always | Tyler ("approved sequence"); Bastien, Enablement Content ("go ask your sellers what they need"); Steve Armenti, Create sales enablement assets with AI | Approval and one rep's feedback recorded |
| 12 | Brief the reps through one voice | You, Manager | The briefing (campaign, how long it runs, goal, what to do with each lead type, where the material lives) goes out once, in one channel, delivered by a respected peer who has done the job, with the reinforcing manager named. Marketing does not broadcast to reps directly | Tyler, Slack 23 Sep 2026 ("tell them"); Bastien, Communicating to the Field | One message, one channel, a named messenger and manager |
| 13 | Role-play before calls go live | Manager | Each rep runs one role play, scored 0 or 1 on each point of performance plus confidence, simplicity, credibility and conversational, against a pass mark the manager sets first. "Lack of management support is the number one reason for enablement failure" | Bastien, Coaching Enablement (his onboarding default: 90% over three role plays) | Pass mark set; every rep scored |
| 14 | Load it and wire the alert | CRM | Load the sequence in the sales engagement platform, keep every asset in one place reps can find, and set the CRM to send the owning rep a Slack message on each new lead: it came from this campaign, and what to do with it | Tyler, Slack 23 Sep 2026 (HubSpot to Slack); Bastien, Three Pillars of Enablement Technology | Test lead triggers the alert with the campaign name and the play |
| 15 | Work the lead | Rep | Every MQL is called within one business day and enrolled in the sequence; every meeting is confirmed, researched and prepped. Log the exit in the CRM under a plain stage name | Tyler, Slack 23 Sep 2026; Bastien, The Sales Process ("don't get cute, use common language") | The time from lead to first call is measured |
| 16 | Measure it as a funnel | You, Manager | Record a baseline before launch, then report four stages, each from one source: reps briefed (or trained), material used by reps and opened by buyers, calls scored against the same points of performance, and meetings, deals and wins from the CRM | Bastien, Measuring Enablement; Tyler, Nov 2025 brief ("dashboard to track meetings and deals") | Baseline recorded; each stage has its source named |

## Specs

| Element | Spec | Source |
|---|---|---|
| Rep briefing | One page: campaign, dates, goal, lead play per type, where the material lives, the messenger and the manager | Tyler; Bastien, Communicating to the Field |
| Sequence | 8 touches over 10 working days (email, call, LinkedIn, email, call, email, call, email); 4 emails | Tyler, Nov 2025 brief |
| Sequence emails | 60 words or fewer each; email 1 names a customer the brief clears and links the calendar; email 2 replies on the same thread; each ends on the meeting ask | Tyler, Nov 2025 brief |
| Customer story | 3 to 4 sentences, STAR, quantified result | Bastien, Enablement Content |
| Talk track | Opening line, the qualifying question, 3 to 4 points of performance with proof, the ask; 200 words or fewer | Bastien, Measuring Enablement; Enablement Services ("cue cards") |
| Battlecard | Comparative and unique differentiators only, each with proof; objection and answer pairs | Bastien, The Buyer's Journey |
| Slack alert | Campaign name, what the lead did, the play, the time limit | Tyler, Slack 23 Sep 2026 |
| Proof | Only proof points from the brief or the brand brain; no invented customers or numbers | Campaign Engine rule |

## Outputs
- `projects/campaigns/<slug>/drafts/sales-enablement.md`: rep briefing, lead plays, sequence (per segment and per rep), customer stories, talk track with points of performance, battlecard if needed, alert spec, role-play scorecard, measurement plan

## Changes from the version it was based on
| Step | Change | Why |
|---|---|---|
| | Starter | |
