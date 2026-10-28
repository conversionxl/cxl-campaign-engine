---
type: workflow
channel: google-ads
layer: starter
based_on: ""
status: starter
tools: [Google Ads, Google Tag Manager, Google Analytics 4, Keyword Planner, Search Console]
last_updated: "2026-10-28"
tags: [campaign-engine, workflow, ads, search]
---

# Google Ads (B2B search)

Search ads for B2B buyers already looking for what the campaign offers. Its job is the brief's KPI action, at or under the cost per acquisition the campaign structure sets.

Built from Jack Paxton's CXL course, Validate and Scale Your Google Ads (lesson transcripts titled "Improve your LTV:CAC ratio on Google Ads", lessons 1 to 12). The lesson 6 transcript in the course folder repeats lesson 5, so no rule here cites L06. Character limits come from Google Ads Help, because the course does not state them.

Jack's lens runs through every step: "Nobody reads ads. People read what interests them, and sometimes that happens to be an ad" (L01). B2B is not B2C: long sales cycles, six to ten people in a decision, so different ads for different roles, and no conversions expected from awareness campaigns.

## Pulls in
- The brief: 1 Goal and metrics (kill and scale rules), 2 Audience (include, exclude, buying stage, their words), 3 Offer and proof (destination, CTA, why now, the proof table), 4 Messages, 5 Campaign structure (spend, return target, learning-phase runway), 6 Sales handoff (what counts as a qualified lead), 7 Constraints (budget, Regulated)
- The brand brain: `icp.md` (roles and the words buyers search with), `positioning-messaging.md`, `voice-guide.md`, `vocabulary.md`
- Search Console queries for the site, product pages, sales call notes, support logs and chat transcripts in `raw/` (read only); the landing page draft (headline, offer, anchor IDs); the CRM's customer list

## Steps

| # | Step | Who | Rule | Source | Check before moving on |
|---|---|---|---|---|---|
| 1 | Fit the plan to the budget | You | Under $10,000 a month: search only, middle and bottom of the funnel. $5,000 to $20,000: add Performance Max and smart bidding once conversions are tracked. Over $25,000: a full funnel, with demand gen, YouTube and display. The most you can pay for a customer comes from lifetime value: aim for about 4 to 1 lifetime value to cost per acquisition | Paxton, L01, L02, L04, L12 | Monthly budget, its tier, and the most you can pay per acquisition stated |
| 2 | Map the buyer's stages and roles | Claude | Lay the sale out in time blocks (first touch, qualification, needs, proposal, negotiation, close). Give each campaign one funnel stage and the roles it speaks to: users and managers at awareness, analysts and influencers at consideration, the CFO or CEO at decision. Do not expect conversions from awareness or consideration campaigns | Paxton, L01, L02 | Each planned campaign has a stage and a role |
| 3 | Install tracking first | Google Tag Manager | Tag Manager with GA4, and the GA4 goals imported into Google Ads: at least a lead goal and an acquisition goal (with a free trial: lead, trial start, trial to paid). Enhanced conversions on; offline conversion uploads from the CRM with the click ID; auto-tagging on. Track the thank-you page, not the button click. Test in debug mode and with Tag Assistant before any spend | Paxton, L03, L04, L12 | Test conversion recorded for every goal |
| 4 | Plan the structure and the names | Claude | Account, campaigns, ad groups, ads. Build campaigns around themes (a use case, a persona, a problem, a solution, a comparison), planned on paper first; one campaign type per campaign. Name each campaign by geography, campaign type, funnel stage, audience, and the product or action | Paxton, L01, L02 | Campaign list with a name for each |
| 5 | Research the keywords | Claude | Sources: Keyword Planner, Search Console, Ahrefs or Semrush, your product pages, sales calls, support logs, chat and site search. In B2B start long-tail (four words or more) and industry-specific, with qualifiers such as enterprise or the problem's own words. Map each keyword to a stage: problems at the top, solutions, comparisons and reviews in the middle, product, pricing, demo and brand at the bottom. Themed ad groups, not single keyword ad groups | Paxton, L05 | Keywords listed by theme and stage, with volumes |
| 6 | Choose match types and the brand share | Claude | On a small budget start with exact match and expand with data. A starting split: 60% exact, 30% phrase, 10% broad (broad is for collecting data). Spend 10% to 25% defending brand terms and 75% to 85% on non-brand terms that find new buyers | Paxton, L05 | Match type per keyword; brand share stated |
| 7 | Add negative keywords | Claude | Keep an account-level and a campaign-level list from day one. Exclude modifiers that do not fit the offer (cheap or near me for enterprise software), and leave the same terms out of the copy | Paxton, L01, L02, L05, L09 | Both lists written |
| 8 | Layer audiences on the keywords | Claude | Add audience overlays, in-market segments and remarketing to every campaign. Upload the customer list to exclude current customers from an acquisition offer | Paxton, L05, L12; Tyler Durman, demo reviews, 21 Oct 2026 (matched audiences) | Audiences and exclusions per campaign |
| 9 | Split the budget | Claude | 60% to proven campaigns, 30% to testing, 10% to experiments. Across the funnel about 30% top, 45% middle, 25% bottom. Your two or three core segments get most of it; an emerging segment gets a small share on purpose | Paxton, L02, L07 | Budget per campaign adds up to the brief's |
| 10 | Choose the bidding | You | A new account starts on Maximize clicks or Maximize conversions (manual CPC suits a small niche account). Move to target CPA after 20 to 30 conversions a month (30 to 50 is steadier), and to target ROAS only after 30 a month with deal values passed back. Never start a new account on Performance Max, and never run two bid strategies on the same traffic. Smart bidding learns for two to four weeks | Paxton, L01, L07, L08 | Strategy chosen, and the conversion count that moves it to the next |
| 11 | Write the responsive search ads | Claude | Fill every headline and description field. Give the first positions jobs: 1 the brand or category, 2 the core benefit, 3 social proof ("CRM software for SMBs · save 12 hours a week · trusted by ..."). Combine performance, trust and proof, in the buyer's industry terms, with outcomes and numbers sales has validated. Write for the role: time saved for operators, cost and ROI for executives. Nothing generic like "best X, free trial today" | Paxton, L09, L10 | Every field filled; every claim from the brief's proof table |
| 12 | Add the assets | Claude | Always sitelinks and callouts; structured snippets and images when you have them; a lead form or call asset if sales prefers. Match sitelinks to the roles: case studies, pricing, a demo | Paxton, L10 | Sitelinks and callouts written |
| 13 | Score every ad before it runs | Claude | Score each ad 1 to 5 on their words, outcome-led and voice; cut anything under 4 and say why | Nick Christensen, ad-copy skill (Marketing Brain) | Scores shown; cuts explained |
| 14 | Fix the landing page before spending | You | Ad spend amplifies whatever is broken. Check load speed, mobile, forms and links, one clear CTA and cross-domain tracking; walk the page as a first-time visitor on mobile and desktop. Value above the fold, three to five form fields (or a multi-step form), and say what happens next ("We'll contact you within 24 hours") | Paxton, L12 | Page walked on both devices; next step stated |
| 15 | Launch | You, at launch | Launch with every goal's test conversion passed. In B2B, consider excluding weekends with ad scheduling, and narrow locations to where the best customers come from | Paxton, L11 | Launch date and schedule written |
| 16 | Review weekly, decide on 30 days | Claude, at launch | Weekly: CPC, CTR, cost per lead and CPA against their 30-day moving averages; fund what is above, pause what is below. Clean the search terms: add negatives, promote converting queries to keywords. Decide on 14- or 30-day windows, never on a day. Change budgets 10% to 20% a week. Give a bid strategy change a full month; review RSA assets after two to four weeks and test ads for four to six weeks with the experiments tool | Paxton, L02, L07, L08, L10, L11 | Weekly review date set |
| 17 | Judge against the funnel and the brief | Claude, at launch | Track cost per lead, per qualified lead, per sales-qualified lead and per acquisition, against the brief's kill and scale rules. Fewer than 15% of leads qualified, or under 20% accepted by sales, means the targeting is off; time on site under a minute or bounce over 70% means the keyword, ad and page do not match | Paxton, L11, L12 | Decision logged with the numbers |
| 18 | Step in when it drops | Claude, at launch | Look into a 20% CPA drop over 7 days, a 25% drop in conversions over 7 days, a 20% CTR drop over 14 days, or a new campaign under target after 5 to 7 days. Collect the data, find the anomaly, diagnose what changed, test a fix. In a crisis, cut test budgets first and move spend back to bottom-of-funnel campaigns | Paxton, L11, L12 | Cause named and the fix being tested |

