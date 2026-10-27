---
name: campaign-engine
description: How the Campaign Engine's folders, files and gates fit together. Apply automatically on any campaign work in this repo: writing or adjusting a campaign brief, choosing channels or adjusting a channel's steps, drafting a channel (email campaign, email sequence, blog, social, sales enablement, landing page, ads, or one the user added), reviewing drafts, tracking several campaigns, reading campaign results, and whenever a task touches projects/campaigns/, projects/campaign-engine/, or raw/campaigns/.
---

# Campaign engine

Brief in, reviewed campaign out, with a human at both gates. These are the rules every command and every ad hoc campaign task follows.

## The folders

| Path | Holds | Who writes it |
|---|---|---|
| `raw/campaigns/` | Past briefs, results, sales feedback, calendar, `live/` pulls. Local, gitignored | The user, or a command filing what they pasted or fetched |
| `raw/campaigns/example/` | Acme Deals: history, CRM and email pulls, and `brand-brain/`. Committed | The module. Read only |
| `projects/campaigns/campaigns.md` | The board: every campaign, its stage, KPI against target, next command. Source of truth for `/campaigns` | Every command updates its row |
| `projects/campaign-engine/workflows/<channel>.md` | The user's default workflow per channel, saved from a campaign. New campaigns start from it | `/campaign-channels`, on a yes to "save as my default" |
| `projects/campaigns/<slug>/workflows/<channel>.md` | This campaign's workflow per channel. What `/campaign-draft` follows | `/campaign-channels <slug>` |
| `projects/campaign-engine/quality-gate.md` | The user's gate: criteria × channel × weight, thresholds | `/quality-gate`, or the user by hand |
| `projects/campaigns/<slug>/brief.md` | Decisions, no copy. `status` is `approved` only by a human | `/campaign-brief` |
| `projects/campaigns/<slug>/drafts/<channel>.md` | One draft per channel, following that channel's workflow | `/campaign-draft` |
| `projects/campaigns/<slug>/review.md` | The scorecard and the human's decisions | `/campaign-review` |
| `projects/campaigns/<slug>/results.md` | What it returned. The next brief reads it | The user |
| `frameworks/` (in the plugin, `${CLAUDE_PLUGIN_ROOT}/frameworks/`) | The reference: brief template, workflow format, the starter workflows, default gate, question set, inputs, board and page formats, decision models. Read from the plugin; never copied into the user's folder | The module. Never edited by commands |
| `projects/campaigns/<main>/campaigns/<slug>/` | A **sub-campaign**: same files as any campaign, inside its main campaign's folder (`frameworks/linked-campaigns.md`). Everywhere this table or a command says `projects/campaigns/<slug>/`, it means the campaign's own folder, nested or not: find it from the board's link, or the `brief.md` with `campaign: <slug>` | `/campaign-brief`, `/campaign-draft` (big-C) |
| `projects/campaigns/<slug>/` | **Everything a campaign makes:** brief, workflows, drafts, review, results, `gate-output.json`, `page.html`. Nothing a campaign makes goes anywhere else | The commands |
| `wiki/brand/`, or another plugin's `brand/` | The brand brain: from the Marketing Brain here, or a company plugin such as `cxl-plugin`. Read in place, never written | The marketing-brain plugin, or the plugin that ships it |
| `daily-logs/` | The personal OS's daily logs. Read as context, never written | The personal-os plugin |

## The brand brain

**Find it first.** The brain can live in this folder (`wiki/brand/`), in another installed plugin's `brand/` folder (a company plugin such as `cxl-plugin`), or in another folder. Run `bash "${CLAUDE_PLUGIN_ROOT}/plugin/find-context.sh" "$PWD"` (in the repo copy: `bash plugin/find-context.sh "$PWD"`) to list every source, then use the one recorded as `**Brand source:**` in `CLAUDE.md`; with several sources and nothing recorded, ask once and record the answer (section 2 of `frameworks/campaign-inputs.md`). Read a plugin's brand in place; never copy or edit it.

Read it before anything customer-facing, in this order: the source's `README.md` if it has one, `icp.md`, `positioning-messaging.md`, `voice-guide.md`, `vocabulary.md`. Read the `.md` files, never the pages in `projects/marketing-brain/outputs/`. The brand is defined once: never ask a voice, audience or messaging question the brain already answers. Check each file's `status`:
- `template`: empty. Say which, point to the Marketing Brain exercise that fills it (`/marketing-brain:icp-dossier`, `positioning-messaging`, `brand-voice`), and continue with what the brief collected, tagged (inferred).
- `draft`: usable; say it has open tags and do not lean on a tagged line as proof. Lines tagged (inferred), (vague), hypothesis or proxy are direction only, never a claim or a proof point. An ICP at `stage: hypothesis` means the audience is a guess: say so.
- `final`: use it.
- No brain in this folder or in any plugin: ask once whether the user has a brain in another folder, and follow section 2 of `frameworks/campaign-inputs.md` (recommend running the engine there; otherwise a dated snapshot copy). Only with no brain anywhere: say so once. The brief's sections 3, 5 and 9 carry the audience, the angles and the voice rules instead, tagged (inferred). The engine does not need the Marketing Brain to run; it is better with it.
- `example` mode: `raw/campaigns/example/brand-brain/` stands in for `wiki/brand/`.
- A `practice-<slug>` campaign (`/campaign-brief practice`, made up on the spot): the user's own brain if they chose it, otherwise none, and the brief's made-up answers stand in. Practice data never goes into `raw/` or a real campaign; the board lists it under Examples. Every command takes a practice slug like any other.

