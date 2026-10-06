# raw/campaigns/

What the Campaign Engine reads about your campaigns: the briefs you have written before, what the last campaigns returned, what sales said about the leads, the pulls from your CRM, email and ad tools. `/campaign-brief` reads this folder first so the new brief starts from your history, not from a blank page.

`/ingest` leaves the files in this folder alone: they are module inputs, not inbox items. Drop something in the top of `raw/` instead, and `/ingest` or the next command you run will offer to move it here.

## What to add

| Input | Format | What it gives the engine |
|---|---|---|
| Past briefs and campaign plans | Markdown, PDF text, or a doc fetched from Drive, Notion or ClickUp | The sections you always fill, the specs you retype, the goals you set |
| Campaign results | Markdown or CSV: leads, meetings, cost, conversion per channel | Baselines for the goal, kill rules that held or did not |
| Sales feedback on campaign leads | Markdown: notes from reps and SDRs | What a good lead looks like to sales; the handoff that worked |
| CRM snapshot | Markdown or CSV, in `live/`: pipeline, average contract value, stage conversion rates | Pipeline math for big-C; realistic targets for small-c |
| Email and ad performance | Markdown or CSV, in `live/` or `results/` | Which subject lines, angles and audiences moved |
| Calendar | Markdown: launches, events, blackout dates | Dates and dependencies for section 9 |

You can also paste any of these into the chat while a command runs (it files them here), or let the command fetch them from a connected tool. See `frameworks/campaign-inputs.md`.

## Keep it local

Everything you add here stays on your machine. `.gitignore` excludes this folder except `README.md` and `example/`, so a `git push` never uploads your campaign data. Client briefs under NDA are fine here; they never leave the machine.

## No campaign data yet?

Run the commands with `example`: Acme Deals, the fictional lifetime-deal marketplace from the Marketing Brain, with two past briefs, last quarter's results, a CRM snapshot, sales feedback and a filled brand brain in `example/`. It is shaped like a real agency-segment campaign and has an obvious lesson in it.

## Credit

Acme Deals, its customers and its brand samples come from Nick Christensen's [ship-icp-ads-automate-monitoring](https://github.com/nickyc1/ship-icp-ads-automate-monitoring) (MIT, copy in `../voc/example/LICENSE`). The campaign history, CRM snapshot and sales feedback in `example/` are CXL's fictional extension of that data for this workshop.
