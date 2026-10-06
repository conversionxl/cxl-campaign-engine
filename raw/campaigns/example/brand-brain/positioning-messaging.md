---
type: brand
status: draft
last_updated: "2026-10-06"
sources:
  - raw/campaigns/example/brand-brain/icp.md
  - raw/brand/example/on-brand/ads.md
  - raw/brand/example/off-brand/ads.md
  - raw/brand/example/guides/voice-rules.md
  - raw/voc/example/customers.csv
  - raw/voc/example/reviews.md
  - raw/voc/example/support-tickets.md
  - raw/voc/example/sales-call-notes.md
tags: [marketing-brain, positioning, messaging, example]
---

# Positioning and messaging (example: Acme Deals)

> Example brand brain for Acme Deals, produced by the Marketing Brain exercises on the Acme data in `raw/voc/example/` and `raw/brand/example/`. Used only by `example` runs of the Campaign Engine commands. Your own brain lives in `wiki/brand/`, filled by the Marketing Brain plugin.

## Part 1: Positioning

### Customer

- **Target segment:** Small marketing agency and consultancy owners, usually 1 to 5 people: 6 customers and 74.0% of recorded spend (`icp.md`).
- **Buying champion:** Founder, owner/operator, managing director, co-founder, or freelance consultant (`customers.csv`).
- **Company types:** Marketing agencies and consultancies. Adjacent segment: lone in-house marketers at SaaS and ecommerce companies (`icp.md`).
- **Primary use case:** Buy a tool once, resell it into client retainers, and keep the difference (`Jordan Reyes, reviews.md`).
- **Buying context:** Ben Ortiz says, "I buy first and find the use case later if the deal is good enough" (`reviews.md`). Aisha Nelson wants to know which tools she will "actually still use in 6 months" (`reviews.md`). The dataset does not state a purchase deadline.

### Market

- **Market category:** Lifetime deals for agencies (`on-brand/ads.md`; also Jordan Reyes, `reviews.md`).

### Competitive alternatives

| Alternative solution | Limitation evidenced in the sources |
|---|---|
| Pay monthly for software subscriptions | Recurring costs drain the account: "Every tool I don't have to pay monthly for is one less thing draining the account" (Marisol Vega, `reviews.md`). |
| Hire someone | The cost threatens the agency's margin: "The day I have to hire is the day my margin dies" (Jordan Reyes, `sales-call-notes.md`). |
| Let clients find and buy their own tools | The agency loses a service it sees as part of its value: "Half my value to them is that I bring the tools so they don't have to go shopping" (Jordan Reyes, `support-tickets.md`). |

### Problems we solve

- **Problem summary:** Monthly tool costs and hiring pressure both appear in customers' descriptions of margin risk. The causal summary that these are the two main constraints on agency growth is **(inferred)** from Jordan Reyes and Marisol Vega (`reviews.md`, `sales-call-notes.md`).
- **Problem in buyer language:**
  - "Overhead is what kills small agencies and this is the opposite of overhead." Jordan Reyes, BrightPath Agency, `reviews.md`.
  - "The day I have to hire is the day my margin dies." Jordan Reyes, BrightPath Agency, `sales-call-notes.md`.
  - "I'm a team of one wearing nine hats." Marisol Vega, Delta Creative, `reviews.md`.
- **Sub-problems:**
  1. Monthly bills for tools in the stack (Marisol Vega, `reviews.md`; `on-brand/ads.md`).
  2. Uncertainty about whether one purchase covers every client account (Marisol Vega, `support-tickets.md`).
  3. The question of whether tools can be rebranded for clients (Jordan Reyes, `support-tickets.md`).
- **Struggles and limitations:**
  1. "Every tool I don't have to pay monthly for is one less thing draining the account" (Marisol Vega, `reviews.md`).
  2. "I run everything under my one login to keep costs down" (Marisol Vega, `support-tickets.md`).
  3. The ticket asks whether Acme's tools can be rebranded; it does not establish that alternatives cannot. Any claim that competing tools cannot be rebranded is **(inferred)** (Jordan Reyes, `support-tickets.md`).

### Unique attributes

The ads describe one-time pricing, no seats, no renewals, and tools that can be rebranded and resold (`on-brand/ads.md`). The one-time pricing, seat, renewal, rebrand, and resale terms are not independently verified for every deal. Tickets #4821 and #4902 are questions about licensing, not confirmation of product terms (`support-tickets.md`).

## Part 2: Messaging

### Owned key message

- **Owned key message:** Buy once, bill clients monthly. (`on-brand/ads.md`, scored 5/5.)
- **What it means:** The ad presents a one-time tool purchase that can be resold into recurring client retainers. Jordan Reyes describes reselling a tool into 8 retainers and pocketing the difference (`on-brand/ads.md`; `reviews.md`).
- **VOC validation and reframe:** "I'm not buying software, I'm buying margin. Every lifetime deal I resell into a retainer pays for itself in a month and prints after that." Jordan Reyes, BrightPath Agency, `sales-call-notes.md`. Reframe: software as a way to earn margin, not only as a cost.

