---
type: framework
used_by: /campaign-brief, /campaign-channels, /campaign-draft, /campaign-review, /campaigns
tags: [campaign-engine, campaign-page, sharing]
---

# Campaign page

One shareable page per campaign. Each step adds or updates its own tab, so the brief, the channels, the drafts, the review and the results end up in one place you can send to a teammate, a manager or sales.

Template: `frameworks/campaign-page-template.html`. Copy its `<style>` and `<script>` unchanged; fill only the `{{...}}` slots. When publishing as an Artifact, drop the `<!doctype>`, `<html>`, `<head>` and `<body>` tags and keep everything inside them, `<title>` first: the Artifact adds its own skeleton.

**Worked example:** the November AI Native Marketer sprint page in the CXL vault.

## When it is offered

At the end of `/campaign-brief`, after the approve question is answered, ask once: **"Want a page for this campaign you can share? Each step adds a tab to it. 1 Yes · 2 No"**.

- **Yes:** build the page with the Brief tab filled, the Touchpoints tab showing the campaign structure, and the other tabs showing "Not started yet". Record where it lives in the brief's frontmatter as `page:` (the Artifact link, or the file path).
- **No:** record `page: none`. Never ask again for this campaign.

Every later command checks `page:`. If there is one, it updates its own tab and the header at the end of its run, without asking, and ends its reply with the link. If it is `none`, it does nothing.

## Where it goes

- **The Claude app, Cowork, or Claude Code with Artifacts:** publish as a private Artifact titled "<Campaign name>". Each update republishes to the same link, so the link never changes.
- **Anywhere else:** write `page.html` in the campaign's folder (nested inside its main campaign for a sub-campaign) and give the path. Links between pages are then relative file links. It opens in any browser and can be emailed.

The campaign board (`/campaigns`) links each campaign to its page.

## What goes in each tab

Short, like everything this engine writes. The page is a view of the files, not a copy of them: the files stay the source. **These six tabs are the whole page.** Anything outside them (a tab, a section, a badge, a header line) is asked about first, and every update is checked against the budgets: the `keep-it-compact` skill.