**Who** comes from `icp.md`: "Who buys now" (older brains: the rich avatar and core segment), the exclusions (negative ICP), their words. **What to say** from `positioning-messaging.md`: the owned key message, the pillars, and the only proof points the drafts may use. **How to say it** from `voice-guide.md` and `vocabulary.md`. When files disagree, wording follows voice-guide > vocabulary > positioning-messaging > icp, facts the reverse; say when you hit one.

## Daily logs

If the personal-os plugin writes daily logs here (or `CLAUDE.md` records `**Daily logs:** <path>`), read them as context: decisions, commitments and launches that concern a campaign. They are never proof: a number found only in a log is a lead to its source, not a metric. Cite the log file. Never edit a log. Section 2b of `frameworks/campaign-inputs.md` says which command reads what.

## Keep it short (every command, every file)

The first cohort's main feedback was too much information. Every reply and every file this engine writes follows these rules.

**In the chat**
- **Lead with the answer.** First line: what happened or what you need. No preamble, no recap of what the user said.
- **Eight lines at most, then the questions.** If there is more, it goes in the file or on the campaign page, with a link.
- **Mark the human checks.** A question where the user decides something that matters (Gate 1, a step they own, a Gate 2 fix, a skip that weakens the review) starts with **Your call:**. Other questions do not, so the real decisions stand out. `frameworks/human-checks.md` maps them all.
- **One round of questions per step.** Everything a step needs from the user goes in one message: up to three questions, numbered, in plain words, each with numbered choices or a suggested answer where possible, so one reply settles them all ("1: yes · 2: HubSpot · 3: ok"). Then do the step. Never ask again what an answer already settled.
- **Ask only for what is missing.** If a file, the brand brain, a daily log or a connected tool already answers it, use it and say so in a few words.
- **Never paste a file back.** Say what is in it in one line and link it.
- **Tables for anything with more than three items**; short rows, no paragraphs inside cells.
- **Plain words.** No internal terms the user has not seen (layers, slots, frontmatter). Say "your version of the email workflow", not "the campaign-layer workflow file".
- Round numbers in the chat (about 38,500, not 38,551). Exact figures live in the file.

**In files**
- **At a glance first:** every brief, review and results file opens with an "At a glance" block: seven lines or fewer in a brief, six in a review or results file. Someone who reads only that block knows what is decided.
- **One line per field.** Detail, reasoning, baselines and sources go to the "Sources" section at the end, not into the field.
- **Cut before adding.** If a section is longer than its cap, cut the least useful line; do not shrink the font of the idea.
- **Base template, budgets and the check:** the `keep-it-compact` skill. Ask before adding a tab, section or file the template does not have; change in place, never append "(changed)" or "new 11 Oct"; run `plugin/page-check.sh` before every publish.
- No em dashes.

## Draft first (every command)

The aim is a complete first draft fast, then better drafts with real data. Members of the first cohort spent hours, some of them days, going back and forth before seeing a draft. A full run, brief to review, should take about 90 minutes in fast mode and two hours in full mode.

- **Ask only what blocks the draft.** Before asking, check whether a reasonable assumption would do. If it would, make it, tag it **(inferred)** in the file, and list the assumptions in one line at the end of the step ("I assumed: 2 sends a week, HubSpot, no paid budget. Change any?"). The (inferred) rule still holds: metrics, customers, quotes and proof are never assumed; missing means blank.
- **What always blocks:** the goal and its number, who it is for, the offer, and anything a person must approve before it is sent, published or paid for. Everything else can wait for Gate 1 or Gate 2.
- **Steps that need the built or live asset are launch tasks, not pauses.** A workflow step marked "at launch" (in its Who cell), or any step whose rule needs a live page, a loaded email, a running ad, a lead arriving or a sales call, is not done and not waited for while drafting. It goes to the draft's `### Launch tasks` with its owner, its rule and its check, and drafting moves on.
- **Two run modes,** chosen once per campaign at the start of `/campaign-brief` and recorded as `run:` in the brief's frontmatter:

  | Mode | Steps a person owns | Best for |
  |---|---|---|
  | **Fast** | Claude makes the call it would recommend, records it in the draft's `decisions` marked (assumed), and keeps going. Every assumed call is listed first in the review, for the user to accept or change at Gate 2 | A practice run, a demo, a first draft to react to. Default for `example` and `practice` |
  | **Full** | Claude stops at each one and decides with the user, one round of questions per step | A campaign you will launch, when you want to shape every step. Default for your own campaigns |

  Both modes stop at Gate 1 and Gate 2: approving the brief and accepting the review are always the human's. Neither mode sends, publishes or spends anything. Switch by changing `run:` in the brief, or by saying "go fast" or "go full" at any point.

