---
type: workflow
channel: sales-enablement
status: starter
last_updated: "2026-10-06"
source: starter (follows how Tyler Durman runs enablement with reps and SDRs; adjust it to how your sales team works)
tags: [campaign-engine, workflow, sales]
---

# Sales enablement

What sales needs so a lead from this campaign gets the right call fast: a rep briefing, a play per lead type, a follow-up sequence, a talk track and the proof points. Claude drafts it; sales owns the calls.

## Pulls in
- The brief: 1 Goal, 3 Audience, 4 Offer, 5 Messaging (angles and proof), 6 Buying stage, 7 Sales enablement, 8 Measurement
- The brand brain: `positioning-messaging.md` (proof points, competitive alternatives, objections), `icp.md` (their words), `vocabulary.md`
- `raw/campaigns/`: sales feedback on past campaign leads; CRM snapshot (lead volumes, conversion rates)

## Steps

| # | Lane | Step | Comes out |
|---|---|---|---|
| 1 | Campaign owner | Sets the goal (MQLs or meetings), the lead definition and the campaign dates (pause: confirmed from the brief, or asked) | lead definition |
| 2 | Claude Code | Writes the rep briefing: what the campaign is, who it targets, how long it runs, the goal, what a lead has seen before sales calls | rep briefing |
| 3 | Claude Code | Writes the lead play per lead type: MQLs get a call within one working day; meetings get prepped with the account's context | lead plays |
| 4 | Claude Code | Drafts the rep sequence (8 touches over 10 working days: email, call, LinkedIn, email, call, email, call, email), the email blurbs and the phone talk track, each touch on one angle with its proof, a case study per segment or vertical, plus the objections and answers from the hub. One version per rep if the brief names them | enablement pack |
| 5 | Sales lead | Approves the briefing and the material before anything is loaded (pause) | approval or changes |
| 6 | Claude Code | Writes the CRM and Slack alert spec: the alert the rep gets, what it says the lead did, and the play to run | alert spec |
| 7 | Sales rep | Runs the play: calls the MQL within a day, or confirms and preps the meeting (outside the engine; the measurement section tracks it) | logged handoff |

## Specs

| Element | Spec |
|---|---|
| Rep briefing | One page or fewer: campaign, audience, dates, goal, offer, what the lead saw |
| Lead plays | One per lead type the brief defines; each names the action, the owner and the time limit |
| Rep sequence | 8 touches over 10 working days (email, call, LinkedIn, email, call, email, call, email) unless the brief says otherwise. Emails after the first are threaded replies on the same subject line. Email 1 asks "are you the right person" and offers the calendar; the last email is a break-up with a binary (bad timing, or not relevant) |
| Sequence emails | 60 words or fewer each, one proof line naming a customer the brief clears, one ask |
| Case study | One per segment or vertical the brief targets, from the brief's proof column; none invented |
| Talk track | Opening line, the one question that qualifies, the angle and proof, the ask; 200 words or fewer |
| Objections | Every alternative in the hub's competitive alternatives table gets an answer with proof |
| Proof | Only proof points from the brief or the hub; no invented customer names or numbers |
| Alert | Names the campaign, the lead's action, the play, and the time limit |
| Voice | Plain, in the buyer's words from `icp.md`; no banned word from `vocabulary.md` |

## Outputs
- `projects/campaigns/<slug>/drafts/sales-enablement.md`: briefing, plays, sequence, talk track, objections, alert spec

## Review criteria that weigh most for this channel
Goal (every touch moves to the meeting), Fidelity, Sales handoff (owner, place, time named), Consistency with the marketing emails.