## Specs

| Element | Spec | Source |
|---|---|---|
| Headlines | Up to 15 per ad, at least 3; 30 characters each; fill them all | Google Ads Help, responsive search ads; Paxton, L10 |
| Descriptions | Up to 4 per ad, at least 2; 90 characters each | Google Ads Help, responsive search ads |
| Display path | 2 fields, 15 characters each | Google Ads Help, responsive search ads |
| Sitelinks | Link text 25 characters; descriptions 35 each | Google Ads Help, sitelink assets |
| Callouts | 25 characters each | Google Ads Help, callout assets |
| Budget tiers | Under $10,000 a month: search, middle and bottom only; over $25,000: full funnel | Paxton, L02, L12 |
| Budget split | 60% proven, 30% testing, 10% experiments; funnel about 30 / 45 / 25 | Paxton, L02, L07 |
| Brand share | 10% to 25% brand, 75% to 85% non-brand | Paxton, L05 |
| Match types | Start 60% exact, 30% phrase, 10% broad | Paxton, L05 |
| Bid thresholds | Target CPA after 20 to 30 conversions a month; target ROAS after 30 with values | Paxton, L08 |
| Budget changes | 10% to 20% a week | Paxton, L07 |
| Benchmarks | Non-brand CTR 2% to 8%; impression share 65% to 90%; lifetime value to CPA about 4 to 1 | Paxton, L01, L04 |
| Form | Three to five fields, or a multi-step form | Paxton, L12 |
| UTM | Auto-tagging on; UTMs as well, lowercase: source google, medium cpc, campaign the campaign's slug, content the ad's ID | The tracking convention in `frameworks/workflow-format.md` |
| Platform rules | Follow the policy for the brief's Regulated line (healthcare, financial services and others have their own rules); check before launch | Google Ads Help, advertising policies; gate row G20 |

## Outputs
- `projects/campaigns/<slug>/drafts/google-ads.md`: budget tier and maximum CPA, the stage and role map, tracking plan, campaigns with their names, keywords by theme, stage and match type, negative lists, audiences, budget split, bidding plan, the ads per ad group (one `###` per ad, every headline and description), assets, landing page checks, launch tasks

Scored with the ad tests column of the quality gate until you give it its own with `/quality-gate google-ads`.

## Changes from the version it was based on
| Step | Change | Why |
|---|---|---|
| | Starter | |

Note on two lessons: lesson 2 puts small accounts on search and Performance Max, and lesson 7 says never to start a brand-new account on Performance Max. Both hold: a new account starts on search, and Performance Max joins once there are conversions to learn from (step 10).
