---
description: Add the Campaign Engine to your personal OS. Adds raw/campaigns, projects/campaigns with an empty campaigns board, your copy of the quality gate, the seven starter channel workflows, the frameworks, the project file, and a Campaign Engine section in CLAUDE.md. Never overwrites your files. Ends by starting your first brief: the Acme example, one made up on the spot, or your own.
---

# /campaign-engine:setup

Add the Campaign Engine module to the folder this session is in, then get the user to their first brief. The user is a marketer, not an engineer: say what happened and what to do next in plain words, never as a list of paths.

1. **Check the folder.** Any folder works; never stop here. A personal OS (`.claude/personal-os.json`) and a brand brain are recommended, not required. Brand docs can live in this folder (`wiki/brand/`), in another installed plugin (a company plugin such as `cxl-plugin` ships `brand/`), or in another folder: the setup script finds them, so do not look for them yourself. If `projects/campaign-engine/` already exists, say that existing files are kept, then continue.
   **Their own folders.** If `.claude/folders.json` exists, the module uses it: run `bash "${CLAUDE_PLUGIN_ROOT}/.claude/hooks/folder-map.sh" show` and say in one line where the module's folders will land. If there is no map and the folder holds folders of the user's own, offer one before the script runs, for this module's slots (`campaign-inputs` for `raw/campaigns/`, `campaigns` for `projects/campaigns/`, `voc`, `brand-inputs`, `strategy`, `performance`) and the parent slots they sit in (`raw`, `wiki`, `projects`). Same steps as "Your own folders" in `/personal-os:start`: match by purpose, show the table, ask (reroute or standard layout), and on reroute write only the slots that differ to `.claude/folders.json` with the shell (`mkdir -p .claude` first; keep any keys already there). A module slot that is not mapped follows its parent: with `raw` mapped to `Inbox`, `voc` is `Inbox/voc/`.
2. **Run the setup script** with the shell:
   `bash "${CLAUDE_PLUGIN_ROOT}/plugin/setup.sh" "<this folder's absolute path>"`
   It adds the `.gitignore` block for campaign data before anything lands in `raw/campaigns/`, mirrors those rules onto any renamed folders, copies the module files into the mapped folders without overwriting, puts the user's own copy of the default quality gate in `projects/campaign-engine/`, starts the campaigns board in `projects/campaigns/campaigns.md`, appends the Campaign Engine section to `CLAUDE.md` once, and reports the brand docs and daily logs it found. If bash is not available (Windows without Git Bash), point to `winget install Git.Git` and stop. If the script fails, show its output and stop.
3. **Say what is set up, in three lines at most.** Summarise the script output; do not paste it.
   - **Installed:** "The Campaign Engine is set up. Your campaigns will live in `projects/campaigns/`." Add "Your existing files were kept" when the script kept any.
   - **Brand docs**, from the "Brand docs" table: one source, "It will use your brand docs from <this folder | the <name> plugin | <path>>". More than one, "You have <n> sets of brand docs; your first brief asks once which one these campaigns use". None, "No brand docs yet, so your first brief asks a few questions about your audience and voice. `/marketing-brain:setup` builds them properly". If a file shows `template`, name it.
   - **Private data:** "Anything you put in `raw/campaigns/` stays on this computer."
4. **Commit.** If the folder is a git repo, show `git status --short` and ask whether to commit ("Add the Campaign Engine module"). Wait for the answer and commit only on a yes. If nobody can answer (a non-interactive run), do not commit.
5. **Show the way through and start the first step.** Show this, as is:

   > **How a campaign runs.** Five commands, in order. Each one ends by telling you the next.
   >
   > | | Command | What happens |
   > |---|---|---|
   > | 1 | `/campaign-engine:campaign-brief example` | A practice run on Acme Deals, a made-up company with sample data. You see what a finished brief looks like. Nothing of yours is touched. Or `practice` to make up a campaign of your own on the spot. |
   > | 2 | `/campaign-engine:campaign-brief <your campaign>` | Your first real brief. It asks for what it needs as it goes (past campaigns, results, what customers say): drop files into `raw/campaigns/` or paste them in the chat. You approve it before anything gets written. |
   > | 3 | `/campaign-engine:campaign-channels <campaign>` | Pick the channels (email, landing page, ads, and so on) and adjust each one's steps to how you work. |
   > | 4 | `/campaign-engine:campaign-draft <campaign>` | Claude drafts every channel, pausing where a step is yours. |
   > | 5 | `/campaign-engine:campaign-review <campaign>` | Each draft is scored: ship, review or fix. You decide. |
   >
   > Any time: `/campaign-engine:campaigns` shows every campaign on one board.
   >
   > **What it asks of you.** Each step reads what it can find first (your brand docs, daily logs, files in `raw/campaigns/`, connected tools), then asks only for what is missing: at most three numbered questions at a time. Before your first brief, have these ready or drop them in `raw/campaigns/`: the one number and its date, last campaign's results, proof you can use, the budget, and who buyers compare you with. "Don't know" is a fine answer. Claude never contacts your team: the brief says who signs off what (sales agrees the lead definition in writing), and you take it to them.

   Then ask one question: **"Where do you want to start: the Acme practice run, a campaign you make up now, or your own campaign?"**
   - **Acme practice run:** run `/campaign-engine:campaign-brief example` now, in this session.
   - **Make one up:** ask for the idea in a sentence (a company, what it sells, what the campaign is for), then run `/campaign-engine:campaign-brief practice <idea>` now. It stays a practice campaign, separate from real ones, and can go through every step.
   - **Own campaign:** ask for the campaign's name in a few words, then run `/campaign-engine:campaign-brief <name>` now.
   - **Later:** stop, and say that `/campaign-engine:campaign-brief example` is the place to start.
