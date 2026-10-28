---
description: Add the Campaign Engine to your personal OS. Adds raw/campaigns, projects/campaigns with an empty campaigns board, your copy of the quality gate, the eight starter channel workflows, the frameworks, the project file, and a Campaign Engine section in CLAUDE.md. Never overwrites your files. Then coaches you through brief, channels, drafts and review, on the Acme example, one made up on the spot, or your own campaign. Run it again any time: it picks up where you left off.
---

# /campaign-engine:setup

Add the Campaign Engine module to the folder this session is in, then coach the user through a campaign, step by step. This command is the module's home base: the first run sets it up, and every later run picks up at the next unfinished step. The user is a marketer, not an engineer: say what happened and what to do next in plain words, never as a list of paths.

1. **Check the folder.** Any folder works; never stop here. A personal OS (`.claude/personal-os.json` from the plugin, or `.claude/hooks/auto-shutdown.sh` in a folder cloned from a starter repo) and a brand brain are recommended, not required. Never suggest `/personal-os:setup` in a folder with its own hooks: it would add a second set of hooks and two daily logs a day. Brand docs can live in this folder (`wiki/brand/`), in another installed plugin (a company plugin such as `cxl-plugin` ships `brand/`), or in another folder: the setup script finds them, so do not look for them yourself. If `projects/campaign-engine/` already exists, say that existing files are kept, then continue.
   **One folder for every module.** Recommend the folder set up with `/personal-os:setup`, where the Marketing Brain and the Reporting agent live too: the engine then reads the brand brain from `wiki/brand/` with no extra step. If this folder holds no personal OS but a sibling folder does (`.claude/personal-os.json` one level up or next to it), say so in one line and ask whether they meant to open that one.
   **Their own folders.** If `.claude/folders.json` exists, the module uses it: run `bash "${CLAUDE_PLUGIN_ROOT}/.claude/hooks/folder-map.sh" show` and say in one line where the module's folders will land. If there is no map and the folder holds folders of the user's own, offer one before the script runs, for this module's slots (`campaign-inputs` for `raw/campaigns/`, `campaigns` for `projects/campaigns/`, `voc`, `brand-inputs`, `strategy`, `performance`) and the parent slots they sit in (`raw`, `wiki`, `projects`). Same steps as "Your own folders" in `/personal-os:setup`: match by purpose, show the table, ask (reroute or standard layout), and on reroute write only the slots that differ to `.claude/folders.json` with the shell (`mkdir -p .claude` first; keep any keys already there). A module slot that is not mapped follows its parent: with `raw` mapped to `Inbox`, `voc` is `Inbox/voc/`.
   **Work in other folders.** Members sometimes clone or download the starter repos into folders of their own and work there before installing the plugin. Look next to this folder and in the home folder for `cxl-campaign-engine`, `cxl-marketing-brain` or `cxl-personal-os` (with or without `-main`). If one holds the user's own work (campaign folders other than `example-*`, files in `raw/campaigns/`, a filled `wiki/brand/`), say so in one line and ask: "1 Copy it into this folder · 2 Leave it there". Copy after the script runs, at the mapped names, never overwriting a file and never deleting the old folder.
2. **Run the setup script** with the shell:
   `bash "${CLAUDE_PLUGIN_ROOT}/plugin/setup.sh" "<this folder's absolute path>"`
   It adds the `.gitignore` block for campaign data before anything lands in `raw/campaigns/`, mirrors those rules onto any renamed folders, copies the module files into the mapped folders without overwriting, puts the user's own copy of the default quality gate in `projects/campaign-engine/`, starts the campaigns board in `projects/campaigns/campaigns.md`, appends the Campaign Engine section to `CLAUDE.md` once, and reports the brand docs and daily logs it found. If bash is not available (Windows without Git Bash), point to `winget install Git.Git` and stop. If the script fails, show its output and stop.
