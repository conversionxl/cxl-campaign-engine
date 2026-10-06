---
type: brand
status: draft
last_updated: "2026-10-06"
sources:
  - raw/voc/example/customers.csv
  - raw/voc/example/reviews.md
  - raw/voc/example/support-tickets.md
  - raw/voc/example/sales-call-notes.md
tags: [marketing-brain, icp, example]
---

# ICP (example: Acme Deals)

> Example brand brain for Acme Deals, produced by the Marketing Brain exercises on the Acme data in `raw/voc/example/` and `raw/brand/example/`. Used only by `example` runs of the Campaign Engine commands. Your own brain lives in `wiki/brand/`, filled by the Marketing Brain plugin.

## The rich avatar

**Label:** Small marketing agency and consultancy owners.

**Role:** Founder, owner/operator, managing director, co-founder, or freelance consultant. These are the titles recorded for the six customers in this segment (`customers.csv`).

**Company type and size:** Marketing agencies and consultancies with 1 to 5 people (6 of 18 customer records).

**Business model:** Client services and retainers. Jordan Reyes reports 8 active client retainers; Marisol Vega serves about 12 clients (`sales-call-notes.md`).

**Why they buy:** The six customers spent $37,380, or 74.0% of the $50,481 recorded total, and placed 154 orders, averaging 25.7 orders each (`customers.csv`). Jordan describes buying tools once and reselling them into client retainers (`reviews.md`, `sales-call-notes.md`).

**What they are buying:** Margin from client work while avoiding added headcount. This as a shared buying motive is **(inferred)** from the segment totals, call notes, and reviews.

## Segment scorecard

Order count is the available repeat-purchase proxy. The export has no order-level dates, so it cannot establish purchase timing or retention. Conversion and cost-to-serve data are absent.

| Segment | Customers | Value | Repeat-purchase proxy | Conversion | Cost to serve | Tier |
|---|---:|---|---|---|---|---|
| Small agencies and consultancies | 6 | $37,380; 74.0% of spend | 154 orders; 25.7 per customer | Blank: no conversion data | Blank: no service-cost data | Core |
| Lone in-house marketers | 4 | $11,580; 22.9% of spend | 41 orders; 10.25 per customer | Blank: no conversion data | Blank: no service-cost data | Adjacent |
| Other buyers | 8 | $1,521; 3.0% of spend | 10 orders; 1.25 per customer | Blank: no conversion data | Blank: no service-cost data | Negative ICP for repeat-purchase messaging **(inferred)** |

The top two customers account for $16,030, or 31.8% of recorded spend. The dataset does not include transaction-level history or acquisition data (`customers.csv`).

## Negative ICP

The eight customers outside the agency/consultancy and in-house marketer groups placed 10 orders and spent $1,521 combined. They are a negative ICP only for messaging built around frequent repeat purchases **(inferred)**. The data does not show they are unprofitable: churn, conversion, and service costs are not supplied.

## Data vs strategy

No strategy answers or strategy document were supplied in example mode. This draft uses the best-supported observed segment, small agency and consultancy owners, as the core. No aspiration or strategic priority is inferred from outside the data.

## Segments below the avatar

**Lone in-house marketers:** Four customers at SaaS or ecommerce companies, with 6 to 200 employees. Their evidence points to reporting time, manual spreadsheet work, and quick time-to-value (`customers.csv`, `reviews.md`, `support-tickets.md`, `sales-call-notes.md`). They are adjacent, not the core resale-focused avatar.

**Other buyers:** Eight records across coaching, design, SaaS, retail, student, intern, and early-founder roles. The records show 10 orders total. Sam Okafor says, "Just exploring honestly. Grabbed it because it was cheap, haven't really dug in yet." (`reviews.md`).

## Their words

- "I'm not buying software, I'm buying margin. Every lifetime deal I resell into a retainer pays for itself in a month and prints after that." Jordan Reyes, BrightPath Agency, `sales-call-notes.md`.
- "The day I have to hire is the day my margin dies." Jordan Reyes, BrightPath Agency, `sales-call-notes.md`.
- "I'm a team of one wearing nine hats. Every tool I don't have to pay monthly for is one less thing draining the account. I've probably bought 25+ deals and I'd buy 25 more." Marisol Vega, Delta Creative, `reviews.md`.
- "My clients genuinely think I have a whole team behind me. It's me and a stack of tools I picked up here. Punching way above my weight and I like it that way." Tomas Becker, North Loop Digital, `reviews.md`.
- "Every dollar of overhead I don't spend is a dollar of margin. Simple as that. The only thing I want is to know which of these I'll actually still use in 6 months." Aisha Nelson, Scaleside, `reviews.md`.
- "Needs to work on day one. I do not have time to learn another dashboard or sit through a webinar to get value." Priya Shah, Orbit Growth, `reviews.md`.

## Desires

- Keep more of the money earned from client retainers (Jordan Reyes and Aisha Nelson, `reviews.md`, `sales-call-notes.md`).
- Serve more clients without hiring (Marisol Vega, `sales-call-notes.md`).
- Look like a larger team through a useful tool stack (Tomas Becker, `reviews.md`).
- Know a deal will still be useful in six months (Aisha Nelson, `reviews.md`).
- Rebrand output and put it in front of clients (Jordan Reyes, `support-tickets.md`). This is a stated desire, not evidence that every deal supports it.

## Pains

- Recurring software costs drain the account and reduce margin (Jordan Reyes and Marisol Vega, `reviews.md`).
- Hiring is seen as a threat to the agency's margin (Jordan Reyes, `sales-call-notes.md`).
- A one-person operation has many roles to cover (Marisol Vega, `reviews.md`).
- Seat-based licensing creates uncertainty about use across client accounts (Marisol Vega, `support-tickets.md`).
- Manual reporting and slow onboarding appear in the in-house segment's evidence, not as a proven core-avatar pain (Sofia Marin and Priya Shah, `support-tickets.md`).

## Sources and limits

- `raw/voc/example/customers.csv`: 18 customers, 205 orders, $50,481 total spend. Segment totals above are calculated from these rows; email addresses are excluded.
- `raw/voc/example/reviews.md`: 10 review excerpts.
- `raw/voc/example/support-tickets.md`: 6 ticket excerpts.
- `raw/voc/example/sales-call-notes.md`: 4 call summaries.
- No connected customer tools, strategy documents, review URLs, conversion data, churn, or service-cost data used.

## Open (inferred) tags

- The shared outcome of margin and capacity without hiring generalizes across the six agency/consultancy customers.
- The lowest-order segment is a negative ICP only for repeat-purchase messaging; no conversion, churn, or service-cost evidence is available.
