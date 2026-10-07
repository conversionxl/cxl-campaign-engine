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
| `frameworks/` | The reference: template, workflow format, the starter workflows, default gate, inputs, board format, decision models | The module. Never edited by commands |
| `wiki/brand/` | The brand brain from the Marketing Brain. Read, never written | The marketing-brain plugin |

## The brand brain

Read it before anything customer-facing, in this order: `wiki/brand/README.md`, `icp.md`, `positioning-messaging.md`, `voice-guide.md`, `vocabulary.md`. Read the `.md` files, never the pages in `projects/marketing-brain/outputs/`. The brand is defined once: never ask a voice, audience or messaging question the brain already answers. Check each file's `status`:
- `template`: empty. Say which, point to the Marketing Brain exercise that fills it (`/marketing-brain:icp-dossier`, `positioning-messaging`, `brand-voice`), and continue with what the brief collected, tagged (inferred).
- `draft`: usable; say it has open tags and do not lean on a tagged line as proof. Lines tagged (inferred), (vague), hypothesis or proxy are direction only, never a claim or a proof point. An ICP at `stage: hypothesis` means the audience is a guess: say so.
- `final`: use it.
- No `wiki/brand/` here: ask once whether the user has a brain in another folder, and follow section 2 of `frameworks/campaign-inputs.md` (recommend running the engine there; otherwise a dated snapshot copy). Only with no brain anywhere: say so once. The brief's sections 3, 5 and 9 carry the audience, the angles and the voice rules instead, tagged (inferred). The engine does not need the Marketing Brain to run; it is better with it.
- `example` mode: `raw/campaigns/example/brand-brain/` stands in for `wiki/brand/`.

**Who** comes from `icp.md`: "Who buys now" (older brains: the rich avatar and core segment), the exclusions (negative ICP), their words. **What to say** from `positioning-messaging.md`: the owned key message, the pillars, and the only proof points the drafts may use. **How to say it** from `voice-guide.md` and `vocabulary.md`. When files disagree, wording follows voice-guide > vocabulary > positioning-messaging > icp, facts the reverse; say when you hit one.

## Rules that hold everywhere

- **The brief holds decisions, drafts hold copy.** Copy found in a brief is moved to a draft or cut. Specs (limits, counts, formats) live in the workflow, not the brief.
- **The campaign's workflow is the one that runs.** Draft by following `projects/campaigns/<slug>/workflows/<channel>.md` step by step. Stop at every step a person owns and wait; write tool steps as instructions for the person. No workflow file for a channel: do not improvise one or fall back silently; point to `/campaign-channels <slug>`. Layers, most specific first: this campaign, the user's default, the starter (`frameworks/workflow-format.md`).
- **Many campaigns at once.** Everything about a campaign lives in its folder. Keep the board in `projects/campaigns/campaigns.md` current: every command that changes a campaign's stage updates its row.
- **Approval is human.** `status: approved` on a brief and the decisions in a review are set only after the user says so, in every mode including `example`.
- **The (inferred) and (no proof) rules.** Every brief line traces to a file, a brain section, a snapshot, or the user's answer, or it is tagged (inferred). Every claim in a draft traces to the brief's proof column or the brain, or it is cut. An angle marked (no proof) is written as an opinion, never as a fact or a number. Metrics, customers, quotes and case studies are never generated.
- **The ask, not the asset.** Every CTA moves the reader to the brief's KPI action. A sequence ends on the ask. A page whose only CTA is the download, when the goal is meetings, fails the gate.
- **Sales handoff in writing.** Lead definition, who is alerted, where, and the time limit (default: an MQL is called within one working day). The sales owner is named.
- **Read only in tools.** Pulls from a CRM, email, ad or analytics tool are read only and saved as dated snapshots in `raw/campaigns/live/`. Loading a draft anywhere is the human's step, after Gate 2.
- **No personal data in campaign folders.** Leads and customers by company, segment or ID. Email addresses stay in `raw/`. The HR tech example in the gate stays unnamed.
- **Classification.** The goal decides. Big-C when the goal is strategic (revenue, pipeline or category) and at least one more trigger holds (longer than 8 weeks; more than one segment or program; four or more channel types; needs sales, product, PR or events). A tactical goal is small-c however many channels it uses. The engine proposes, the human confirms at Gate 1. A big-C plan spawns small-c briefs (section 14); channels are drafted from those.
- **No em dashes**, in any file this engine writes.

## Credits

Brief structure (small-c and big-C), the sales enablement process, the email sequence pattern and the campaign lessons: Tyler Durman, from briefs and plans written 2020 to 2025 and shared for this workshop. Channel craft and gate criteria: the CXL instructors named in `frameworks/quality-gate.md`. Acme Deals: Nick Christensen (MIT). Decision models: `frameworks/decision-models.md`.
