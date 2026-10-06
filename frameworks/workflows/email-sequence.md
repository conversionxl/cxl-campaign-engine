---
type: workflow
channel: email-sequence
layer: starter
based_on: ""
status: starter
tools: [email platform, CRM]
last_updated: "2026-10-06"
tags: [campaign-engine, workflow, email]
---

# Email sequence

A triggered sequence to people who took the offer (downloaded, registered, replied), built to move them to the brief's KPI action, usually a meeting. Build value, then ask.

Built from Jessica Best's CXL course, Email Marketing Fundamentals, and Tyler Durman's sequences (2022 and 2025). Every email in the series also follows `email-campaign` steps 5 to 13 (subject line, preheader, body, layout, button, images, footer, render).

## Pulls in
- The brief: 1 Goal, 4 Offer, 5 Messaging (angles and proof), 6 Buying stage, 7 Sales enablement, 8 Measurement
- The brand brain: `voice-guide.md`, `vocabulary.md`, `positioning-messaging.md` (proof points, objections), `icp.md` (their words)
- `raw/campaigns/`: past sequence performance, sales feedback on objections; the CRM for stage definitions

## Steps

| # | Step | Who | Rule | Source | Check before moving on |
|---|---|---|---|---|---|
| 1 | Name the trigger | Claude | The sequence starts at one known intent signal (a form fill, a download, a reply) and is one of the standard programmes: welcome, lead nurture, site-visitor remarketing, cross-sell, referral or re-engagement | Best, Data that Drives Timing | One trigger, named as the CRM or email tool records it |
| 2 | Confirm the record lives in one place | You | The contact, the form data and the email results land on one record; for a business with a sales team, that is the CRM. A source that is not connected gets an integration before launch | Best, Connected Systems | Where the record lives is written down |
| 3 | Plan the sequence before the form goes live | You | The sequence is written, loaded and tested before the lead form and the asset launch | Best, Get Ready for List Growth ("make sure that's in place before you launch the lead form") | Sequence ready date is before the form's launch date |
| 4 | Check the capture form | Claude | The form says what they get in one or two sentences, sets how often you will email, explains data use with a privacy link, keeps marketing opt-in unchecked and separate from the asset request, and asks only for fields needed now | Best, Optimizing Opt-in Forms ("the 4 Ps"); Legal and Privacy | Every field has a reason sales or the sequence needs it |
| 5 | Map the four emails | Claude | Offer, value, value, ask. Email 1 delivers the asset and nothing else in its body. Emails 2 and 3 each build value on one angle with its proof. Email 4 is the direct ask. Every email also carries the brief's ask, more direct each time, so the asset is never the end of the path | Tyler Durman, 2022 and 2025 sequences; TAP plan ("4-step email sequence to build value, then ask for the demo request") | A one-line plan per email: angle, proof, ask |
| 6 | Email 1 delivers the promise, now | Claude | Sent immediately; the subject line says the asset is inside ("the guide you requested is inside"). It offers one link per reason to buy, and the click decides the hero of email 2 | Best, Data that Drives Timing; Data that Drives Content | Sends at day 0; subject names the asset |
| 7 | Answer the sales objections | Claude | At least one email answers the question sales hears most before the prospect asks it. Any incentive is held back for the last email, not the first | Best, Get Ready for List Growth; the brief's section 7 and sales feedback | The top objection from the brief or `raw/campaigns/` is answered |
| 8 | Thread the replies | Claude | Emails 2 to 4 reply on email 1's subject line ("Re: ...") where the tool allows, read as one person writing, and end with a binary in email 4: bad timing, or not relevant | Tyler Durman, Nov 2025 vertical brief; 2022 LinkedIn sequence | Threading set; email 4 closes with the binary |
| 9 | Line up with sales touches | You, Sales lead | Two to four emails over about two weeks, timed against the rep's calls (for example a call and an email on day 1, another email on day 3 if sales has not reached them) | Best, Data that Drives Timing; Get Ready for List Growth | Timing agreed with the sales owner in the brief |
| 10 | Handle variation with blocks | Claude | Variation by segment or source uses reusable dynamic blocks with a default for unknowns, not whole extra versions | Best, Data that Drives Content | One sequence; variants are blocks |
| 11 | Approve the ask | You | Approve the ask in email 4 and the send timing before anything is loaded | Campaign Engine; Tyler Durman ("approved sequence") | Approval recorded |
| 12 | Write the exit rules | Claude | A contact leaves the moment they take the KPI action or move lower in the funnel (a booking stops the sequence; a reply hands them to sales) | Best, Data that Drives Timing | Every exit names the event that triggers it |
| 13 | Set the tail | Claude | The sequence works for up to 90 days toward the first conversion. Contacts with no open or click in a year go to a three-email re-engagement (ask, remind, goodbye), and non-responders are removed | Best, Data that Drives Timing; Get Ready for List Growth | End date set; re-engagement route named |
| 14 | Measure the next step, not opens | Claude | Success is the brief's KPI (meetings booked), attributed by UTM or email matchback. Open rate is noisy; replies often predict meetings better than clicks | Best, Data that Drives Optimization | KPI and attribution method written |

## Specs

| Element | Spec | Source |
|---|---|---|
| Emails | 4; 2 to 4 over about two weeks, longer only if the stage is early | Best, Data that Drives Timing; Tyler Durman |
| Timing | Day 0, 2, 5, 8 unless the brief or sales timing says otherwise | Campaign Engine default |
| Email 1 | Sent at once; delivers the asset; subject names it | Best, Data that Drives Timing |
| Every email | One angle, one proof line, one ask; under 150 words (email 1 under 80) | Best, Copywriting; Tyler Durman |
| Subject lines | Under 45 characters; 2 per email | Best, Copywriting |
| Threading | Emails 2 to 4 as replies on email 1's subject where the tool allows | Tyler Durman |
| Exit | Stops on the KPI action, a reply, or a move lower in the funnel | Best, Data that Drives Timing |
| Horizon | Up to 90 days | Best, Data that Drives Timing |
| Creative rules | `email-campaign` steps 5 to 13 | Best |

## Outputs
- `projects/campaigns/<slug>/drafts/email-sequence.md`: trigger, record, form check, the plan, four emails, timing against sales, exit rules, tail, KPI and attribution

## Changes from the version it was based on
| Step | Change | Why |
|---|---|---|
| | Starter | |

Note on two sources: Jessica Best holds an incentive for the last email; Tyler Durman attaches the meeting ask to every email. Both hold here: every email carries the ask, and any extra incentive (a discount, a gift) waits for the end.
