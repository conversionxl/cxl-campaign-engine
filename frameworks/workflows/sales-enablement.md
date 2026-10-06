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

Everything sales needs so a lead from this campaign gets the right call, fast: an agreement with sales, a context folder, assets mapped to where the account is, a sequence, proof, a battlecard when a competitor is in play, and a loop that turns every call into the next asset. Claude drafts; sales owns the calls; a human sends, always.

The spine is how Tyler Durman runs enablement with reps and SDRs. On top of it: Steve Armenti's CXL course, Create sales enablement assets with AI (Eurekos 12556), and Mason Cosby's CXL courses, ABM: Get ROI in 6 Weeks (8364) and Align sales, marketing and leadership in B2B (10783).

## Pulls in
- The brief: 1 Goal, 3 Audience, 4 Offer, 5 Messaging (angles and proof), 6 Buying stage, 7 Sales enablement, 8 Measurement
- The brand brain: `positioning-messaging.md` (what you are allowed to claim, proof points, competitive alternatives), `icp.md` (their words, objections), `voice-guide.md`, `vocabulary.md`
- `raw/voc/`: call transcripts and customer interviews; `raw/campaigns/`: sales feedback, past sequences, the CRM snapshot (stages, stall and loss reasons)

## Steps

| # | Step | Who | Rule | Source | Check before moving on |
|---|---|---|---|---|---|
| 1 | Agree the deal with sales, in writing | You, Sales lead | One page names the goal (MQLs, or meetings and deals), how long the campaign runs, shared definitions of lead, MQL, SQL and opportunity, and confirms that working campaign leads does not cost a rep commission | Tyler Durman (goal, duration); Cosby, Align sales and marketing, Session 2 ("Do you know how your sellers make their commissions?") | Sales lead has agreed the page |
| 2 | Start with a few sellers | You, Sales lead | Run the first campaign with one to three sellers, prove it, then roll it out | Cosby, Align sales and marketing, Session 2 | Pilot sellers named |
| 3 | Get briefed by sales | You | Collect the messaging and offers reps already send, and ask how they knew an account was ready ("how did you know that these accounts were ready to engage?") before drafting anything | Tyler Durman, TAP plan; Cosby, Identify your triggers | Sales' current messaging and triggers recorded |
| 4 | Build the context folder | Claude | One folder per campaign with call transcripts (the customer's real language and objections), what you are allowed to claim, customer interviews (proof that matches the prospect) and brand guidelines. Nothing is generated without it | Armenti, Create sales enablement assets with AI ("the mental model") | All four inputs present, or the gap named |
| 5 | Map each asset to where the account is | Claude | Every asset names the stage it serves and that stage's exit: awareness, initial engagement, meaningful engagement, marketing qualified, sales qualified (budget, authority, urgency), opportunity, re-engagement. No product-specific messaging at the first two stages | Cosby, Mapping your Playbooks to the Account Progression Model; Real-World Playbook Example | Every asset has a stage and an exit |
| 6 | Write the sequence, blurbs and talk track | Claude | 8 touches over 10 working days: email, call, LinkedIn, email, call, email, call, email. Four emails, one version per rep, each ending on the meeting ask; email blurbs and a talk track the rep can use on the phone | Tyler Durman, Nov 2025 vertical brief; Slack 23 Sep 2026 | 8 touches in order; a version per rep |
| 7 | Add proof per segment and per blocker | Claude | One case study per segment in the brief. Buying-committee content starts with the roles that have blocked deals before | Tyler Durman, Nov 2025 brief; Cosby, Scale your ABM program | Every proof item is in the brief's proof column |
| 8 | Prepare the battlecard and objection doc | Claude | Cover the claims only you can make, framed without naming the competitor ("is this important to you? If it is, this is what we do"), and the objections reps hear with an answer to each. Built from the same context folder | Tyler Durman (prep for pitching against competitors); Cosby, Align sales and marketing, Session 2; Armenti ("battlecards, objection docs, call prep") | Every line traces to the context folder |
| 9 | Review with flags | Claude | Every asset comes back with flags: who it is for, the assumptions made, and "please verify the following before sending", plus anything missing or mistyped | Armenti, Create sales enablement assets with AI | Flags listed per asset |
| 10 | Sales lead approves; a human sends | Sales lead | Nothing is loaded until the sales lead approves it. "The AE reviews flags in under two minutes. Human sends, always" | Tyler Durman ("approved sequence"); Armenti | Approval recorded |
| 11 | Warm the accounts before outreach | Ad account | Ads to the target accounts start one to two weeks before outbound; the LinkedIn audience is at least 300 matched contacts | Cosby, Real-World Playbook Example; Scale your ABM program | Ad start date is 1 to 2 weeks before the sequence starts |
| 12 | Launch on outreach start, and wire the alert | CRM | The campaign starts the moment sales outreach starts. The CRM sends the owning rep a Slack message on each new lead: it came from this campaign, and exactly what to do | Tyler Durman, TAP plan; Slack 23 Sep 2026 | A test lead triggers the alert with the campaign and the play |
| 13 | Call every MQL within one business day | Rep | Every MQL is called within one business day and enrolled in the approved sequence | Tyler Durman, Slack 23 Sep 2026 | Time from lead to first call is measured |
| 14 | Prep every meeting | Rep | Each booked meeting is confirmed, researched and prepped for demo and discovery, with a call-prep brief built from the CRM record and the context folder | Tyler Durman, Slack 23 Sep 2026; Armenti (call prep) | A prep brief per meeting |
| 15 | Turn every call into the next asset | Claude | The call transcript, the CRM record and the asset template produce the follow-up (a one-pager, a recap, an objection answer) with flags; the rep clears the flags and sends. After a handful of runs, fold the rep's corrections back into the template | Armenti, Create sales enablement assets with AI ("the two-minute loop"; "recodify that skill") | Template updated after the first runs |
| 16 | Multi-thread, unstick, re-engage | You, Rep | Each opportunity has a planned touch to buying-committee members who skip meetings. Each stall reason has a standard play. Deals lost 6 to 12 months ago get a "what's changed" message tied to their loss reason ("60 to 80% of closed lost reasons can be overcome") | Cosby, Accelerate your sales pipeline; Closed-lost re-engage; Align sales and marketing, Session 2 | Plays written for multi-threading, stalls and closed-lost |

## Specs

| Element | Spec | Source |
|---|---|---|
| Sales agreement | One page: goal, duration, definitions, commission check; agreed before launch | Tyler Durman; Cosby, Session 2 |
| Pilot | One to three sellers | Cosby, Session 2 |
| Context folder | Call transcripts, approved claims, customer interviews, brand guidelines | Armenti |
| Account stages | Awareness, initial engagement, meaningful engagement, MQA, SQA, opportunity, re-engagement, each with an exit | Cosby, Mapping your Playbooks |
| Sequence | 8 touches over 10 working days (email, call, LinkedIn, email, call, email, call, email); 4 emails; a version per rep | Tyler Durman, Nov 2025 brief |
| Sequence emails | 60 words or fewer; email 1 asks "are you the right person" with a calendar link; email 2 replies on the thread; each ends on the meeting ask | Tyler Durman, Nov 2025 brief |
| Battlecard | Claims only you can make, without naming the competitor; objection and answer pairs | Cosby, Session 2; Armenti |
| Flags | Reader, assumptions, items to verify before sending | Armenti |
| Review time | Rep clears flags in under two minutes; a human sends | Armenti |
| Ad warm-up | 1 to 2 weeks before outbound; LinkedIn at least 300 matched contacts | Cosby, Real-World Playbook Example |
| Slack alert | Campaign name, what the lead did, the play, the time limit | Tyler Durman |
| Response time | MQL called within one business day | Tyler Durman |
| Closed-lost window | Lost 6 to 12 months ago; message "what's changed" | Cosby, Closed-lost re-engage |
| Proof | Only proof points from the brief or the brand brain | Campaign Engine rule |

## Outputs
- `projects/campaigns/<slug>/drafts/sales-enablement.md`: the sales agreement, pilot sellers, context folder checklist, assets by stage, sequence (per rep), blurbs and talk track, case studies, battlecard and objection doc with flags, ad warm-up dates, alert spec, call-prep template, follow-up template, multi-thread, stall and closed-lost plays

## Changes from the version it was based on
| Step | Change | Why |
|---|---|---|
| | Starter | |
