# Personal OS

> A personal operating system for working with Claude Code, from the CXL AI Native Marketer cohort, with the Campaign Engine module built in. Claude reads this file at the start of every session. It explains how the repo runs and how to work with its owner.
>
> **New here? Run `/start`.** It walks you through setup and fills in the "About me" section below.

**Writing rule: no em dashes (—), anywhere.** They are a hallmark of AI-generated text. This applies to every file in the repo, daily logs included. Rewrite with whichever punctuation reads best: a full stop for a clean break, a colon for a lead-in, a comma for a brief aside.

---

## About me

<!-- /start fills this in. Edit it any time: this is what Claude knows about you before every session. -->

- **Name:**
- **Role and company:**
- **What I'm responsible for:**
- **How I like to work with Claude:**

---

## How this repo runs

Claude has no memory between sessions by default. This repo fixes that with plain Markdown files, so everything Claude knows about your work is readable, editable, and versioned in git.

**Folders and their jobs:**

| Folder | What goes in it |
|---|---|
| `projects/` | One folder per active project, each with a canonical project file. The primary structure for all work. Start from `projects/_template.md`. |
| `projects/campaign-engine/` | The engine's settings: `quality-gate.md` (criteria × channel × weight, yours to tune) and `workflows/` (your default version of each channel, saved from a campaign when you say so). |
| `projects/campaigns/` | `campaigns.md`, the board, plus one folder per campaign: `brief.md`, `workflows/`, `drafts/`, `review.md`, `results.md`. Committed. |
| `raw/` | Unstructured dumps: meeting notes, voice memo transcripts, pasted emails, half-formed ideas. `/ingest` processes and files them, and moves module inputs into `raw/campaigns/`, `raw/voc/`, `raw/strategy/`, `raw/performance/`, or `raw/brand/`. Files already in those folders stay put. |
| `raw/campaigns/` | Your campaign history: past briefs, results, sales feedback on leads, CRM and email pulls (`live/`), the marketing calendar. Gitignored except the README and the Acme Deals example. |
| `raw/voc/` | Voice of customer: customer exports, reviews, tickets, call notes, survey answers. Gitignored except the README and the Acme Deals example. |
| `raw/brand/` | The brand's own words: URLs, on-brand and off-brand samples, existing guides. Committed, so nothing confidential. |
| `raw/strategy/` | Where the business is going: strategy and pivot docs, internal positioning docs, confidential brand books. Gitignored. |
| `raw/performance/` | Evidence of what works: GA4, lead-gen, conversion, ad, email and social performance. Gitignored. |
| `wiki/brand/` | The brand brain from the Marketing Brain workshop, if you have it: `icp.md`, `positioning-messaging.md`, `voice-guide.md`, `vocabulary.md`. The engine reads it and never writes to it. |
| `daily-logs/` | One file per day, `YYYY-MM-DD-convo.md`, written automatically when a session ends. Claude's working memory across sessions. |
| `frameworks/` | Reusable methods, models, and checklists: how you do things, not what you are doing. The Campaign Engine's reference files live here. |
| `wiki/` | Durable reference: people, tools, concepts, glossary. Facts that stay true for months. |
| `drafts/` | Content in progress. Anything Claude writes for you that is not a campaign draft lands here first. |
| `team-updates/` | Weekly standup-style updates built from your daily logs. |
| `AGENTS.md` | Points other AI tools (Codex, Copilot, Cursor, Gemini CLI, Grok) at this file, and tells them how to run the routines without hooks. |
| `.claude/commands/` | Slash commands: repeatable prompts you trigger by name. |
| `.claude/skills/` | Skills: know-how Claude loads automatically when a task matches. |
| `.claude/agents/` | Agents: specialists Claude hands a whole job to. |
| `.claude/hooks/` | Scripts that run on session events (start, compaction, end). |
| `.claude/memory/` | Standing facts Claude should always know, indexed by `MEMORY.md`. |

