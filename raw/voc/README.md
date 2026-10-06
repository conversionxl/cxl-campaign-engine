# raw/voc/

Voice of customer: what your customers say, in their own words. The Campaign Engine reads this folder for the buyer's quoted thought in every brief (section 6) and for the words the drafts borrow. If you also run the Marketing Brain, its ICP exercise (`/marketing-brain:icp-dossier`) reads this folder and nothing else, so your brand's own copy never leaks into "their words".

`/ingest` leaves the files in this folder alone: they are module inputs, not inbox items. Drop something in the top of `raw/` instead, and `/ingest` or the next command you run will offer to move it here.

## What to add

| Input | Format | What it gives the ICP |
|---|---|---|
| Customer export | CSV. Minimum: an email and a revenue or spend column. Name, job title, company, and industry lift quality a lot. | Who your most valuable customers are |
| Reviews | Markdown, pasted verbatim | The words they use to describe the outcome |
| Support tickets | Markdown, trimmed threads | Pains, in their words |
| Sales or customer call notes | Markdown | Why they buy, and what almost stopped them |
| Survey answers | CSV or Markdown | Patterns at volume |
| User research, interview notes, message-test results | Any, in `research/` | Why they buy, and how they react to your words |
| Live pulls from a CRM, store, or payment tool | CSV or Markdown, in `live/`. Commands save these for you | LTV, repeat rate, win rate, and churn per segment |

You can also paste any of these into the chat while a command runs (it files them here), or let the command fetch them from a connected tool. See `frameworks/live-data-and-research.md`.

Public review pages (G2, Capterra, Trustpilot, app stores) go in `review-urls.md`, one URL per line. `/icp-dossier` scrapes them when it runs.

Keep quotes exactly as written: grammar, slang, typos. Do not clean them up. The exact wording is the whole point.

## Keep it local

Everything you add here stays on your machine. `.gitignore` excludes this folder except `README.md`, `review-urls.md`, and `example/`, so a `git push` never uploads your customer data.

**Before you share your screen**, strip or hash the email column. A quick way: ask Claude to "replace every email in raw/voc/customers.csv with a short hash, keep a local lookup file". Names and companies can stay if you are comfortable showing them; emails should not.

## No data yet?

Run the exercise on `example/`: Acme Deals, a fictional lifetime-deal marketplace with 18 customers, 10 reviews, 6 support tickets, and 4 sales-call notes. It is shaped like a real export and has a clear high-value segment to find.

## Credit

The ICP workflow and the Acme Deals example data come from Nick Christensen's [ship-icp-ads-automate-monitoring](https://github.com/nickyc1/ship-icp-ads-automate-monitoring) (MIT license, copy in `example/LICENSE`). The method behind it: [Find your rich avatar](https://www.nickbuilds.ai/blog/find-your-rich-avatar-matt-appsumo).
