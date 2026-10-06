---
type: workflow
channel: social-post
layer: starter
based_on: ""
status: starter
tools: [LinkedIn, GA4]
last_updated: "2026-10-06"
tags: [campaign-engine, workflow, social]
---

# Social (LinkedIn posts and document carousels)

Organic posts that carry the campaign's angle to the people the brief targets, from the people they trust. A small set of posts around one idea, not a content calendar.

Built from Andy Crestodina's CXL course, Content Strategy for Demand Generation (Eurekos 5178), and Tycho Luijten's B2B Demand Generation (8506). The courses do not teach LinkedIn post length, hook length or hashtags, so this starter sets no rule for them; the carousel step borrows AJ Wilcox's advice on paid document ads.

## Pulls in
- The brief: 3 Audience, 4 Offer, 5 Messaging, 6 Buying stage
- The brand brain: `icp.md` (their words), `positioning-messaging.md` (pillars, proof), `voice-guide.md` (tone for social), `vocabulary.md`
- Other drafts in this campaign (the blog post, the research) as source material; GA4 for which topics and networks bring engaged traffic

## Steps

| # | Step | Who | Rule | Source | Check before moving on |
|---|---|---|---|---|---|
| 1 | Pick topics that suit social | Claude | Surprising, emotional or opinionated topics; check in GA4 which topics won on social and which on search | Crestodina, Social Media Analytics; Content Funnels Session 1 | Each post's topic stated with why it fits social |
| 2 | Keep to the core topics | Claude | Every post belongs to one of the brand's 3 to 5 core topics and carries its point of view | Luijten, Define Your SMEs and Core Messaging | Topic named per post |
| 3 | Choose who posts | You | Posts go out from a named expert's personal profile first; personal profiles typically outperform the company page by about 10 times | Luijten, Define Your SMEs and Core Messaging | A named person per post |
| 4 | Mine the source asset | Claude | From the blog post, webinar or transcript, find the statements people are most likely to be surprised by and the best soundbite, and build each post from one | Crestodina, Content Strategy L3 | One finding or line per post, with its source |
| 5 | Take a stand | Claude | Find the ordinary topics professionals hold strong opinions about, and give each post one clear position | Crestodina, Content Strategy L3 | Each post states a position |
| 6 | Put people in it | Claude | Names, titles, faces, and at least one quote in quotation marks ("the quotation marks, the most powerful key on your keyboard") | Crestodina, Content Strategy L2 | Every post names or quotes a real person the brief clears |
| 7 | Write the hook | Claude | The first line earns the "see more" with a specific benefit, a number, or a surprise; no clickbait | Crestodina, Content Funnels Session 1 | Hook delivers what the post pays off |
| 8 | Add the visual | Claude | A compelling visual on every post: a person's face, a chart from the data, or a short native video | Crestodina, Content Funnels Session 1 | Visual brief written per post |
| 9 | Build the carousel, if there is one | Claude | Slides made for the format, each "big and beautiful, making one point and inviting someone to scroll"; never a text-heavy PDF | Wilcox, Validate and Scale your LinkedIn Ads, Ad Formats (paid document ads, applied to organic) | One point per slide |
| 10 | Tag the people | You | Tag everyone quoted, cited or who contributed, ideally people active on LinkedIn | Crestodina, Content Strategy L2 | Tags listed per post |
| 11 | Point to the destination | Claude | Posts that link carry UTMs; LinkedIn traffic is checked under both social and referral in GA4 | Crestodina, Conversions lesson; Social Media Analytics | UTMs match the brief |
| 12 | Approve and schedule | You | Approve each post, its poster and its date; space them across the campaign dates | Campaign Engine | Schedule written |
| 13 | Re-share what works | Claude | Keep the best posts in rotation; give an underperformer one more try, then stop | Crestodina, Social Media Analytics; Conversions lesson | Review date set |

## Specs

| Element | Spec | Source |
|---|---|---|
| Posts | 3 to 5 per campaign, one angle each | Campaign Engine default |
| Poster | A named expert's personal profile first | Luijten |
| Topic | One of the brand's 3 to 5 core topics, with its point of view | Luijten |
| People | Named, quoted or tagged in every post | Crestodina, L2 |
| Visual | One per post | Crestodina, Content Funnels |
| Carousel | One point per slide; no text walls | Wilcox, Ad Formats |
| Length, hook length, hashtags | No course rule; set your own if your team has one | Gap |
| UTM | On every link | Crestodina, Conversions lesson |
| Proof | Only proof from the brief or the brand brain | Campaign Engine rule |

## Outputs
- `projects/campaigns/<slug>/drafts/social-post.md`: each post (poster, topic, hook, body, visual brief, tags, link with UTM, date), carousel slides if any, review date

## Changes from the version it was based on
| Step | Change | Why |
|---|---|---|
| | Starter | |
