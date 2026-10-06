# CXL Campaign Engine

The [CXL Personal OS](https://github.com/conversionxl/cxl-personal-os) with the Campaign Engine module built in. Built for the CXL AI Native Marketer cohort, with Tyler Durman.

**Brief in, reviewed campaign out.** You write or adjust a campaign brief with Claude and approve it. You pick the channels, and Claude walks you through each one's step-by-step workflow, built from CXL courses, so you can adjust it to your campaign and your tools. Claude then drafts every channel by following your version, pausing wherever a person decides. A weighted quality gate scores every draft against the brief and your criteria, and you accept or fix what it flags. Two human gates, nothing in between ships on vibes. Run as many campaigns as you like: each lives in its own folder, and one board tracks them all.

It stacks with the [Marketing Brain](https://github.com/conversionxl/cxl-marketing-brain): if you built a brand brain in `wiki/brand/`, the engine reads it. If not, the brief collects the minimum itself. Neither module needs the other.

**Three ways in:**
- **Using Claude?** Install the module as a plugin: see [Plugin route](#plugin-route) below. No code editor, no terminal. It works on its own, and best alongside the personal-os and marketing-brain plugins.
- **Starting fresh, or want a clean copy?** Follow [Set up](#set-up-10-minutes) below.
- **Already set up the personal OS repo and want to keep your logs and projects?** Skip to [Add the module to your existing repo](#add-the-module-to-your-existing-repo).

## Plugin route

Works in any folder. For daily logs, memory and the personal OS commands, also set up the **personal-os** plugin with `/personal-os:setup` (see [its README](https://github.com/conversionxl/cxl-personal-os-plugins)). For a brand brain, the **marketing-brain** plugin (`/marketing-brain:setup`). Both are recommended, not required.

1. In Claude, open **Customize**, then **Browse plugins**, **Personal**, **+**, **Add marketplace from GitHub**. Enter `https://github.com/conversionxl/cxl-campaign-engine` with **Sync automatically** on, then add **campaign-engine**. This is its own marketplace, separate from the ones you added for personal-os and marketing-brain.
   (Terminal or VS Code instead: `/plugin marketplace add conversionxl/cxl-campaign-engine`, then `/plugin install campaign-engine@cxl-campaign-engine`.)
2. Open your personal OS folder (or any folder for this project) in Cowork, or in the desktop app's Code tab with Environment: Local, and type `/campaign-engine:setup`.

Setup adds `raw/campaigns/`, `projects/campaigns/` with an empty campaigns board, your own copy of the default quality gate in `projects/campaign-engine/`, the seven starter channel workflows, the frameworks, the project file, and a Campaign Engine section in your `CLAUDE.md`. It never overwrites a file, and it adds the `.gitignore` rule that keeps your campaign data local before anything lands in `raw/campaigns/`. The commands are then `/campaign-engine:campaign-brief`, `campaign-channels`, `campaign-draft`, `campaign-review`, `quality-gate` and `campaigns`, and the skills load by themselves.

## Set up (10 minutes)

**1. Make your own private copy.** Your logs, projects and campaigns are private, so do not work in a public fork. (No GitHub? Click **Code → Download ZIP** and unzip it. Everything works on one machine; see [Without GitHub](#without-github).)
- Click **Use this template → Create a new repository**, choose **Private**, and create it.
- Clone your new repo and open the folder:
  ```bash
  git clone https://github.com/<you>/<your-repo>.git
  cd <your-repo>
  ```

**2. Install the prerequisites.**

| Tool | Why | macOS | Windows |
|---|---|---|---|
| [Claude Code](https://docs.claude.com/en/docs/claude-code/overview) | Runs everything | `curl -fsSL https://claude.ai/install.sh \| bash` | See the install docs |
| `jq` | Every hook needs it | `brew install jq` | `winget install jqlang.jq` |
| `gh` (optional) | Pushing to GitHub from `/shutdown` | `brew install gh` | `winget install GitHub.cli` |

Without `jq` the daily logs are not written automatically. A health-check hook warns you at session start if it is missing, and `/start` walks you through the fix.

**Windows:** install Git for Windows (`winget install Git.Git`) and `jq`, then fully quit and reopen VS Code so the new PATH is picked up. If you cannot install software on your laptop, the repo still works: run `/shutdown` at the end of each session and it writes the daily log without hooks.

**3. Start Claude Code in the folder and run `/start`.**
```bash
claude
```
```
/start
```
**Using Cowork instead?** Point Cowork at the folder and ask: *"Run the start command from `.claude/commands/start.md`"*. Cowork does not show repo commands as `/` commands, so run each one by asking for it this way.

`/start` checks your setup, links memory, explains the system, fills in the "About me" section of `CLAUDE.md`, and creates your first project files.

**4. (Optional) Open the folder as an Obsidian vault** to browse your notes, follow `[[wikilinks]]`, and see the backlinks graph.

## Add the module to your existing repo

Already running your own copy of the personal OS or the Marketing Brain? Open it in Claude Code and paste this prompt. It copies the module in and merges your `CLAUDE.md` rather than overwriting it. Your logs, projects, memory and brand brain are not touched.

```
Add the CXL Campaign Engine module to this repo from
https://github.com/conversionxl/cxl-campaign-engine. Show me the plan before changing anything.

1. Run: git remote add campaign-engine https://github.com/conversionxl/cxl-campaign-engine
   then: git fetch campaign-engine
   (No git? Download the ZIP from that page, unzip it next to this repo, and copy from there.)
2. Append the "Campaign Engine" block from the end of its .gitignore to mine, below my *.csv rule,
   BEFORE copying anything into raw/campaigns/. Skip the raw/voc, raw/strategy and raw/performance
   lines if I already have them.
3. Copy these paths from campaign-engine/main, skipping any file I already have:
   .claude/commands/campaign-brief.md, .claude/commands/campaign-channels.md, .claude/commands/campaigns.md,
   .claude/commands/campaign-draft.md, .claude/commands/campaign-review.md,
   .claude/commands/quality-gate.md, .claude/skills/campaign-engine/, .claude/skills/quality-gate/,
   raw/campaigns/, projects/campaigns/, projects/campaign-engine/,
   frameworks/campaign-brief-template.md, frameworks/workflow-format.md, frameworks/workflows/,
   frameworks/quality-gate.md, frameworks/campaign-inputs.md, frameworks/decision-models.md,
   frameworks/campaigns-board.md
4. Copy frameworks/quality-gate.md to projects/campaign-engine/quality-gate.md (my copy to edit) and
   create projects/campaign-engine/workflows/ (empty: my channel defaults are saved there later),
   skipping anything I already have.
5. Merge into my CLAUDE.md, never overwriting my own text: its "Campaign Engine" section,
   its three new rows in the folder table, and its five new rows in the commands table.
6. In my .claude/commands/ingest.md, make step 1 skip raw/campaigns/, as the module's version does.
7. Show me git status, then remove the campaign-engine remote.
```

## Updating

New versions don't install themselves on a personal marketplace. To update: **Plugins → Add → Manage marketplaces → ⋮** next to the marketplace → **Check for updates**. Your folder, logs, campaigns and workflows are untouched. (Automatic sync needs the Claude GitHub App to have access to the repo; that is not set up.)

## The Campaign Engine

| | Step | Run | You bring | It writes |
|---|---|---|---|---|
| 1 | Brief, Gate 1 | `/campaign-brief` | Past briefs, results and sales feedback in `raw/campaigns/`; your answers to six questions; a brand brain if you have one | `projects/campaigns/<slug>/brief.md`, approved by you |
| 2 | Channels | `/campaign-channels <slug>` | Which channels, then keep, change or cut each step for your campaign and tools; any other channel, your steps or a suggestion | `projects/campaigns/<slug>/workflows/<channel>.md`, and your default if you say so |
| 3 | Drafts | `/campaign-draft <slug>` | Your decisions at every human pause | `projects/campaigns/<slug>/drafts/<channel>.md` |
| 4 | Review, Gate 2 | `/campaign-review <slug>` | Your accept, fix or overrule per flag | `projects/campaigns/<slug>/review.md` |
| + | Tune the gate | `/quality-gate` | Your channels, your last miss, your sign-off rules | `projects/campaign-engine/quality-gate.md` |
| + | Track them all | `/campaigns` | Results from connected tools, or the number; the lesson when one closes | `projects/campaigns/campaigns.md` and a board page |

**Before the workshop**, fill the inputs. The checklist is in `projects/campaign-engine/campaign-engine.md`, and `raw/campaigns/README.md` says what goes in.

- `raw/campaigns/` holds your campaign history and **stays on your machine**: it is gitignored. Client briefs under NDA are fine there.
- `projects/campaigns/` holds briefs, drafts and reviews and **is committed**: decisions and copy, never customer lists or personal data.

**No campaign data?** Every command takes `example`: `/campaign-brief example` runs on Acme Deals, a fictional lifetime-deal marketplace with two past briefs, last quarter's results, a CRM snapshot, sales feedback and a filled brand brain. Example runs write to `projects/campaigns/example-*/`, so your own campaigns stay clean.

**The rules that run through all of it:** the brief holds decisions and no copy; every line traces to a source or is tagged **(inferred)**; every claim in a draft traces to proof or is cut; every CTA moves the buyer to the goal, not to the asset; your workflow beats the default; and a human approves at both gates.

## The quality gate

`frameworks/quality-gate.md` is a sheet: 14 pass-or-fail checks for the brief, then 16 criteria × 7 channels × a weight of 0 to 3 for the drafts, with SHIP, REVIEW and FIX thresholds and two non-negotiables (every CTA moves to the goal; nothing invented). It is built around a real miss: 17 downloads, 0 meetings, because nothing asked for the meeting. The workshop exercise is to make the sheet yours: your channels, your weights, the row your last miss failed on.

Optionally, the gate can be written as a question set for a decision model (TypeSafe's Jev or Cloudflare's Clef) so it runs on every draft in under a second. `frameworks/decision-models.md` explains what those are, what they are not, and how to calibrate one before trusting it.

## Credits

- **Brief structure, sales enablement process, email sequence pattern, campaign lessons:** Tyler Durman, Ignition Growth Consulting, from campaign briefs and plans written 2020 to 2025 and shared for this workshop.
- **Channel workflows and gate criteria:** CXL course instructors Jessica Best (email), Andy Crestodina (B2B content), Kyle Bastien (sales enablement), AJ Wilcox (LinkedIn ads), Michael Aagaard (landing page optimization), Tycho Luijten (B2B demand generation), Mason Cosby (ABM), Louis Grenier (positioning and differentiation). Each step cites its lesson in `frameworks/workflows/`; each gate row in `frameworks/quality-gate.md`.
- **Acme Deals example data and ad scoring:** Nick Christensen, [ship-icp-ads-automate-monitoring](https://github.com/nickyc1/ship-icp-ads-automate-monitoring), MIT license (copy in `raw/voc/example/LICENSE`). The campaign history in `raw/campaigns/example/` is CXL's fictional extension.
- **Decision models:** Eric Siu, Cloudflare, TypeSafe AI, Claire Vo and Lenny Rachitsky; sources in `frameworks/decision-models.md`.
- **Personal OS:** [conversionxl/cxl-personal-os](https://github.com/conversionxl/cxl-personal-os).

## What's inside

```
CLAUDE.md            The operating manual Claude reads every session
projects/            One folder per active project (start from _template.md)
  campaign-engine/   The engine's settings: quality-gate.md, and workflows/ for your channel defaults
  campaigns/         campaigns.md (the board), then one folder per campaign: brief, workflows, drafts, review, results
raw/                 Inbox for unstructured dumps, processed by /ingest
  campaigns/         Your campaign history (stays local) + the Acme Deals example
  voc/, brand/,      Marketing Brain input folders, shared with that module
  strategy/, performance/
daily-logs/          One log per day, written automatically
frameworks/          The reference: brief template, workflow format, seven starter workflows,
                     the default gate, campaign inputs, campaigns board, decision models
wiki/                Durable reference: people, tools, concepts
  brand/             The brand brain, if you built one (read, never written)
drafts/              Content in progress that is not a campaign draft
team-updates/        Weekly standup updates built from your logs
.claude/
  commands/          /start, /brief, /ingest, /shutdown, /lint, /team-update,
                     /campaign-brief, /campaign-channels, /campaign-draft, /campaign-review,
                     /quality-gate, /campaigns
  skills/            Know-how Claude applies automatically (my-voice, campaign-engine, quality-gate)
  agents/            Specialists Claude hands whole jobs to (example: researcher)
  hooks/             Scripts that run on session start, compaction, and end
  memory/            Standing facts, indexed by MEMORY.md
  link-memory.sh     Run once per machine so memory travels with the repo
```

## Commands

| Command | When | What it does |
|---|---|---|
| `/start` | First session, or `/start tour` any time | Setup, tour, and personalization |
| `/brief <subject>` | Before a meeting or context switch | Everything the repo (plus email and calendar, if connected) knows about a person, project, or topic |
| `/ingest` | When `raw/` fills up | Proposes where each raw dump belongs and files it after you confirm |
| `/shutdown` | End of day | Reconciles the day, routes commitments into projects, writes a rich daily log, offers to push |
| `/lint` | Weekly | Health check: contradictions, stale claims, orphans, missing concepts, neglected projects, unsourced claims |
| `/team-update <period>` | When you owe a status update | Standup-format update from your daily logs |
| `/campaign-brief [example] [name]` | Campaign Engine step 1 | The brief, classified and checked at Gate 1, waiting for your approval |
| `/campaign-channels <slug>` | Campaign Engine step 2 | Pick the channels; walk and adjust each one's steps in the chat |
| `/campaign-draft <slug>` | Campaign Engine step 3 | Every channel drafted by your workflow, with you at every pause |
| `/campaign-review <slug>` | Campaign Engine step 4 | The weighted scorecard, the fixes, and Gate 2 |
| `/quality-gate [example]` | In the workshop, and after every miss | Your criteria, your channels, your weights |
| `/campaigns [refresh\|running\|close]` | Any time | Every campaign on one board, with results and lessons |

## What runs automatically

| When | What |
|---|---|
| Session start | Loads your two most recent daily logs. Backfills logs for past days that were missed. Reminds you if `/lint` is overdue. Writes last week's team update if it is missing. |
| Before context compaction | Snapshots the files you changed, your exact prompts, and git state, and restores them afterwards. |
| Session end | Writes today's daily log from the session. Appends if the day already has one; never overwrites. |

## Memory vs daily logs

| | Built-in memory (`.claude/memory/`) | Daily logs (`daily-logs/`) |
|---|---|---|
| Holds | Standing facts: preferences, key people, where things live | What happened: work done, decisions, commitments, next steps |
| Updated | When Claude learns something durable | Automatically at the end of every session |
| Answers | "What is always true?" | "Where did we leave off?" |

Both are plain files in your repo. You can read them, fix them, and take them with you.

## Working across machines

Run `bash .claude/link-memory.sh` once on each machine after cloning, so Claude's memory points at the repo copy instead of a machine-local folder. Push at the end of the day (`/shutdown` offers to), and pull at the start.

## Without GitHub

Fine to start without it. On one machine, every folder, command, and daily log works the same. What you give up:

- **Version history.** No way to see or undo what changed in a brief, a workflow, memory, or `CLAUDE.md`.
- **Sync across machines.** Your laptop and desktop drift apart.
- **Template updates** from CXL as the starter improves.
- **The more complex setups later in the cohort** that build on git: shared team repos, pull-request reviews, automated team updates.

You can add it any time: create an empty private repo on GitHub, then `git init`, `git add -A`, `git commit -m "Start"`, `git remote add origin <url>`, `git push -u origin main`.