3. **Later runs:** if `projects/campaigns/campaigns.md` (at its mapped name) already existed when you checked the folder in step 1, before the script ran, the module was already set up. Say "Your Campaign Engine is set up" in one line, skip steps 4 and 5, and go to the coach.
   **First run: say what is set up, in three lines at most.** Summarise the script output; do not paste it.
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
   > | 4 | `/campaign-engine:campaign-draft <campaign>` | Claude drafts every channel, pausing where a step is yours, then scores each draft: ship, review or fix. You decide. |
   > | 5 | `/campaign-engine:campaign-review <campaign>` | Only after you edit a draft by hand: scores it again. |
   >
   > Any time: `/campaign-engine:campaigns` shows every campaign on one board.
   >
   > **What it asks of you.** Each step reads what it can find first (your brand docs, daily logs, files in `raw/campaigns/`, connected tools), then asks only for what is missing: at most three numbered questions at a time. Before your first brief, have these ready or drop them in `raw/campaigns/`: the one number and its date, last campaign's results, proof you can use, the budget, and who buyers compare you with. "Don't know" is a fine answer. Claude never contacts your team: the brief says who signs off what (sales agrees the lead definition in writing), and you take it to them.

   Then go to the coach, step A. If nobody can answer (a non-interactive run), stop here.

## The coach

### How to coach

1. **One step per message, then stop and wait.**
2. **Every step uses the same four blocks:** **What this step does** (one or two sentences), **What you do** (numbered; say "I'll do X, you do Y" when you do part), **What you should see** (the result that means it worked), **Tell me when** (the phrase to reply with).
3. **Run each command here, on a yes.** Follow the command's own file from its first step, with the campaign's argument: `${CLAUDE_PLUGIN_ROOT}/.claude/commands/campaign-brief.md`, `campaign-channels.md`, `campaign-draft.md`, `campaign-review.md`, `campaigns.md`. Its questions, gates and outputs are its own; the coach adds only the input card before and the checkpoint after. When the command finishes, come back here at the checkpoint, instead of only naming the next command.
4. **Long sessions.** A brief and a full draft run each read a lot. After one of them, offer to carry on here or to start a new chat in this folder and type `/campaign-engine:setup`, which picks up at the next step. Recommend the new chat after the brief.
5. **"Don't know" and "skip" are fine answers.** Missing inputs become (inferred) lines, and Gate 1 says which ones matter.
6. Plain words, short messages, no em dashes.

### Where they are

Read `projects/campaigns/campaigns.md` and each campaign folder in `projects/campaigns/` (at their mapped names). For each campaign, the furthest step reached:

| Step | Done when |
|---|---|
| Brief | `brief.md` has `status: approved` (the Acme example stops at "ready to approve", which counts) |
| Channels | `workflows/` holds at least one channel file |
| Drafts and review | `drafts/` holds a draft per channel and `review.md` exists |
| Live | `brief.md` has `status: running` or `closed` |

No campaign yet: go to step A. One or more: show one table (campaign · practice or own · step reached · next) and ask which to carry on with, or whether to start a new one (step A). Tick "Run the Acme example end to end" in the project file's "Open tasks" once an `example-*` campaign has a review.

### Step A: choose a campaign (once per campaign)

Ask one question: **"Where do you want to start: the Acme practice run, a campaign you make up now, or your own campaign?"**
- **Acme practice run:** fastest way to see every file. Recommend it if this is their first time.
- **Make one up:** ask for the idea in one sentence (a company, what it sells, what the campaign is for), for example "A project management app for small agencies that wants 40 trial signups in March". It stays a practice campaign, separate from real ones, and can go through every step.
- **Own campaign:** pick one they know best: current work, a past campaign, or one from a former employer. Ask for its name in a few words.
- **Later:** stop, and say that typing `/campaign-engine:setup` again picks up here.

### Step B: the brief (Gate 1)

**Input card** (make one up and own campaign; skip for Acme). Check what is already in `raw/campaigns/` and the brand brain, and show what is there and what is missing:
- The goal: the one number this campaign is accountable for, and its date.
- Last campaign's results: leads, meetings, cost and conversion per channel, and what sales said about the leads.
- Proof they are allowed to publish: numbers, customers, quotes.
- The budget: a total, and what goes to paid channels.
- Who buyers compare them with: a named competitor, doing it themselves, or doing nothing.
- Optional: past briefs and plans, and a calendar of launches, events and blackout dates.
Files go in `raw/campaigns/`, or paste them in the chat. A made-up campaign: Claude suggests plausible answers for anything they don't know.

