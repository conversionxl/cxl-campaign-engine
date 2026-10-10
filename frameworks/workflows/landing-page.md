---
type: workflow
channel: landing-page
layer: starter
based_on: ""
status: starter
tools: [CMS or page builder, GA4, PageSpeed Insights]
last_updated: "2026-10-06"
tags: [campaign-engine, workflow, landing-page]
---

# Landing page

The page every CTA in the campaign points at. Its job is the brief's KPI action.

Built from Michael Aagaard's CXL course, Landing Page Optimization (Eurekos 4460), with the form rules from Jessica Best. No English transcripts of Aagaard's course exist; the rules come from his course slides and, where marked, from the course's subtitle track.

Aagaard's six characteristics of an effective landing page run through every step: a relevant follow-up to the ad; matches the visitor's awareness level; reinforces their motivation; answers their questions; reduces friction; a clear path to conversion.

## Pulls in
- The brief: 1 Goal, 3 Audience, 4 Offer (destination and CTA), 5 Messaging, 6 Buying stage, 7 Sales enablement (what happens after the form), 8 Measurement
- The brand brain: `positioning-messaging.md` (value proposition, pillars, proof points), `icp.md` (their words, objections), `voice-guide.md`, `vocabulary.md`
- The ads and emails that will point here (drafts in this campaign); GA4 for the existing page if there is one; reviews and sales notes in `raw/voc/` and `raw/campaigns/`

## Steps

| # | Step | Who | Rule | Source | Check before moving on |
|---|---|---|---|---|---|
| 1 | Write the page brief | Claude | How many pages: one per offer, so one for most campaigns and two at most; every CTA in the campaign points at one of them. A third page needs its own offer or audience, named here. Then scope, who signs off, the business goal, the traffic sources with the ads and emails that point here, and who builds what | Aagaard, L03 LPO Process; Tyler Durman, Campaign Engine review, 9 Oct 2026 ("we probably only need one to two") | Page count and sign-off owner named |
| 2 | Set the awareness level and the conversion goal | Claude | State the visitor's awareness level (unaware, problem, solution, product, most aware) and how complex, costly and risky the goal is. Both decide how much the page has to say | Aagaard, L05 Awareness Levels and Conversion Goals | Matches the brief's buying stage |
| 3 | Pull the baseline | Google Analytics 4 | For an existing page: users, conversions, conversion rate, device split, source and medium, drop-off. Work out the sample size first to know whether an A/B test is possible | Aagaard, L08 Quantitative Research | Baseline recorded, or "new page" |
| 4 | Design for the dominant device | Claude | If most visitors are on mobile, plan and write the page mobile first | Aagaard, L01 and L08 | Device split stated |
| 5 | Walk it from the ad | You | Start at the ad or email and click through to the confirmation page. Give the page 15 seconds and note first impression, relevance to the ad, trust and expectations; then read everything for confusion and unanswered questions | Aagaard, L09 Qualitative Research | Notes on the four first-impression questions |
| 6 | Mine what customers ask | Claude | Pull the most common questions, objections and what excites prospects from sales and support (a 30-minute recorded interview each if you can) and from reviews. Never ask an AI for numbers or stats | Aagaard, L09 Qualitative Research | Top questions listed with their source |
| 7 | Sort every finding by friction | Claude | Tag each finding as interaction friction (hard to use), cognitive friction (hard to understand) or emotional friction (hard to trust), and map it to one of the six characteristics | Aagaard, L06 User Friction; L07 Research Approach | Every finding tagged |
| 8 | Plan the first two screens | Claude | The first screen carries the summary, the main points and the value proposition; the rest follows in order of importance; every section has a job; no site navigation | Aagaard, L10 Structure and Components | Outline with a purpose per section |
| 9 | Write the headline: clear beats clever | Claude | The headline says what the visitor gets, in plain words, and follows on from the ad or email that sent them. Copy is "as short as possible, never longer than necessary" | Aagaard, L11 Copy Tips | Headline and two alternates; each matches the ad's promise |
| 10 | Answer the questions, remove the doubt | Claude | Answer the questions from step 6 on the page (for a demo: when, how it is scheduled, who reaches out, what happens, why you ask for a phone number). Keep the price and the promise the same as the ad. No dark patterns | Aagaard, L02 Characteristics; L06 User Friction | Every top question answered or deliberately left out |
| 11 | Put the proof where the doubt is | Claude | Place 3 to 4 proof blocks (customer voice, numbers, logos) next to the claims they support; only proof from the brief or the brand brain | Aagaard, L10 (trust components); Best, Copywriting (customer voice) | Every proof block traces to the brief |
| 12 | Write the form and the button | Claude | Ask only for the fields sales needs now; marketing opt-in unchecked and separate. Button copy finishes "When I click the button, I want to ___", starts with a verb, says what they get, and never says "Click here", "Submit" or "Buy now" | Aagaard, L11 Copy Tips; Best, Optimizing Opt-in Forms | Every extra field justified; button passes the sentence test |
| 13 | Write the thank-you page | Claude | Say what happens next and when, from the brief's sales enablement section (who will reach out, within what time) | The brief's section 7; Tyler Durman (MQL called within one business day) | Next step and time limit stated |
| 14 | Check speed and tracking | You | Run PageSpeed Insights and hand fixes to whoever builds the page. Conversion event, UTMs and CRM field mapping written down; one test submission before any traffic | Aagaard, L08; Campaign Engine rule | Test submission passed |
| 15 | Walk sign-off through the research | You | Before publishing, check the page against the six characteristics and walk the sign-off owner through the research and the outline (Aagaard budgets 1 to 2 hours) | Aagaard, L02, L03 | Sign-off recorded |
| 16 | Keep learning after launch | Claude | A/B test if traffic allows, otherwise compare periods. On the thank-you page, ask one question after 20 to 30 seconds ("Was there anything that almost kept you from booking today?") until 100 or more replies | Aagaard, L03, L09 | Test or comparison plan written; poll set |

## Specs

| Element | Spec | Source |
|---|---|---|
| Pages per campaign | One per offer; two at most unless a different offer or audience needs its own | Tyler Durman, 9 Oct 2026 |
| Headline | What they get, plain words, matches the ad; 2 alternates | Aagaard, L11 |
| First two screens | Value proposition, main points, the CTA | Aagaard, L10 |
| Navigation | None | Aagaard, L10 |
| Proof | 3 to 4 blocks next to the claims they support; only from the brief | Aagaard, L10; Campaign Engine rule |
| Button | Verb first, names the outcome; not "Click here", "Submit" or "Buy now"; same wording each time it repeats | Aagaard, L11 |
| Form | Only fields needed now; each extra field justified; opt-in unchecked | Best, Optimizing Opt-in Forms |
| Thank-you page | What happens next, who, and when | Brief section 7 |
| Speed | PageSpeed Insights run; fixes handed over (the course sets no threshold) | Aagaard, L08 |
| Tracking | Conversion event, UTMs, CRM mapping, one test submission | Campaign Engine rule |

## Outputs
- `projects/campaigns/<slug>/drafts/landing-page.md`: page brief, research notes by friction type, outline, headline and alternates, page copy section by section, proof blocks with sources, form and button, thank-you page, tracking notes, test plan

## Changes from the version it was based on
| Step | Change | Why |
|---|---|---|
| | Starter | |

Note on two sources: Jessica Best recommends "Buy now" as a literal button in conversion emails; Aagaard bans it on landing pages. Each rule applies to its own channel: the email button earns the click, the page button names what the visitor gets.
