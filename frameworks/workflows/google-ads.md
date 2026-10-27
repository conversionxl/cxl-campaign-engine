---
type: workflow
channel: google-ads
layer: starter
based_on: ""
status: suggested
tools: [Google Ads, Google tag, Keyword Planner]
last_updated: "2026-10-27"
tags: [campaign-engine, workflow, ads, search]
---

# Google Ads (search)

Search ads for people already looking for what the campaign offers. Its job is the brief's KPI action, at or under the cost per action the campaign structure sets.

**Suggested, not yet course-built.** The other starters cite CXL course instructors step by step. This one cites Google Ads Help for the platform's rules and marks working practice (suggested). Walk it once in `/campaign-channels` before using it, and replace any (suggested) rule with your team's. Added because members typed their own Google Ads steps (cohort demo reviews, Oct 2026).

## Pulls in
- The brief: 1 Goal and metrics (kill and scale rules), 2 Audience (include, exclude, their words), 3 Offer and proof (destination, CTA, why now), 4 Messages, 5 Campaign structure (spend, return target and learning-phase runway), 7 Constraints (budget, Regulated)
- The brand brain: `icp.md` (the words buyers search with), `positioning-messaging.md`, `voice-guide.md`, `vocabulary.md`
- The landing page draft (headline, offer, anchor IDs); the CRM's customer list for exclusions, read only

## Steps

| # | Step | Who | Rule | Source | Check before moving on |
|---|---|---|---|---|---|
| 1 | Check people search for it | Claude | Look up monthly searches for the offer's terms and the buyer's words in Keyword Planner. If almost nobody searches for the problem or the offer, search ads cannot reach these buyers: say so and suggest another channel | Google Ads Help, Keyword Planner | Volumes stated per term, with the date |
| 2 | Size the budget to the goal | You | Work back from the brief: target actions ÷ expected conversion rate = clicks needed; clicks × expected cost per click = spend. A daily budget averages over the month, so monthly spend is about 30.4 × the daily budget | Google Ads Help, average daily budgets; the brief's campaign structure | Spend, expected clicks and cost per action stated |
| 3 | Install conversion tracking first | Google Ads | The Google tag on every page; one conversion action for the brief's KPI; when the KPI happens in the CRM (a qualified lead, a meeting), import those conversions from the CRM. Auto-tagging on | Google Ads Help, conversion tracking; offline conversion imports | Test conversion recorded |
| 4 | Fix the defaults | Google Ads | Search campaign with the Display Network off; location set to people in or regularly in the area, not people interested in it; search partners on or off on purpose; auto-applied recommendations reviewed, not left on | Google Ads Help, campaign settings; location options | Every setting checked |
| 5 | Build the keyword list | Claude | One ad group per theme of the buyer's search; your brand's own terms in a separate campaign (suggested); match types chosen per keyword | Google Ads Help, keyword matching options | Ad groups listed, each with its keywords and match types |
| 6 | Add negative keywords | Claude | Exclude searches that will never become the KPI: jobs and careers, free, definitions, and the brief's exclusions. Competitors' names only on purpose | Google Ads Help, negative keywords | Negative list written |
| 7 | Add your own audiences | Claude | Upload the customer list from the CRM to exclude current customers from an acquisition offer, or to bid for them in an upsell. Matched audiences usually beat raw targeting | Google Ads Help, Customer Match; Tyler Durman, demo reviews, 21 Oct 2026 | Lists and their use named |
| 8 | Write the responsive search ads | Claude | Per ad group, up to 15 headlines and 4 descriptions: the offer, why now and the buyer's own search words in the headlines; one specific CTA; claims only from the brief's proof. Repeat the landing page's headline and offer. Pin a headline only when it must show | Google Ads Help, responsive search ads | Counts within the specs; message matches the page |
| 9 | Add assets | Claude | Sitelinks to the page's sections (using its anchor IDs), callouts for the proof, a structured snippet for what is included | Google Ads Help, assets | Assets written |
| 10 | Score every ad before it runs | Claude | Score each ad 1 to 5 on their words, outcome-led and voice; cut anything under 4 and say why | Nick Christensen, ad-copy skill (Marketing Brain) | Scores shown; cuts explained |
| 11 | Choose the bidding | You | Start with a click-based strategy while conversions are few, then move to Maximize conversions or a target cost per action once tracking has data (suggested). A new or changed strategy shows "Learning": leave it until that ends | Google Ads Help, Smart Bidding | Strategy and the date to revisit it written |
| 12 | Launch | You, at launch | Launch with the tracking test passed; note the launch date per ad group | Campaign Engine rule | Launch date written |
| 13 | Read the search terms | Claude, at launch | Weekly: the searches that triggered the ads. Add the irrelevant ones as negatives and the good ones as keywords | Google Ads Help, search terms report | Weekly date set |
| 14 | Judge against the brief | Claude, at launch | Judge on cost per KPI action against the brief's return target and kill and scale rules, never on clicks alone; not while the bid strategy is learning | The brief's section 1; Google Ads Help, bid strategy status | Decision logged with the numbers |

## Specs

| Element | Spec | Source |
|---|---|---|
| Headlines | Up to 15 per ad, at least 3; 30 characters each | Google Ads Help, responsive search ads |
| Descriptions | Up to 4 per ad, at least 2; 90 characters each | Google Ads Help, responsive search ads |
| Display path | 2 fields, 15 characters each | Google Ads Help, responsive search ads |
| Sitelinks | Link text 25 characters; descriptions 35 each | Google Ads Help, sitelink assets |
| Callouts | 25 characters each | Google Ads Help, callout assets |
| Network | Search only; Display Network off | Google Ads Help, campaign settings |
| UTM | Auto-tagging on; UTMs as well, lowercase: source google, medium cpc, campaign the campaign's slug, content the ad's ID | The tracking convention in `frameworks/workflow-format.md` |
| Platform rules | Follow the policy for the brief's Regulated line (healthcare, financial services and others have their own rules); check before launch | Google Ads Help, advertising policies; gate row G20 |

## Outputs
- `projects/campaigns/<slug>/drafts/google-ads.md`: search demand, budget maths, settings, ad groups with keywords and match types, negative keywords, audiences, the ads per ad group (headlines and descriptions as pieces, one `###` per ad), assets, bidding plan, tracking, launch tasks

Scored with the ad tests column of the quality gate until you give it its own with `/quality-gate google-ads`.

## Changes from the version it was based on
| Step | Change | Why |
|---|---|---|
| | Starter | |
