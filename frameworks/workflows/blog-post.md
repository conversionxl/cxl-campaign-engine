---
type: workflow
channel: blog-post
layer: starter
based_on: ""
status: starter
tools: [CMS, Google Search Console, GA4]
last_updated: "2026-10-06"
tags: [campaign-engine, workflow, content]
---

# Blog post

A campaign post that earns attention and hands the reader to the campaign's destination. One angle, a position someone could disagree with, and a reason to come back.

Built from Andy Crestodina's CXL courses, Content Strategy for Demand Generation (Eurekos 5178) and Build Optimized B2B Content Funnels with AI (11639), with distribution rules from Tycho Luijten's B2B Demand Generation course. The SEO lesson of Crestodina's course is not in the transcripts, so this starter sets no word count or keyword placement rule.

## Pulls in
- The brief: 1 Goal, 3 Audience, 4 Offer, 5 Messaging (one angle), 6 Buying stage
- The brand brain: `icp.md` (their words), `positioning-messaging.md` (owned key message, pillars, proof), `voice-guide.md`, `vocabulary.md`
- `raw/`: original data, research, customer stories the post can cite; Search Console and GA4 if connected

## Steps

| # | Step | Who | Rule | Source | Check before moving on |
|---|---|---|---|---|---|
| 1 | Check the topic fits the mission | Claude | The topic fits "Our content is where audience X gets information Y for benefit Z". If the brand has no such line, write one from the brand brain and ask you to confirm it | Crestodina, Content Strategy L1 | Mission line written; topic fits it |
| 2 | Decide what the post is for: search or social | You | Search posts meet expectations: they answer the question fully. Social posts are unexpected. Pick one; do not plan a post to do both | Crestodina, Content Funnels Session 1 | One label chosen |
| 3 | Pick a differentiated angle | Claude | The post carries original research (a number you are the primary source for) or a strong opinion. "If you can't disagree with it, it's not thought leadership" | Crestodina, Content Strategy L2, L3 | The angle states a position someone could argue with |
| 4 | Find the gap | Claude | Ask which common claims in the industry are least supported by evidence, and use one answer as the angle or a section | Crestodina, Content Strategy L3 | One gap named with why it matters to the ICP |
| 5 | Bring in experts while drafting | You | Ask one to five experts for a quote during writing, not after publishing, including one who disagrees where the post takes a stand | Crestodina, Content Strategy L2; Content Funnels Session 2 | Quotes requested, or the step cut with a reason |
| 6 | Outline | Claude | Sections cover the claims that lack evidence and the counter-narratives; keep only what serves the angle (Crestodina expects to throw away most of a first AI outline) | Crestodina, Content Strategy L3; Content Funnels Session 1 | Outline confirmed by you |
| 7 | Draft to the standard | Claude | A strong opening hook, a visual at every scroll depth, evidence and examples, descriptive subheads, bullets for every list, short paragraphs, internal links, the expert quotes, a personal view | Crestodina, Content Funnels Sessions 1 and 2 | Every element present |
| 8 | Add what AI cannot | You | Real images, the experts' actual quotes, brand-specific examples, first-party data, and the opinion sharpened. Cut AI-sounding phrases | Crestodina, Content Strategy L3; Content Funnels Session 2 ("it can't throw a punch") | Each item added or marked as missing |
| 9 | Link to the money page | Claude | Link to the campaign's destination and "never miss an opportunity to link directly to the service page" | Crestodina, Content Strategy L2 | The brief's destination linked at least twice |
| 10 | Add the subscribe offer | Claude | An email sign-up with the 3 Ps: Prominence (high, large, contrasting), Promise (what they will get, specifically) and Proof (subscriber count or a testimonial). "Stay up to date" fails | Crestodina, Content Strategy L1, L3 | All three Ps present |
| 11 | Put a named person on it | You | The post is bylined by and shared from a subject matter expert's own profile, not only the company page; the same video did 1,200 impressions on a company page and 400,000 on a personal profile | Luijten, Define Your SMEs and Core Messaging | Author named; their share planned |
| 12 | Plan the promotion | Claude | Search, social and email, with UTMs on every non-search link; mention every contributor; pair the long post with short pieces that point to it; one spin-off (a "mistakes" version or an infographic) offered as a guest post | Crestodina, Content Strategy L2, Conversions lesson; Luijten, Channel Selection | Promotion list with UTMs; contributors tagged |
| 13 | Measure and refresh | Claude | After publishing: search traffic per URL against the previous period, Search Console queries the page ranks for but does not answer, and visitor-to-subscriber rate. Put the best converters into heavy social rotation | Crestodina, Conversions lesson | Measurement dates set |

## Specs

| Element | Spec | Source |
|---|---|---|
| Angle | One; original data or a contestable opinion | Crestodina, L2, L3 |
| Mission line | "Our content is where audience X gets information Y for benefit Z" | Crestodina, L1 |
| Structure | Hook, descriptive subheads, bullet lists, short paragraphs, a visual per scroll | Crestodina, Content Funnels |
| Experts | 1 to 5 quotes; one dissent where the post takes a stand | Crestodina, L2 |
| Links | The destination at least twice; relevant internal links | Crestodina, L2 |
| Subscribe offer | Prominence, Promise, Proof | Crestodina, L1 |
| Byline | A named expert, shared from their profile | Luijten |
| Meta | Title 60 characters or fewer, description 155 or fewer | Campaign Engine default |
| Length and keywords | No course rule (the SEO lesson is missing); set your own if you have one | Gap |
| Proof | Every statistic and story from the brief, the brain or a cited file; no invented numbers | Campaign Engine rule |

## Outputs
- `projects/campaigns/<slug>/drafts/blog-post.md`: mission check, angle and gap, outline, the post, expert quotes requested and received, subscribe block, meta, promotion plan with UTMs, measurement dates

## Changes from the version it was based on
| Step | Change | Why |
|---|---|---|
| | Starter | |
