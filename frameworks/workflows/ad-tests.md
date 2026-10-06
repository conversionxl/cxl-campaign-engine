---
type: workflow
channel: ad-tests
layer: starter
based_on: ""
status: starter
tools: [LinkedIn Campaign Manager, LinkedIn Insight Tag]
last_updated: "2026-10-06"
tags: [campaign-engine, workflow, ads]
---

# Ad tests (LinkedIn)

A deliberate set of paid ads that tests one thing at a time against the ICP, set up so LinkedIn's defaults do not waste the budget.

Built from AJ Wilcox's CXL course, Validate and Scale your LinkedIn Ads (Eurekos 9354), with the legacy LinkedIn Experimentation course (Rob Muldoon) for testing and evaluation, and Nick Christensen's ad scoring. Where the two LinkedIn instructors disagree, this follows Wilcox, whose course is current. Google and Meta are not covered by these courses: for those, add a channel with `/campaign-channels` or use CXL's Meta (9348) and PPC (10226) courses.

## Pulls in
- The brief: 1 Goal, 3 Audience (targeting and exclusions), 4 Offer, 5 Messaging (angles), 8 Measurement (kill rule, budget), 9 Constraints
- The brand brain: `icp.md` (their words, roles, company types), `voice-guide.md`, `vocabulary.md`, `positioning-messaging.md`
- LinkedIn Campaign Manager, if connected: past CTR, CPC and conversion by ad; audience sizes
- `raw/campaigns/`: past ad results; the landing page draft in this campaign

## Steps

| # | Step | Who | Rule | Source | Check before moving on |
|---|---|---|---|---|---|
| 1 | Check LinkedIn is worth it | You | LinkedIn pays off when customer lifetime value is over about $10,000; below that, run it as a test. Commit 3 to 6 months and at least one deal's value in spend | Wilcox, Channel Planning; Cost Management Validation | LTV and commitment stated |
| 2 | Size the budget to the metric you will judge | Claude | About $1,000 to judge clicks (CTR, CPC), $5,000 or more to judge leads (conversion rate, CPL), $30,000 or more to judge revenue. A North America start is about $5,000 a month | Wilcox, Channel Validation; Cost Management Validation | The brief's KPI matches the budget level |
| 3 | Install tracking first | LinkedIn Insight Tag | Insight Tag on every page (not pages with patient or personal data), the Conversions API live, UTMs lowercase: utm_source=linkedin, utm_medium=paid_social, utm_campaign=the campaign name | Wilcox, Performance Tracking; Channel Planning | Test conversion recorded |
| 4 | Fix LinkedIn's defaults | LinkedIn Campaign Manager | Location set to "permanent"; Audience Expansion off; LinkedIn Audience Network off; manual CPC bidding, not Maximum Delivery (cheaper "more than 90% of the time") | Wilcox, Audience and Cost Management Part 2 | All four settings checked |
| 5 | Build the test audiences | Claude | One campaign per targeting type for the same persona (job title; skills plus seniority; groups plus seniority; job function plus seniority). No OR-targeting inside a test. 20,000 to 100,000 people each | Wilcox, Audience and Cost Management Part 1 | Audience size per campaign stated |
| 6 | Exclude who should not see it | Claude | Exclude current and past customers, competitors, employees and the brief's exclude list; when targeting skills or groups, exclude sales, marketing and business development unless they are the target | Wilcox, Audience and Cost Management Parts 2 and 3 | Exclusions match the brief's section 3 |
| 7 | Choose the objective | Claude | Website Visits for traffic to your page; Lead Generation only with LinkedIn's own forms; Engagement only for thought leader ads. Compare objectives only in separate campaigns | Wilcox, Audience and Cost Management Part 1; Muldoon, Testing Objective Options | Objective matches the brief's KPI action |
| 8 | Map the three stages | Claude | Cold audiences get thought leader, video or document ads with ungated value; people who engaged get single image or video ads with webinars or guides; people who engaged twice get the demo or consult offer. Each stage excludes the next so people move forward | Wilcox, Audience and Cost Management Parts 2 and 3 | Each stage has an offer and an exclusion |
| 9 | Decide what this test changes | You | Test in this order: ad type, objective, offer, creative, copy, landing page. Within the ad: format, then intro text, then image; the headline last. Change one thing per test | Wilcox, Audience Validation; Ad Creation and Validation | One variable named |
| 10 | Write the ads | Claude | Intro text about 160 characters with what's in it for them and a direct ask; headline under 70 characters with the asset type in brackets; image text seven words or fewer, in colours that stand out from LinkedIn blue. Each ad carries one angle in the buyer's words | Wilcox, Ad Formats; Muldoon, Best Practices for Ad Copy and Creative | Every ad within the limits |
| 11 | Score every ad before it runs | Claude | Score each ad 1 to 5 on their words, outcome-led and voice; cut anything under 4 and say why | Nick Christensen, ad-copy skill (Marketing Brain) | Scores shown; cuts explained |
| 12 | Launch a clean A/B | You | Two ads per campaign (four at most); launch the variants together; name each ad with its launch date and A or B | Wilcox, Ad Creation Scaling; Ongoing Management | Two ads per campaign, named |
| 13 | Set and walk the bid | LinkedIn Campaign Manager | Bid well below LinkedIn's suggested range. After 2 to 4 business days, raise the bid if under-spending, lower it if spending in full. Below 1% CTR, always bid per click | Wilcox, Cost Management Validation; Muldoon, Understanding Bidding | Bid date and rule written |
| 14 | Judge the result | Claude | Not before 3,000 impressions per variant and a frequency of 6 to 8 a month. Judge on link CTR, link CPC and click conversions; compare single-image CTR with the 0.45% benchmark. Log the test in a testing journal | Muldoon, Evaluating Results; Wilcox, Performance Tracking; Ad Formats | Decision rule and journal entry written |
| 15 | Refresh and scale | Claude | Refresh creative every 28 to 33 days or when CTR falls and CPC rises. Scale in this order: new audiences, new targeting types, new ad types or offers, then bids and budget last | Wilcox, Ad Creation and Validation; Scale your Audience; Channel Scaling | Refresh date and next scaling step written |

