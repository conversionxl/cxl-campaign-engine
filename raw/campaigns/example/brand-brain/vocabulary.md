---
type: brand
status: draft           # template | draft | final
last_updated: "2026-09-27"
sources:                # files in raw/voc/ and raw/brand/, scraped pages
  - raw/campaigns/example/brand-brain/positioning-messaging.md
  - raw/brand/example/on-brand/ads.md
  - raw/brand/example/off-brand/ads.md
  - raw/brand/example/guides/voice-rules.md
  - raw/voc/example/customers.csv
  - raw/voc/example/reviews.md
  - raw/voc/example/support-tickets.md
  - raw/voc/example/sales-call-notes.md
tags: [marketing-brain, voice, vocabulary, example]
---

# Vocabulary (example: Acme Deals)

> Example brand brain for Acme Deals, produced by the Marketing Brain exercises on the Acme data in `raw/voc/example/` and `raw/brand/example/`. Used only by `example` runs of the Campaign Engine commands. Your own brain lives in `wiki/brand/`, filled by the Marketing Brain plugin.

<!-- Example run of /brand-voice on Acme Deals, a fictional lifetime-deal marketplace. Framework: frameworks/vocabulary.md. Jargon is fine, buzzwords aren't. Customer words come verbatim from raw/voc/example/. -->

## Owned words

| Word or phrase | Means | Source |
|---|---|---|
| Buy once, bill clients monthly | The big idea: a one-time cost against recurring client income. | positioning-messaging.md, Big idea; on-brand/ads.md |
| Lifetime deals for agencies | The category. | positioning-messaging.md, Market; on-brand/ads.md page focus |
| Own it, don't rent it | Pillar 1: one-time pricing instead of a subscription. | positioning-messaging.md, Pillar 1; on-brand/ads.md |
| Margin on every retainer | Pillar 2: reselling the tool inside client retainers. | positioning-messaging.md, Pillar 2; on-brand/ads.md |
| Run more clients solo | Pillar 3: capacity without a hire. | positioning-messaging.md, Pillar 3; on-brand/ads.md ("Run 10 clients solo", "Run more clients without hiring") |
| The agency cheat code | Shorthand for the whole model. Borrowed from the top customer. | on-brand/ads.md; Jordan Reyes, reviews.md and customers.csv notes |

## Allowed jargon

| Term | Evidence buyers use it |
|---|---|
| margin | "I'm not buying software, I'm buying margin." (Jordan Reyes, sales-call-notes.md); "a dollar of margin" (Aisha Nelson, reviews.md) |
| retainer | "resell it into 8 client retainers" (Jordan Reyes, reviews.md) |
| overhead | "Overhead is what kills small agencies" (Jordan Reyes, reviews.md); "Every dollar of overhead I don't spend" (Aisha Nelson, reviews.md) |
| lifetime deal | "the lifetime deals are a cheat code for an agency" (Jordan Reyes, reviews.md) |
| resell | "I buy the tool once, resell it" (Jordan Reyes, reviews.md) |
| stack | "It's me and a stack of tools" (Tomas Becker, reviews.md) |
| seat | "or is it one per seat?" (Marisol Vega, ticket #4821) |
| client accounts | "use it for all my client accounts" (Marisol Vega, ticket #4821) |
| rebrand | "Can I rebrand the output" (Jordan Reyes, ticket #4902) |
| white-label | Subject line of ticket #4902, "white-label / reselling" (support-tickets.md). Weaker evidence: a subject line may be set by support, not typed by the customer. |
| one-time charge | "confirm this is a one-time charge, not a subscription that renews" (Derek Combs, ticket #5130). In-house segment, not the avatar. |

## Banned buzzwords

| Never | Write instead |
|---|---|
| unlock | Say what they get: "keep the margin" (off-brand #1; voice-rules.md) |
| game-changing | Name the change: "one payment, not a monthly bill" (off-brand #1; voice-rules.md) |
| best-in-class | Say who it is for: "built for solo agencies" (off-brand #2; voice-rules.md) |
| leverage (as a verb) | use, resell, bill (off-brand #3; voice-rules.md) |
| seamless | Cut it, or name the step that is easy (off-brand #3; voice-rules.md) |
| supercharge | Name the outcome: "margin on every retainer" (off-brand #3) |
| cost-effective, multi-tool value | "buy once, bill clients monthly" (off-brand #6) |
| delight your clients | "my clients think I have a whole team" (Tomas Becker's words) (off-brand #7) |
| scale your team | "run more clients without hiring". The buyer does not want a bigger team (off-brand #7; icp.md) |
| secret formula, explosive growth | "the agency cheat code" (off-brand #8; voice-rules.md) |
| revolutionary, synergy | Cut. Say the mechanism instead (off-brand #9; voice-rules.md) |
| disruptive, guru, ninja, rockstar, growth hacks | Cut (voice-rules.md) |
| modern agencies | solo agencies, small agencies (off-brand #6) |
| platform | deals, tools (off-brand #9) **(inferred)**: the sample bans the whole line, not this word alone |

Banned phrases, not single words: "anyone can do this", "no experience needed", "in just minutes" (voice-rules.md; off-brand #4, #5).

## Customer words vs our words

| We say | They say | Source |
|---|---|---|
| SaaS, renting software | "tool I don't have to pay monthly for", "software" | on-brand/ads.md; Marisol Vega, reviews.md; Jordan Reyes, sales-call-notes.md. No customer uses "SaaS". |
| White-label | "rebrand the output and put it in front of my clients" | on-brand/ads.md; Jordan Reyes, ticket #4902 |
| No seats | "use it for all my client accounts", "one per seat" | on-brand/ads.md; Marisol Vega, ticket #4821 |
| Look like a full team / a 10-person team | "think I have a whole team behind me" | on-brand/ads.md; Tomas Becker, reviews.md |
| Solo agency, one-person shop | "a team of one wearing nine hats" | on-brand/ads.md; Marisol Vega, reviews.md |
| Tools that pay for themselves | "pays for itself in a month and prints after that" | on-brand/ads.md; Jordan Reyes, sales-call-notes.md |
| Run more clients without hiring | "saves me from hiring" | on-brand/ads.md; Marisol Vega, customers.csv notes and sales-call-notes.md |

When they differ, customer-facing copy uses the customer's word. "SaaS" is the one to watch: it is in two on-brand lines and no customer quote.

## Open (inferred) tags

- Banned buzzword "platform": the off-brand line is banned as a whole; banning the single word is a reading of it.
