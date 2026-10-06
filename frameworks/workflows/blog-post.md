---
type: workflow
channel: blog-post
status: starter
last_updated: "2026-10-06"
source: starter
tags: [campaign-engine, workflow, content]
---

# Blog post

A campaign post that earns the offer: it takes one angle from the brief and proves it, then hands the reader to the destination. Not the company's general content calendar; one post, in service of this campaign's KPI.

## Pulls in
- The brief: 1 Goal, 3 Audience, 4 Offer, 5 Messaging (one angle), 6 Buying stage
- The brand brain: `positioning-messaging.md` (OKM, pillars, proof), `voice-guide.md`, `vocabulary.md`, `icp.md` (their words)
- `raw/`: research, data or customer stories the post can cite; Search Console or GA4 if connected (what the audience already searches)

## Steps

| # | Lane | Step | Comes out |
|---|---|---|---|
| 1 | Claude Code | Picks the angle from the brief that best fits the buying stage; proposes the title, the point of view, the proof it will use and where the CTA sits | outline |
| 2 | Marketer | Confirms the angle, the point of view and the CTA placement (pause) | approval |
| 3 | Claude Code | Writes the post: title and two alternates, opening in the buyer's words, the argument with its proof, one customer story if the brain has one, the CTA to the destination | the post |
| 4 | Marketer | Reviews claims and the point of view; adds the SME input the brain lacks (pause) | approval or changes |
| 5 | Claude Code | Writes the meta title, meta description, and 3 social snippets that point to the post | distribution kit |
| 6 | Claude Code | Saves the post | `drafts/blog-post.md` |

## Specs

| Element | Spec |
|---|---|
| Length | 900 to 1,500 words unless the brief says otherwise |
| Angle | One; the others stay out |
| Point of view | A position the company holds, not aggregated common knowledge |
| Proof | Every statistic and story from the brief, the brain or a cited file in `raw/`; no invented numbers |
| CTA | One, to the brief's destination, placed once mid-post and once at the end |
| Meta | Title 60 characters or fewer, description 155 or fewer |
| Social snippets | 3, each 200 characters or fewer, one angle each |
| Voice | Passes `voice-guide.md` and `vocabulary.md`; no em dashes |

## Outputs
- `projects/campaigns/<slug>/drafts/blog-post.md`

## Review criteria that weigh most for this channel
Stage (fits the buyer's thought), Fidelity, Differentiation (a competitor could not publish it unchanged), Goal (the CTA leads to the destination).
