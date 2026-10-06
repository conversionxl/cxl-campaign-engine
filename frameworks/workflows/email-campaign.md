---
type: workflow
channel: email-campaign
status: starter
last_updated: "2026-10-06"
source: starter
tags: [campaign-engine, workflow, email]
---

# Email campaign

One-off or short-run emails to a list you already have (customers, subscribers, a segment): the announcement, the invitation, the reminder. Not the triggered sequence; that is `email-sequence`.

## Pulls in
- The brief: 1 Goal, 3 Audience (include and exclude lists), 4 Offer, 5 Messaging, 9 Constraints
- The brand brain: `voice-guide.md`, `vocabulary.md`, `positioning-messaging.md`, `icp.md`
- Connected email tool, if any: list sizes, past campaign open and click rates, suppression lists
- `raw/campaigns/`: past campaign results

## Steps

| # | Lane | Step | Comes out |
|---|---|---|---|
| 1 | Claude Code | Reads the brief and the audience include and exclude lists; proposes the segment and the suppression list | segment definition |
| 2 | Marketer | Confirms the segment, the exclusions and the send date (pause) | approval |
| 3 | Claude Code | Plans the send: announcement, reminder, last call, each with one angle and the one CTA | plan |
| 4 | Claude Code | Writes each email: two subject lines, preview line, body, CTA, plain-text version | the emails |
| 5 | Marketer | Approves the copy and the claims (pause) | approval or changes |
| 6 | Claude Code | Saves the campaign with segment, timing, suppression and the UTM parameters from the brief's measurement section | `drafts/email-campaign.md` |

## Specs

| Element | Spec |
|---|---|
| Emails | 1 to 3 (announcement, reminder, last call) |
| Subject lines | 2 per email, 50 characters or fewer |
| Preview line | 90 characters or fewer |
| Body | 200 words or fewer |
| Angle | One per email |
| CTA | One per email, repeated at most twice (link and button) |
| Segment | Include and exclude lists both named; existing customers excluded from acquisition offers unless the brief says otherwise |
| UTM | Source, medium and campaign set from the brief's measurement section |
| Voice | Passes `voice-guide.md` and `vocabulary.md`; no em dashes |

## Outputs
- `projects/campaigns/<slug>/drafts/email-campaign.md`

## Review criteria that weigh most for this channel
Goal, Stage, Consistency with the landing page, Channel craft: segment and exclusions named.