| Tab | Filled by | Shows |
|---|---|---|
| **Brief** | `/campaign-brief` | The At a glance block as a card, then sections 1 to 7 as a compact grid (a brief from before 0.10.0: its own sections). Sources and the Gate 1 table folded. Never decision-model results |
| **Touchpoints** | `/campaign-channels`, `/campaign-draft` | Where and when the buyer meets the message: one table in date order, one row per touchpoint (week or date, channel, the piece's ID and name, the segment, the message it carries, the CTA). Built from the brief's campaign structure and each draft's calendar; each piece ID links to that piece in the Content tab. Before drafting, the rows come from the campaign structure and the pieces show "not drafted yet" |
| **Content** | `/campaign-draft`, `/campaign-review` | What each touchpoint says, and whether it is ready. **First the review summary** (after `/campaign-review`): the top three fixes, each with its "Copy starter prompt" pill; then the scores table, one row per channel with the route, and a column per checker: **"Claude (self-review)"**, then Jev and Clef when they ran, then "You" once the user has accepted the review. Then a sub-tab per channel, and in it **every piece folded on its own** (each `###` under the draft's `## Pieces`), its route pill in the fold's summary. Open, a piece shows its **preview** first (see below), then its copy fields with their counts, then its own review items. The full list of recommendations, with the switch to group it by step, by channel or by piece, and the decisions log are folded at the bottom of the tab. **Landing pages:** one per offer, two at most; each opens with an "Open the mock-up" link to its laid-out HTML mock-up (the mock-up step of the landing page workflow): as an Artifact, publish the mock-up with the page as a supporting file at `mockups/<draft file name>` and link to that relative path; as a file, link to the mock-up in `drafts/`. With two, a table of the pages, then one section per page (numbered badge, name, URL, the campaign it belongs to, builder and sign-off, state); pieces for different pages never share a fold. A piece built outside the engine shows its link (see "Built elsewhere") |
| **Workflow** | `/campaign-channels`, `/campaign-draft` | What has to be done to run it. A sub-tab per channel: the tools as pills; the steps, each with a pill for who does it and a "Prompt" copy pill beside it; the steps Claude made a call on in fast or balanced mode marked with an "assumed" pill; then **Launch tasks** (from the draft) and "Plan and notes", each folded |
| **Results** | `/campaigns close` | KPI against target, what worked, what did not, the lesson. On a main campaign, its sub-campaigns' KPIs rolled up against its goal tree |
| **Linked** | Every command, when the campaign has a main campaign, sub-campaigns or links | One card per linked campaign, grouped as Main campaign, Sub-campaigns, Alongside: name with its scale badge, the relation in plain words, stage bar, KPI against target, dates, link to its page. Left out when the campaign stands alone |

**Pages built before 0.12.0** have the tabs Brief, Channels, Review and Results. The next command that updates such a page rebuilds it on these tabs from the campaign's files, and says so in one line. Nothing is lost: the files are the source.

**Previews.** A piece in the Content tab opens as it will look to the person who sees it, so the reviewer judges the piece, not a list of fields. Use the preview blocks in the template: an **email** as an inbox card (from name, subject, pre-header, then the body with its button); an **ad** as a feed card (the image as a labelled box with its image text, the primary text, the headline, the CTA button); a **social post** as a post card (the poster's name and role, the text with its line breaks, the visual as a labelled box); a **landing page** as the link to its mock-up; anything else (a talk track, a battlecard, a sequence map) as plain text. Images are never generated: a box says what goes there. The counts (characters, words) sit under the preview, not in it.

**Built elsewhere.** A piece the user made outside the engine (a page in their CMS, ads in Figma or Canva, an email in their email tool) is linked, not copied: when the user says "link <piece> <URL or file>", record it in the draft's frontmatter as `external: [{ piece: "<id>", link: "<URL or path>", added: "<date>" }]` and show it on that piece as "Built elsewhere: <link>". `/campaign-review` reviews it when it can open it (a public page, an image or a file in this folder) and otherwise says in the piece's review items that it could not.

**Header, three lines under the title and nothing else:** the campaign name with the **scale badge next to it, always** (`small-c` in teal, `big-C` in red); one line with the KPI, the dates and, when linked, "Part of: <main>" ("70 sales by 10 Nov · 12 so far · Part of: CXL leader"); the stage bar (seven stages: brief, approved, channels set, drafted, reviewed, running, closed) with its label. No other badges, counts, notes or to-dos: a to-do goes in one line at the top of its tab.

**Linked campaigns** (`frameworks/linked-campaigns.md`): the header line carries "Part of: <main>" only. Sub-campaigns and campaigns alongside are in the Linked tab, each name linking to its page. A main campaign's page carries every sub-campaign's card in its Linked tab, so one link reaches the whole family. When a command updates a sub-campaign's page, it also refreshes that card on the main campaign's page and on each alongside campaign's page, without asking.

**Pills** are capped at about 14 characters wide; longer text is cut with an ellipsis and shown in full in the `title` tooltip. One pill per workflow step, for who does it. Notes never go in a pill.

**Starter prompts** never show as text on the page. Each sits behind a copy pill (`<button class="cp">` with the copy icon, the prompt in `data-prompt` and again in a `.tip` span): the prompt shows in a tooltip on hover or keyboard focus, and a click copies it. Steps get a "Prompt" pill next to the who pill; recommendations get "Copy starter prompt" (class `cp left`, so the tooltip opens to the right). A step's prompt is built from its row, in this shape:

- Claude or tool step: "Run step 5 of the Email workflow in projects/campaigns/<slug>/workflows/email-campaign.md: <Step>. Rule: <Rule>. Done when: <Check before moving on>. Show me the result before the next step."
- Human step: "Help me with step 12 of ...: <Step>. Rule: <Rule>. Done when: <Check>. I make the call, so give me options, not a decision."

Strip markdown from the cells. A recommendation's prompt is the Prompt column of the review, unchanged.

**Sub-tab IDs** are unique across the page: `ct-<channel>` in Content, `wf-<channel>` in Workflow (`ct-email-campaign`, `wf-email-campaign`). Each tab's sub-tabs switch only inside that tab.

**Reading a workflow file:** only the rows of its `## Steps` table are steps. Never read the "Changes from the version it was based on" table as steps. Print each step's number from its `#` cell (`<span class="n">`), never from a CSS counter or list position: counters do not reset inside hidden tabs, so later channels would start at 6 or 10.

## A share-safe copy

For a demo, a manager outside the team, or an organisation that blocks shared Artifacts. `/campaigns page <slug> share-safe` builds a second page, `page-share-safe.html` in the campaign's folder, that anyone can open in a browser or print to PDF:

- **Names are replaced on every build, from one local list:** `raw/campaigns/share-safe/<slug>.md`, one line per name, `Real name -> Stand-in` (`Northwind Health -> a regional hospital group`). The list stays in `raw/`, which never goes to git, so the real names never reach a committed file. The engine offers names to add (companies, people, products, places it finds in the files) and the user approves the list.
- **It is rebuilt from the files each time,** with the list applied, so a rebuild never undoes the anonymising.
- No starter prompts, no rep-only flags, no "For the team only" sections, and no links to files the reader cannot open.
- Run `page-check.sh` on it, then search it for every real name on the list; any hit is fixed before it is shared.

## Rules

- **Base template and budgets:** follow the `keep-it-compact` skill on every update, and run `bash "${CLAUDE_PLUGIN_ROOT}/plugin/page-check.sh" <page>` before publishing. Fix every FLAG or ask about it.

- No personal data on the page: no lead names or email addresses, ever. Companies and segments only.
- Social proof follows the `campaign-engine` skill: private outputs are never shown or quoted, only mentioned as unnamed anecdotes.
- Never put the rep-only flags (missing data, assumptions, verify before sending) in a tab that might reach a prospect. They go in the Content tab's review items and the folded recommendations, under a heading "For the team only".
- Example and practice campaigns can have a page; title it "Practice: <name>".
- The visual style is CXL's web system (Work Sans 900 headings, Lato body, teal, red, beige, black, white). Do not restyle.
- No em dashes.
