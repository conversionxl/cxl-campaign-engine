---
type: workflow
channel: landing-page
status: starter
last_updated: "2026-10-06"
source: starter
tags: [campaign-engine, workflow, landing-page]
---

# Landing page

The destination the campaign's CTAs land on. One outcome-led headline, the pain in the first 50 words, three or four proof points, a single CTA, and a form that asks only for what sales needs.

## Pulls in
- The brief: 1 Goal, 3 Audience, 4 Offer (destination and CTA), 5 Messaging, 6 Buying stage, 7 Sales enablement (which fields sales needs), 8 Measurement
- The brand brain: `positioning-messaging.md` (OKM, value proposition, pillars, proof points), `voice-guide.md`, `vocabulary.md`, `icp.md`
- `raw/performance/`: conversion rates of existing pages, if any

## Steps

| # | Lane | Step | Comes out |
|---|---|---|---|
| 1 | Claude Code | Reads the brief and the hub; proposes the page outline: headline, pain, offer, proof, CTA, form fields | outline |
| 2 | Marketer | Confirms the outline and the form fields: every field beyond email, company and role must be justified by a sales need (pause) | approval |
| 3 | Claude Code | Writes the page copy: headline and two alternates, subhead, opening, offer block, 3 to 4 proof blocks, CTA copy, form labels, thank-you page copy | page copy |
| 4 | Claude Code | Writes the tracking notes: conversion event, UTM handling, CRM field mapping, the test submission to run before launch | tracking notes |
| 5 | Marketer | Approves copy and claims; designer or builder takes it from here (pause) | approval or changes |
| 6 | Claude Code | Saves the page | `drafts/landing-page.md` |

## Specs

| Element | Spec |
|---|---|
| Headline | Outcome-led, 10 words or fewer, plus 2 alternates for testing |
| Opening | The pain in the buyer's words within the first 50 words |
| Proof | 3 to 4 blocks, each one claim with its proof from the brief; no proof, no block |
| CTA | One action, repeated at most 3 times down the page, same wording each time |
| Form | Email, company, role by default; each extra field justified in a note |
| Thank-you page | Says what happens next and when (from the sales enablement section) |
| Tracking | Conversion event, UTM convention and CRM mapping written down; a test submission listed as a launch step |
| Voice | Passes `voice-guide.md` and `vocabulary.md`; no em dashes |

## Outputs
- `projects/campaigns/<slug>/drafts/landing-page.md`

## Review criteria that weigh most for this channel
Goal (the CTA is the KPI action), Fidelity, Consistency (the headline matches the ads and emails that point here), Channel craft: form asks only what sales needs.
