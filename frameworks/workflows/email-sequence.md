---
type: workflow
channel: email-sequence
status: starter
last_updated: "2026-10-06"
source: starter
tags: [campaign-engine, workflow, email]
---

# Email sequence

A triggered sequence of four emails to people who took the offer (downloaded, registered, replied). Build value, then ask for the meeting. Used by almost every small-c campaign with a lead definition.

## Pulls in
- The brief: 1 Goal, 4 Offer, 5 Messaging, 6 Buying stage, 7 Sales enablement, 9 Constraints
- The brand brain: `voice-guide.md`, `vocabulary.md`, `positioning-messaging.md` (proof points), `icp.md` (their words)
- `raw/campaigns/`: past sequence performance, if any (which subject lines and asks worked)

## Steps

| # | Lane | Step | Comes out |
|---|---|---|---|
| 1 | Claude Code | Reads the brief: offer, CTA, angles with proof, buying stage, voice | the sequence plan |
| 2 | Claude Code | Maps four emails to the pattern offer, value, value, ask: email 1 delivers the offer; emails 2 and 3 each build value on one angle with its proof; email 4 is the direct ask. Every email also carries the brief's ask, growing more direct: a soft calendar line in 1 and 2, the question in 3, the binary in 4 | a one-line plan per email: angle, proof, CTA |
| 3 | Marketer | Checks each email carries exactly one angle and that the ask in email 4 matches the brief's lead definition (pause) | approval or changes |
| 4 | Claude Code | Writes each email with two subject lines, a preview line, body, one CTA, a plain-text alternative | the four emails |
| 5 | Marketer | Approves the ask in email 4 and the send timing (pause) | approval |
| 6 | Claude Code | Saves the sequence with send timing, suppression rule (stop when they convert or book) and the fields to merge | `drafts/email-sequence.md` |

## Specs

| Element | Spec |
|---|---|
| Emails | 4 (adjust to 4 to 6 if the buying stage is early) |
| Subject lines | 2 per email, each 50 characters or fewer, no clickbait |
| Preview line | 1 per email, 90 characters or fewer, not a repeat of the subject |
| Body | 150 words or fewer for emails 2 to 4; email 1 under 80 words |
| Angle | Exactly one per email |
| Proof | Every claim traces to the brief's proof column; a (no proof) angle is stated as an opinion, never a fact |
| CTA | One per email, an action verb plus the outcome. Email 1 delivers the asset and attaches the meeting ask in the same breath ("here it is; want to look at it together this week?"); the asset is never the end of the path |
| Timing | Day 0, day 2, day 5, day 8 unless the brief says otherwise |
| Threading | Emails 2 to 4 are replies on email 1's subject line ("Re: ...") when the tool allows; the last email closes with a binary: bad timing, or not relevant |
| Proof | One proof line per email, naming a customer or number the brief clears |
| Suppression | Stop the sequence when the person converts, books, or replies |
| Voice | Passes every Always and Never in `voice-guide.md`; no banned word from `vocabulary.md`; no em dashes |

## Outputs
- `projects/campaigns/<slug>/drafts/email-sequence.md`: plan, four emails, timing, suppression rule, merge fields

## Review criteria that weigh most for this channel
Goal (every email moves to the KPI, the sequence ends on the ask), Fidelity (no invented claims), Stage (fits the buyer's thought), Channel craft: one idea and one CTA per email. Pattern from Tyler Durman's 2022 and 2025 sequences, where each email carries one value proposition and the calendar.
