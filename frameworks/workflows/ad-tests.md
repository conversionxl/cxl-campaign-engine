---
type: workflow
channel: ad-tests
status: starter
last_updated: "2026-10-06"
source: starter (scoring follows the ad-copy method credited to Nick Christensen in the Marketing Brain)
tags: [campaign-engine, workflow, ads]
---

# Ad tests

A small, deliberate set of paid ads to test angles against the ICP: two or three variants per audience, not twenty. LinkedIn first for B2B; Google and Meta when the brief names them.

## Pulls in
- The brief: 1 Goal, 3 Audience (targeting and exclusions), 4 Offer, 5 Messaging (angles), 8 Measurement (kill rule, budget), 9 Constraints
- The brand brain: `icp.md` (their words), `voice-guide.md`, `vocabulary.md`, `positioning-messaging.md`
- Connected ad platform, if any: past CTR and conversion by message; audience sizes
- `raw/campaigns/`: past ad results

## Steps

| # | Lane | Step | Comes out |
|---|---|---|---|
| 1 | Claude Code | Reads the brief; proposes the test plan: which angles, which audiences, how many variants, what decides the winner, when to kill | test plan |
| 2 | Marketer | Confirms the test plan, the budget split and the kill rule (pause) | approval |
| 3 | Claude Code | Writes the variants per platform to spec, each on one angle, each in the buyer's words | the ads |
| 4 | Claude Code | Scores every variant 1 to 5 on their words, outcome-led, voice; cuts anything under 4 and says why | scored set |
| 5 | Marketer | Approves the surviving variants and the audiences (pause) | approval or changes |
| 6 | Claude Code | Saves the test: variants, audiences, budget split, decision rule, kill rule, UTM parameters | `drafts/ad-tests.md` |

## Specs

| Element | Spec |
|---|---|
| Variants | 2 to 3 per audience; one angle per variant |
| LinkedIn single image | Intro text 150 characters before the fold, headline 70 characters, description 100 characters |
| LinkedIn sponsored message | Subject 60 characters, body 500 characters, one CTA |
| Google RSA | 15 headlines at 30 characters, 4 descriptions at 90 characters |
| Meta | Primary text 125 characters before the fold, headline 40 characters, description 30 characters |
| Scoring | 1 to 5 on their words, outcome-led, voice; under 4 is cut |
| Decision rule | The metric, the minimum sample and the date that decide the winner |
| Kill rule | Taken from the brief's measurement section |
| Exclusions | Existing customers and the brief's exclude list suppressed |
| Voice | Passes `voice-guide.md` and `vocabulary.md`; no hype words; no em dashes |

## Outputs
- `projects/campaigns/<slug>/drafts/ad-tests.md`

## Review criteria that weigh most for this channel
Audience (targeting and exclusions match the brief), Goal, Fidelity, Channel craft: one angle per variant, scored.