**Conventions:**
- **Projects are the starting point.** Before building a command, skill, or agent, ask which project it serves.
- **Project frontmatter:** every project file carries `type`, `status`, `priority`, `cadence`, `next_action`, and `tags`. `/lint` uses `cadence` to decide whether a project has gone quiet.
- **Wikilinks** (`[[project-name]]`) for stable entities only: projects, frameworks, people, recurring concepts. Not generic words. Never link to a note that does not exist.
- **Propose before restructuring.** Anything that moves, merges, overwrites, or deletes notes gets a plan first and waits for confirmation. Append or ask; never silently overwrite.
- **Cite what you ingested.** When a note is built from transcripts, exports, or connector results, say where each claim came from.
- **Never invent** statistics, quotes, sources, or case studies. Say when something is unverified.
- **Write inside `.claude/` with the shell.** Memory, skills and commands live there. In Cowork the file-edit tools cannot write inside `.claude/`, but the shell can once it has started, so use a heredoc. If the shell is not ready, wait and retry. Never save memory anywhere except `.claude/memory/`.
- **Secrets stay out of git.** API keys and tokens live only in `.claude/settings.local.json` or `.env`, both gitignored. No personal email addresses in tracked files either: git history is permanent.

---

## Commands

| Command | When to run it | What it does |
|---|---|---|
| `/start` | Once, after cloning. Again any time you want the tour. | Checks setup, links memory, explains the system, fills in "About me", creates your first projects. |
| `/brief [person\|project\|topic]` | Before a meeting or a context switch. | Pulls together everything the repo (plus email and calendar, if connected) knows about the subject. |
| `/ingest` | When `raw/` has things in it. | Reads every raw dump, proposes where each piece belongs, and files it after you confirm. |
| `/shutdown` | End of the working day. | Reconciles what got done, routes new commitments into project files, writes a rich daily log, offers to push to GitHub. |
| `/lint` | Weekly. A reminder appears at session start when it is overdue. | Health check: contradictions, stale claims, orphan notes, missing concepts, neglected projects, unsourced claims. Reports first, fixes on confirmation. |
| `/team-update [this-week\|last-week\|today]` | When you owe someone a status update. | Turns your daily logs into a short standup update in `team-updates/`. |
| `/campaign-brief [example] [name]` | Campaign Engine step 1. | Writes or adjusts a brief from your history, the brand brain, connected tools and your answers; classifies it; runs Gate 1; stops for your approval. |
| `/campaign-channels <slug>` | Campaign Engine step 2. | Pick the channels; walk each one's steps in the chat and adjust them to your campaign and tools. Optionally save as your default. |
| `/campaign-draft <slug>` | Campaign Engine step 3. | Drafts every channel by following your workflow, pausing at every human lane. |
| `/campaign-review <slug>` | Campaign Engine step 4, Gate 2. | Scores every draft with your weighted gate, routes SHIP / REVIEW / FIX, proposes fixes, waits for you. |
| `/campaigns [refresh\|running <slug>\|close <slug>]` | Any time. | The board: every campaign, its stage, KPI against target, next step. Pulls results from connected tools; renders a page. |
| `/quality-gate [example]` | Whenever a campaign misses, and in the workshop. | Tunes the gate to your campaigns: criteria, channels, weights, thresholds. Optionally writes it as a decision-model question set. |

---

## Campaign Engine

<!-- Added by /campaign-engine:setup. Edit freely. -->

**Brief in, reviewed campaign out.** A campaign is a folder in `projects/campaigns/<slug>/`: a brief that holds decisions and no copy, the workflow it runs for each channel, one draft per channel, and a review. Run as many as you like; `projects/campaigns/campaigns.md` is the board that tracks them all. Two human gates: you approve the brief (Gate 1) and you accept or fix what the review flags (Gate 2). Nothing ships on vibes.

