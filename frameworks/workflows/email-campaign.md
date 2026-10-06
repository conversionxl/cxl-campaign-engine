---
type: workflow
channel: email-campaign
layer: starter
based_on: ""
status: starter
tools: [email platform, rendering tool]
last_updated: "2026-10-06"
tags: [campaign-engine, workflow, email]
---

# Email campaign

One-off or short-run sends to a list you already have (customers, subscribers, a segment): the announcement, the invitation, the reminder. Not the triggered nurture; that is `email-sequence`.

Built from Jessica Best's CXL course, Email Marketing Fundamentals (all 14 lessons).

## Pulls in
- The brief: 1 Goal, 3 Audience (include and exclude), 4 Offer, 5 Messaging, 8 Measurement, 9 Constraints
- The brand brain: `voice-guide.md`, `vocabulary.md`, `positioning-messaging.md` (proof points), `icp.md` (their words)
- The email platform, if connected: list sizes, last send date, bounce, unsubscribe and complaint rates, past subject line performance
- `raw/campaigns/`: past campaign results and the marketing calendar

## Steps

| # | Step | Who | Rule | Source | Check before moving on |
|---|---|---|---|---|---|
| 1 | Place it on the calendar | Claude | The send belongs to a campaign already on the calendar and carries the same hero offer as the site and social that day; it is not written from a blank page on send day | Best, Being Ready | Date and hero offer match the brief and the calendar |
| 2 | Confirm the list is permissioned | You | Every recipient opted in themselves: no bought or rented lists, no pre-checked marketing boxes. A bought 25,000-address list returned a 12% bounce rate and 0 conversions | Best, The Importance of Permission; Legal and Privacy | Source of the list stated |
| 3 | Run the deliverability check | Email platform | The list was sent to in the last 30 days, and recent sends stayed under 1 to 1.5% hard bounces, under 1% unsubscribes and under 0.1% spam complaints | Best, Deliverability | Numbers pulled or entered; any breach flagged before writing |
| 4 | Choose versioning or segmentation | Claude | Say whether the whole list gets versions (swapped subject, hero and headline by known behaviour, with a default for unknowns) or only a segment gets the send. Personalise only on data the subscriber expects you to have | Best, Data that Drives Content | Include and exclude lists match the brief; a default version exists |
| 5 | Write the subject line | Claude | The offer is in the subject line, under 45 characters, with the offer or first name in the first 25 (a 43% lift in one study). Intriguing at most, never misleading | Best, Copywriting; Legal and Privacy | Two options per email, both within the limit |
| 6 | Write the preheader as a pair | Claude | The preheader extends the subject line rather than repeating it or holding the punchline, and never says "if you can't see this email, click here" | Best, Copywriting | Reads as one thought with the subject |
| 7 | Write the body for a four-second skim | Claude | No paragraph over two or three sentences; key lines bold or bulleted; at least one customer voice; the email's job is the click, not the sale | Best, Copywriting; Design | One angle, one customer voice, under 200 words |
| 8 | Lay out the email | Claude | Small logo header, then hero, headline, body, and the button, in an inverted pyramid that points at the button. If there is one action you always want, repeat it at the top and in the footer | Best, Being Ready; Design | Order as stated; one primary action |
| 9 | Build the button | Claude | A real button (a coloured table cell, not an image), at least 40 px, with space around it. Literal copy that matches the stage: "Learn more" to educate, a direct verb to convert | Best, Copywriting; Design | One button, literal copy, matches the brief's CTA |
| 10 | Make it work with images off | Claude | Live text at 14 pt or larger, no words inside images, alt text on every image, no background images. Up to 25% of readers have images off | Best, Design | The email reads fully with images off |
| 11 | Add video or GIF only if it earns it | Claude | A GIF's first frame works alone (Outlook shows only frame 1). A video is a linked still of a person, with copy saying what you will see, the length if over 2 minutes, and a "Watch the video" button | Best, Rich Media | Skip unless the brief has the asset |
| 12 | Check the legal footer | You | The from name identifies the sender, unsubscribe works immediately, and the footer has a physical address | Best, Legal and Privacy | All three present |
| 13 | Test the render | Rendering tool | Preview across inboxes, in dark mode (up to 35% of readers) and for colour-blind contrast; fix buttons and logos that vanish on dark backgrounds | Best, Design | Dark mode checked |
| 14 | Set the test and the report | Claude | If this send carries the month's test, name the hypothesis and the one winning metric first. UTMs on every link. The report answers: right audience, engaged, next step taken, with a "so what" for each number | Best, Data that Drives Optimization | Hypothesis and winning metric written; UTMs match the brief |

## Specs

| Element | Spec | Source |
|---|---|---|
| Emails | 1 to 3 (announcement, reminder, last call) | Campaign Engine default |
| Subject line | Under 45 characters; offer or first name in the first 25; 2 options per email | Best, Copywriting |
| Preheader | Extends the subject; never repeats it | Best, Copywriting |
| Body | Under 200 words; paragraphs of 2 to 3 sentences; one angle | Best, Copywriting |
| Button | One primary action; at least 40 px; literal copy | Best, Design |
| Text | Live text, 14 pt or larger; alt text on every image | Best, Design |
| Width | Designed at 600 px, built at 1,200 px for retina | Best, Being Ready |
| Deliverability floor | A send in the last 30 days; hard bounces under 1.5%, unsubscribes under 1%, complaints under 0.1% | Best, Deliverability |
| Footer | Sender, working unsubscribe, physical address | Best, Legal and Privacy |
| UTM | Source, medium, campaign from the brief's section 8 | Campaign Engine rule |

## Outputs
- `projects/campaigns/<slug>/drafts/email-campaign.md`: segment and suppression, deliverability check, each email (two subject lines, preheader, body, button, alt text), send dates, the test plan, UTMs

## Changes from the version it was based on
| Step | Change | Why |
|---|---|---|
| | Starter | |