## Specs

| Element | Spec | Source |
|---|---|---|
| Intro text | About 160 characters | Wilcox, Ad Formats |
| Headline | Under 70 characters; asset type in brackets | Wilcox, Ad Formats |
| Image text | Seven words or fewer | Wilcox, Ad Formats |
| Ads per campaign | 2; 4 at most | Wilcox, Ad Creation Scaling |
| Audience per test | 20,000 to 100,000 | Wilcox, Audience and Cost Management Part 1 |
| Settings | Permanent location; no Audience Expansion; no Audience Network; manual CPC | Wilcox, Audience and Cost Management Part 2 |
| Budget | $1,000 (clicks), $5,000+ (leads), $30,000+ (revenue) | Wilcox, Channel Validation |
| North America CPC | $10 to $16 for website visits | Wilcox, Channel Planning |
| Judge after | 3,000 impressions per variant; frequency 6 to 8 a month | Muldoon, Evaluating Results; Optimizing Bids |
| CTR benchmark | 0.45% for single image | Wilcox, Ad Formats |
| Creative refresh | Every 28 to 33 days | Wilcox, Ad Creation and Validation |
| Scoring | 1 to 5 on their words, outcome-led, voice; under 4 is cut | Nick Christensen |
| UTM | Lowercase; source linkedin, medium paid_social, campaign the campaign name | Wilcox, Performance Tracking |

## Outputs
- `projects/campaigns/<slug>/drafts/ad-tests.md`: channel check, budget, tracking checklist, settings checklist, audiences and exclusions, objective, stage map, the variable under test, scored ads per campaign, bid plan, decision rule, refresh and scaling plan

## Changes from the version it was based on
| Step | Change | Why |
|---|---|---|
| | Starter | |