**Every command asks for documents, connections and voice of customer first** (`frameworks/campaign-inputs.md`): drop files into `raw/campaigns/`, paste them into the chat for the command to file, or let it fetch them through a connected tool (a CRM, email or ad platform, GA4, Google Drive, Notion, ClickUp). Pulls are read only and saved as dated snapshots in `raw/campaigns/live/`.

| Step | Command | Reads | Writes |
|---|---|---|---|
| 1. Brief | `/campaign-brief [example] [name]` | `raw/campaigns/`, the brand brain, connected tools, your answers | `projects/campaigns/<slug>/brief.md`, status `approved` only on your yes (Gate 1) |
| 2. Channels | `/campaign-channels <slug>` | The approved brief, the starter workflows (or your defaults), your tools | `projects/campaigns/<slug>/workflows/<channel>.md`, adjusted step by step in the chat; optionally saved as your default |
| 3. Drafts | `/campaign-draft <slug>` | The approved brief, your workflow per channel, the brand brain | `projects/campaigns/<slug>/drafts/<channel>.md`, pausing at every human lane |
| 4. Review | `/campaign-review <slug>` | The drafts, the brief, your quality gate | `projects/campaigns/<slug>/review.md`: weighted score per draft, SHIP / REVIEW / FIX (Gate 2) |
| Tune | `/quality-gate [example]` | Your campaigns, channels and past misses | `projects/campaign-engine/quality-gate.md`, optionally a Jev or Clef question set |
| Track | `/campaigns [refresh\|running\|close]` | Every campaign folder, connected tools for results | `projects/campaigns/campaigns.md` and a board page (Artifact, or an HTML file) |

Each command takes `example` to run on Acme Deals, the fictional brand in `raw/campaigns/example/`. Example runs write to `projects/campaigns/example-*/`, never to your own campaigns, and read the example brand brain in `raw/campaigns/example/brand-brain/`, never `wiki/brand/`.

**Rules for the engine:**
- **The brief holds decisions, drafts hold copy.** Copy in a brief is moved to a draft or cut. Specs (limits, counts, formats) live in the workflow, not the brief.
- **The (inferred) rule.** Every line in a brief traces to a file in `raw/`, the brand brain, a connected tool, or your answer. Anything else is tagged **(inferred)**. Metrics, customers, quotes and case studies are never generated: missing means blank. An angle without proof is marked (no proof) and no draft states it as fact.
- **Every channel is a step-by-step workflow.** Seven starters ship in `frameworks/workflows/` (email campaign, email sequence, blog post, social, sales enablement, landing page, ad tests), each step citing the CXL course or Tyler Durman brief it comes from. `/campaign-channels` walks them in the chat so you keep, change or cut each step for your campaign and tools; any other channel, type your steps or ask for a suggestion. The campaign's version is what `/campaign-draft` follows; save it as your default and the next campaign starts from it.
- **The ask, not the asset.** Every CTA moves the reader to the brief's KPI action. A sequence ends on the ask.
- **Read only in connected tools.** Loading a draft into an email, ad or CRM tool is your step, after Gate 2.
- **No personal data in campaign folders.** Leads and customers are referred to by company, segment or ID. Email addresses stay in `raw/`.
- **The brand brain is read, never written.** Without one, the brief collects the minimum itself. The Marketing Brain plugin builds one; it is recommended, not required.
- **Keep the HR tech example unnamed.** The workshop's missed-campaign lesson refers to "an HR tech SaaS platform". Never name the company.

Credits: the small-c and big-C brief structure, the sales enablement process, the email sequence pattern and the campaign lessons come from Tyler Durman's briefs and plans (2020 to 2025), shared for this workshop. Channel craft and gate criteria credit the CXL course instructors named in `frameworks/quality-gate.md`. Acme Deals is Nick Christensen's (MIT). Decision models: `frameworks/decision-models.md`.

---

## Hooks (what runs automatically)

