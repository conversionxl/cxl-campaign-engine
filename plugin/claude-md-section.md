

---

## Campaign Engine

<!-- Added by /campaign-engine:setup. Edit freely. -->

**Brief in, reviewed campaign out.** A campaign is a folder in `projects/campaigns/<slug>/`: a brief that holds decisions and no copy, the workflow it runs for each channel, one draft per channel, and a review. Run as many as you like; `projects/campaigns/campaigns.md` is the board that tracks them all. Two human gates: you approve the brief (Gate 1) and you accept or fix what the review flags (Gate 2). Nothing ships on vibes.

| Folder | What goes in it |
|---|---|
| `raw/campaigns/` | Your campaign history: past briefs, results, sales feedback on leads, CRM and email pulls (`live/`), the marketing calendar. Gitignored except the README and the Acme Deals example. Files dropped loose in the top of `raw/` are moved here by the next command you run, or by `/personal-os:ingest`. |
| `projects/campaign-engine/` | The engine's settings: `quality-gate.md` (criteria × channel × weight, yours to tune) and `workflows/` (your default version of each channel, saved from a campaign when you say so). |
| `projects/campaigns/` | `campaigns.md`, the board, plus one folder per campaign: `brief.md`, `workflows/`, `drafts/`, `review.md`, `results.md`. Committed. |
| `wiki/brand/` | The brand brain from the Marketing Brain workshop, if you have it. The engine reads it and never writes to it. Without it, the brief collects the minimum itself and tags those lines (inferred). |

**Every command asks for documents, connections and voice of customer first** (`frameworks/campaign-inputs.md`): drop files into `raw/campaigns/`, paste them into the chat for the command to file, or let it fetch them through a connected tool (a CRM, email or ad platform, GA4, Google Drive, Notion, ClickUp). Pulls are read only and saved as dated snapshots in `raw/campaigns/live/`.

| Step | Command | Reads | Writes |
|---|---|---|---|
| 1. Brief | `/campaign-engine:campaign-brief [example] [name]` | `raw/campaigns/`, the brand brain, connected tools, your answers | `projects/campaigns/<slug>/brief.md`, status `approved` only on your yes (Gate 1) |
| 2. Channels | `/campaign-engine:campaign-channels <slug>` | The approved brief, the starter workflows (or your defaults), your tools | `projects/campaigns/<slug>/workflows/<channel>.md`, adjusted step by step in the chat; optionally saved as your default |
| 3. Drafts | `/campaign-engine:campaign-draft <slug>` | The approved brief, your workflow per channel, the brand brain | `projects/campaigns/<slug>/drafts/<channel>.md`, pausing at every human lane |
| 4. Review | `/campaign-engine:campaign-review <slug>` | The drafts, the brief, your quality gate | `projects/campaigns/<slug>/review.md`: weighted score per draft, SHIP / REVIEW / FIX (Gate 2) |
| Tune | `/campaign-engine:quality-gate [example]` | Your campaigns, channels and past misses | `projects/campaign-engine/quality-gate.md`, optionally a Jev or Clef question set |
| Track | `/campaign-engine:campaigns [refresh\|running\|close]` | Every campaign folder, connected tools for results | `projects/campaigns/campaigns.md` and a board page (Artifact, or an HTML file) |

Each command takes `example` to run on Acme Deals, the fictional brand in `raw/campaigns/example/`. Example runs write to `projects/campaigns/example-*/`, never to your own campaigns, and read the example brand brain in `raw/campaigns/example/brand-brain/`, never `wiki/brand/`.

**Rules for the engine:**
- **The brief holds decisions, drafts hold copy.** Copy in a brief is moved to a draft or cut. That is what makes the brief reviewable in five minutes and gives the gate something to check against.
- **The (inferred) rule.** Every line in a brief traces to a file in `raw/`, the brand brain, a connected tool, or your answer. Anything else is tagged **(inferred)**. Metrics, customers, quotes and case studies are never generated: missing means blank. An angle without proof is marked (no proof) and no draft states it as fact.
- **Every channel is a step-by-step workflow.** Seven starters ship in `frameworks/workflows/` (email campaign, email sequence, blog post, social, sales enablement, landing page, ad tests), each step citing the CXL course or Tyler Durman brief it comes from. `/campaign-channels` walks them in the chat so you keep, change or cut each step for your campaign and tools; any other channel, type your steps or ask for a suggestion. The campaign's version is what `/campaign-draft` follows; save it as your default and the next campaign starts from it.
- **Specs live in the workflow, not the brief.** Character limits, counts and formats are checked by the gate against the workflow.
- **Read only in connected tools.** Loading a draft into an email, ad or CRM tool is your step, after Gate 2.
- **No personal data in campaign folders.** Leads and customers are referred to by company, segment or ID. Email addresses stay in `raw/`.
- **Keep the HR tech example unnamed.** The workshop's missed-campaign lesson refers to "an HR tech SaaS platform". Never name the company.
- **Your own folder names.** If `.claude/folders.json` exists, every folder named in this section (`wiki/brand/`, `raw/voc/`, `projects/` and the rest) is read at its mapped name instead, subfolders included. `/campaign-engine:setup` asks about it.

Credits: the small-c and big-C brief structure, the sales enablement process and the campaign examples come from Tyler Durman's briefs and plans, shared for this workshop. Channel craft and gate criteria credit the CXL course instructors named in `frameworks/quality-gate.md`. Acme Deals is Nick Christensen's (MIT). Decision models: see `frameworks/decision-models.md`.