## Rules that hold everywhere

- **The brief holds decisions, drafts hold copy.** Copy found in a brief is moved to a draft or cut. Specs (limits, counts, formats) live in the workflow, not the brief.
- **The campaign's workflow is the one that runs.** Draft by following `projects/campaigns/<slug>/workflows/<channel>.md` step by step. At every step a person owns, stop and wait in full mode, or make and record the call in fast mode (see "Draft first"); launch tasks never stop drafting. Write tool steps as instructions for the person. No workflow file for a channel: do not improvise one or fall back silently; point to `/campaign-channels <slug>`. Layers, most specific first: this campaign, the user's default, the starter (`frameworks/workflow-format.md`).
- **Linked campaigns.** A sub-campaign lives inside its main campaign's folder (`parent:`); campaigns alongside each other keep their own folders and are linked on both briefs (`links:`). Two levels only. Read every linked brief before writing one. Rules: `frameworks/linked-campaigns.md`.
- **Scale next to the name.** Wherever a campaign is named on a page or the board, its scale badge (small-c or big-C) sits next to the name.
- **Many campaigns at once.** Everything about a campaign lives in its folder. Keep the board in `projects/campaigns/campaigns.md` current: every command that changes a campaign's stage updates its row.
- **Approval is human.** `status: approved` on a brief and the decisions in a review are set only after the user says so, in every mode including `example`.
- **The (inferred) and (no proof) rules.** Every brief line traces to a file, a brain section, a snapshot, or the user's answer, or it is tagged (inferred). Every claim in a draft traces to the brief's proof table or the brain, or it is cut. A message marked (no proof) is written as an opinion, never as a fact or a number. Metrics, customers, quotes and case studies are never generated.
- **The ask, not the asset.** Every CTA moves the reader to the brief's KPI action. A sequence ends on the ask. A page whose only CTA is the download, when the goal is meetings, fails the gate.
- **Sales handoff in writing.** Lead definition, who is alerted, where, the time limit (default: an MQL is called within one working day), and what sales does with the lead. The sales owner is named, and asked, never inferred.
- **Read only in tools.** Pulls from a CRM, email, ad or analytics tool are read only and saved as dated snapshots in `raw/campaigns/live/`. Loading a draft anywhere is the human's step, after Gate 2.
- **Social proof.** Quotes are word for word; spoken quotes drop fillers and mark cuts with an ellipsis, never adding words. A member's private outputs are never shown or quoted: mention them only as unnamed anecdotes. Match the format to the channel: a whole demo in a blog, one story per email or founder post, several short quotes on a landing page or carousel, one idea per Short. Record who still has to sign off in the draft.
- **No personal data in campaign folders.** Leads and customers by company, segment or ID. Email addresses stay in `raw/`. The HR tech example in the gate stays unnamed.
- **Classification.** The goal decides. Big-C when the goal is strategic (revenue, pipeline or category) and at least one more trigger holds (longer than 8 weeks; more than one segment or program; four or more channel types; needs sales, product, PR or events). A tactical goal is small-c however many channels it uses. The engine proposes, the human confirms at Gate 1. A big-C plan spawns small-c briefs (section 14); channels are drafted from those.
- **Every command ends on the next step, ready to run.** Close with one line on what the next command does, then the command itself with the slug filled in, named the way this session runs it: `/campaign-engine:<command>` with the plugin, `/<command>` in the repo copy. In `example` mode the argument is `example`; a practice campaign uses its `practice-<slug>`. Then ask **"Run it now?"** and on a yes, run it in this session. The order: `campaign-brief`, `campaign-channels`, `campaign-draft` (which runs `campaign-review` itself), then `campaigns running` and `campaigns close`.
- **No em dashes**, in any file this engine writes.

## Credits

Brief structure (small-c and big-C), the sales enablement process, the email sequence pattern and the campaign lessons: Tyler Durman, from briefs and plans written 2020 to 2025 and shared for this workshop. Channel craft and gate criteria: the CXL instructors named in `frameworks/quality-gate.md`. Acme Deals: Nick Christensen (MIT). Decision models: `frameworks/decision-models.md`.
