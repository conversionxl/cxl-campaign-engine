---
description: Add the Campaign Engine to your personal OS. Adds raw/campaigns, projects/campaigns with an empty campaigns board, your copy of the quality gate, the seven starter channel workflows, the frameworks, the project file, and a Campaign Engine section in CLAUDE.md. Never overwrites your files.
---

# /campaign-engine:setup

Add the Campaign Engine module to the personal OS in this folder.

1. **Check the folder.** Any folder works. A personal OS (a `CLAUDE.md` with `.claude/personal-os.json`) is recommended, not required: without one, the setup script starts a minimal `CLAUDE.md`, and everything in the Campaign Engine still works. A brand brain in `wiki/brand/` (from the marketing-brain plugin) is also recommended, not required. Say in one line what each would add and continue; never stop for either. If `projects/campaign-engine/` already exists, say that existing files are kept, then continue.
2. **Run the setup script** with the shell and show its output:
   `bash "${CLAUDE_PLUGIN_ROOT}/plugin/setup.sh" "<this folder's absolute path>"`
   It adds the `.gitignore` block for campaign data before anything lands in `raw/campaigns/`, copies the module files without overwriting, puts the user's own copy of the default quality gate in `projects/campaign-engine/`, starts the campaigns board in `projects/campaigns/campaigns.md`, and appends the Campaign Engine section to `CLAUDE.md` once. If bash is not available (Windows without Git Bash), point to `winget install Git.Git` and stop.
3. **Explain the next step** in four lines: fill `raw/campaigns/` using the checklist in `projects/campaign-engine/campaign-engine.md`; `raw/campaigns/` stays on this machine (gitignored); every command takes `example` to try it on Acme Deals first, starting with `/campaign-engine:campaign-brief example`; `/campaign-engine:campaign-channels` walks each channel's steps in the chat so they make it theirs, and `/campaign-engine:campaigns` shows every campaign on one board.
4. If the folder is a git repo, show `git status --short` and ask whether to commit ("Add the Campaign Engine module"). Wait for the answer and commit only on a yes. If nobody can answer (a non-interactive run), do not commit.