**What reviewers looked for** in the first cohort's briefs. Say these before the run, so the answers aim at them. The first three were missing from almost every brief, and they matter most, because every draft is written from the brief's at-a-glance section:
- **The offer says why to act now:** what the buyer gets, why it is worth their time, and why now rather than any other time.
- **The offer beats the alternatives:** the brief names them and says why to pick this over each.
- **Every segment has an angle that sells the offer**, not one that describes how the product works.
- **The target is grounded:** a past send, page or campaign shows this offer, discount or window can reach it.
- **Kill and scale rules fire early:** on a number that moves before the goal (page visits, clicks, replies), with a threshold and a check date. Scale when ahead of pace (half the goal by the halfway point), not when the goal is hit.
- **The goal is worked back** to weekly volume per channel, and the cadence and budget can deliver it.
- **Paid channels** have their own spend, return target, and room for the platform's learning phase.

Say two things the brief will ask: whether this campaign links to another (a bigger campaign, sub-campaigns, or one reaching the same people in the same weeks), and whether they want a decision model as a second check. **Recommend "No" to the decision model for now:** both need a paid key, and `/campaign-engine:quality-gate` adds one later. Then: **"Ready to write the brief?"** On a yes, run the brief command (`example`, `practice <idea>`, or the campaign's name).

**What you should see:** `projects/campaigns/<campaign>/brief.md`, classified small-c or big-C, then the Gate 1 table and a question: approve, change, or leave it for later.

**Checkpoint:**
- Could a colleague coming in cold run this campaign from the brief alone? No raw answers to Claude's questions left in it, no internal labels.
- Are the (inferred) lines that Gate 1 marks as important answered or accepted?
- **Before approving a live campaign:** sales agrees the lead definition and the handoff rule in writing. Claude never contacts the team: the brief names who signs off what, and the user takes it to them.

**Tell me when:** "brief approved" (or "ready to approve" on Acme).

### Step C: channels

**Input card:** which channels the campaign needs, and which tools each runs on (their email platform, ad accounts, CMS). Every call to action needs somewhere to land, so most campaigns need a landing page: one per offer, two at most. A channel not on the list: they can ask for it ("Add webinars to the list and use it for this campaign").

Then: **"Ready to pick your channels?"** On a yes, run the channels command with the campaign's name.

**What you should see:** one workflow per channel in the campaign's `workflows/` folder, with a table of every change they made and why.

**Checkpoint:** if they changed steps they will want again, save the campaign's version as their default (the command offers it). The starter workflows never change, so they can always go back.

**Tell me when:** "channels done".

### Step D: drafts and Gate 2

**Input card:** the drafts pause at every step a person owns (an approval, an asset, a number only they know). Have those to hand, or say "skip" and the step is marked open.

Then: **"Ready to draft every channel?"** On a yes, run the drafts command with the campaign's name. The review (Gate 2) runs by itself at the end.

**What you should see:** one draft per channel in `drafts/`, then one line per channel in the chat with its score and route: SHIP, REVIEW or FIX, and the full review in `review.md`.

**Checkpoint.** What reviewers looked for in the first cohort's drafts:
- **The offer leads:** in the subject line or the first line, not only in the pre-header, which most people never see.
- **One specific call to action** per piece ("Book your 30-minute check"), not a vague one.
- **Every value claim has proof** that the brief lists as approved.
Then the recommendations, one at a time: "1 Use the fix · 2 Write my own · 3 Leave it as is". Fixes go to a new version of the draft, never the original. Edited a draft by hand later? `/campaign-engine:campaign-review <campaign>` scores it again.

**Tell me when:** "review done".

### Step E: launch, track, and what's next

1. **Launch (real campaigns only):** loading the drafts into their tools is their step. Then mark it live with `/campaign-engine:campaigns running <campaign>`. `refresh` pulls results from connected tools and warns when a kill rule trips; `close` records the result and the one learning the next brief starts from.
2. **Done for the workshop:** one brief through Gate 1, in any mode (approved, or ready to approve on Acme). Channels, drafts and review are a bonus. Say so plainly.
3. **Next module:** if `/reporting-agent:setup` is available in this session, offer to start it now (in a new chat after a long session). If it isn't, say the Reporting agent plugin is the next one to add, at https://github.com/conversionxl/cxl-reporting-agent (Customize › Plugins › + Add › Add from a repository; after Sync, click **Add**).
4. **Their brand brain is still a template** (the setup output said so): mention once that `/marketing-brain:setup` builds it, and the next brief will read it.

If the user has done all of this already, say so in one line, show the table from "Where they are", and offer step A for a new campaign.