### Value proposition

- **Internal shorthand:** Margin on every retainer; overhead stays flat (`on-brand/ads.md`).
- **Customer-facing:** Own it once, bill it into retainers, keep the margin. (`on-brand/ads.md`, verbatim.)

### Messaging pillars

| Value theme | Pillar statement | Source |
|---|---|---|
| Money | Own it, don't rent it. | `on-brand/ads.md` |
| Capability | Resell to every client. | `on-brand/ads.md`; the applicable rights are unverified by deal |
| Status | Run more clients without hiring. | `on-brand/ads.md` |

### Our solution

| Row | Pillar 1: Own it, don't rent it | Pillar 2: Resell to every client | Pillar 3: Run more clients without hiring |
|---|---|---|---|
| Capability | Pay for software once (`on-brand/ads.md`). | Rebrand tools and resell them to clients (`on-brand/ads.md`); rights are unverified. | Build a stack of tools in place of added staff (`on-brand/ads.md`); the tool functions are not specified. |
| Benefit | No seats, no renewals, no surprise invoices (`on-brand/ads.md`); terms are not independently verified. | "Margin on every retainer" (`on-brand/ads.md`; Jordan Reyes, `reviews.md`). | Serve more clients without hiring (`on-brand/ads.md`; Marisol Vega, `sales-call-notes.md`). |
| Outcome | Keep recurring software costs down (Marisol Vega, `support-tickets.md`). | "Pocket the difference every month" (Jordan Reyes, `reviews.md`). | "My clients genuinely think I have a whole team behind me" (Tomas Becker, `reviews.md`). |
| VOC validation | "Every tool I don't have to pay monthly for is one less thing draining the account" (Marisol Vega, `reviews.md`). | "I buy the tool once, resell it into 8 client retainers, and pocket the difference every month" (Jordan Reyes, `reviews.md`). | "If it saves me from hiring, it's worth it" (Marisol Vega, `sales-call-notes.md`). |
| Supporting features | One payment, no seats, no renewals (`on-brand/ads.md`); offer terms need verification. | White-label and resale are stated in the ads, but support tickets ask whether the rights apply (`on-brand/ads.md`, `support-tickets.md`). | Blank: the sources do not name the tools' functions. |
| Proof points | Blank: no verified product results or case studies supplied. | Blank: no verified results or permissioned case study supplied. | Blank: no verified capacity or hiring results supplied. |

### Differentiation snapshot

- **Core summary:** Acme Deals' ads position its lifetime deals as one-time tool purchases agencies can bill into client retainers (`on-brand/ads.md`; Jordan Reyes, `reviews.md`).
- **Against monthly subscriptions:** One-time pricing is the advertised alternative; each offer's terms need verification (`on-brand/ads.md`).
- **Against per-seat software:** The ad says "No seats"; the customer ticket asks whether a purchase covers all client accounts, so universal access is unverified (`on-brand/ads.md`; Marisol Vega, `support-tickets.md`).
- **Against clients buying their own tools:** The ads claim rebrand and resale use; Jordan's question does not confirm the terms (`on-brand/ads.md`; `support-tickets.md`).
- **Against hiring:** The ads promise more client capacity without hiring, but the sources provide no quantified product evidence (`on-brand/ads.md`; Marisol Vega, `sales-call-notes.md`).

## Evidence check

No performance report, analytics, message test, or conversion data was supplied. The OKM, all three pillars, and their landing-page performance cannot be judged for conversion. Customer quotes validate language and use cases, not message performance. No page data was available to compare with a site average or to confirm whether converting traffic matches the ICP.

## Other alternatives and gaps

- **Manual work:** The in-house marketers describe manual reporting, but the agency avatar does not describe doing its work by hand. Saying manual work caps the avatar's capacity is **(inferred)** (Sofia Marin and Nadia Khoury, `support-tickets.md`).
- **Other marketplaces:** Blank. No competitor marketplace is named in the sources.
- **Licensing terms:** Rebrand, resale, no-seat, and renewal terms need product-owner verification before being stated as universal product facts.
- **Proof:** The source set has customer anecdotes but no product-level results, case studies, or verified metrics.

## Fluff review

- **Empty charm risk:** "Run more clients without hiring. The tools do the heavy lifting." The second sentence is natural but vague; name the tool mechanism or add verified evidence. Source: `on-brand/ads.md`.
- **Jargon jungle:** "Leverage our perpetual licensing architecture to eliminate per-seat SaaS overhead across 10+ client accounts." This generated demo line is specific but formulaic; use "One payment, every client. No seats, no renewals" only where the terms are verified. Source: `off-brand/ads.md`, line 10.

## Open (inferred) tags

- The problem summary treats recurring tool bills and hiring pressure as the two main agency growth constraints.
- Other tools cannot be rebranded. The ticket asks about Acme and does not establish this comparison.
- Manual work is an alternative that caps the avatar's capacity. Manual-work evidence comes from the adjacent in-house segment.