Configured in `.claude/settings.json`, scripts in `.claude/hooks/`. They need `jq` and the `claude` CLI on your PATH, and they fail silently if either is missing.

| When | Hook | What it does |
|---|---|---|
| Session start | `health.sh` | Checks that `jq` and the `claude` CLI exist and leaves a heartbeat in `.claude/state/`. If something is missing, it tells you at session start instead of the logs quietly stopping. Needs only bash. |
| Session start | `load-recent-logs.sh` | Loads your two most recent daily logs into context, so every session starts where the last one ended. |
| Session start | `catch-up-logs.sh` | Backfills a daily log for any past day that has a session transcript but no log (the editor was closed, the laptop slept). Runs in the background. |
| Session start | `lint-due.sh` | Prints a one-line reminder if `/lint` has not run in 7 days. Silent otherwise. |
| Session start | `team-update.sh` | If last week has daily logs but no team update, writes one to `team-updates/` in the background. |
| Session start | `restore-state.sh` | After a context compaction, re-injects the snapshot taken just before it. |
| Before compaction | `preserve-state.sh` | Snapshots files changed, your verbatim prompts, and git state, so compaction does not blur them. |
| Session end | `auto-shutdown.sh` | Writes today's daily log from the session transcript, using headless Claude (Sonnet). Appends if the day already has a log; never overwrites. |

**Manual fallback (when hooks are not running).** If the session context shows a "hooks degraded" notice, or shows no "Recent daily logs" block while `daily-logs/` has dated logs, the hooks are not running on this machine (most often Windows without Git Bash or `jq`). Then:
- Tell the user once, and point them to `/start` to fix it.
- Read the two newest dated files in `daily-logs/` yourself before starting work.
- Before the session ends, remind the user to run `/shutdown`. It writes the daily log itself and does not depend on hooks.

**Daily logs vs Claude's built-in memory.** Built-in memory (`.claude/memory/`) holds a small set of standing facts: preferences, key people, where things live. Daily logs hold what happened: work done, decisions, commitments, roll-forward. Memory answers "what is always true", logs answer "where did we leave off". Both are plain files in this repo, so you own them, can read them, and can fix them.

---

## Where you run it

| Tool | Commands | Hooks and automatic daily logs |
|---|---|---|
| Claude Code (VS Code extension or terminal) | Type `/start`, `/campaign-brief`, and so on | Yes |
| Cowork (Claude desktop app) | Ask in plain words: "Run the campaign-brief command from `.claude/commands/campaign-brief.md`" | No. Cowork runs hooks in its own workspace, where this folder isn't. Read the newest daily logs at the start of a session, and run `/shutdown` (by asking) at the end of each day |

## GitHub is optional

Without GitHub (a ZIP download, or a folder you never push), everything in this repo still works on one machine. What you give up: version history (no undoing a bad edit to a brief or a workflow), sync across machines, template updates from CXL, and the more complex setups later in the cohort that build on git, such as shared team repos and pull-request reviews. You can add GitHub later: `git init`, create a private repo, and push.

## Memory

Memory lives in the repo at `.claude/memory/`, indexed by `MEMORY.md`. Claude Code looks for memory at `~/.claude/projects/<slugified-repo-path>/memory/`, outside the repo. `bash .claude/link-memory.sh` points that path at the repo copy, so memory travels with the repo across machines. **Run it once on every machine you clone to.** Without it, memory silently stays machine-local.

Index lines in `MEMORY.md` use a colon as the separator: `- [Title](file.md): hook`. Memory records what was true when written; verify a remembered file or tool still exists before acting on it.

---

## How to work with me

- **Be decisive.** Give a recommendation, not a survey of options.
- **Verify before asserting.** Check that a file, command, or connector exists before recommending it.
- **Keep output skimmable.** Short sections, tables over walls of text, no filler.
- **Say plainly what is done and what is not.** Finished and verified: say so. Skipped or unverified: say that too.
