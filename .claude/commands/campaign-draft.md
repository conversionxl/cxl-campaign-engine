---
description: Campaign Engine step 3. Draft every channel of an approved campaign by following this campaign's own workflow for that channel, step by step, pausing at every step a person owns. Writes one draft per channel.
argument-hint: <campaign slug> [channel ...]
---

# /campaign-draft

Step 3 of the Campaign Engine. Take an approved brief and draft each channel the way the participant's workflow says to, not the way you would.

**Keep it short.** Follow "Keep it short" in the `campaign-engine` skill for every reply and file: answer first, eight lines at most, one question at a time, detail in the file.

Read the `campaign-engine` skill, then the brief, then each channel's workflow in `projects/campaigns/<slug>/workflows/` (written by `/campaign-channels`), then the brand brain, before writing a line.

## Mode

- **`<slug>`:** `projects/campaigns/<slug>/brief.md`. If `status` is not `approved`, stop: say the brief has not passed Gate 1 and point to `/campaign-brief <slug>`. Drafts go to `projects/campaigns/<slug>/drafts/<channel>.md`.
- **`example-agency-upgrade`** (or `example`): the Acme brief written by `/campaign-brief example`. If it does not exist, say to run that first. The brief's approval is assumed for the dry run; say so. Brain from `raw/campaigns/example/brand-brain/`.
- **Channels:** named as further arguments, or asked for in step 1.

## 1. Which channels

List the brief's `channels` and every file in `projects/campaigns/<slug>/workflows/` with its `status` (starter, suggested or adjusted) and `tools`. Ask which to draft now. No `workflows/` folder at all, or a channel in the brief with no file there: say it cannot be drafted until `/campaign-channels <slug>` sets it up, and offer to run it now. Do not fall back to a default or a starter silently, and do not improvise a workflow.

For a **big-C** brief: do not draft channels. Read section 14 and offer to create the small-c brief folders it lists, each with `parent:` set, then stop. Channels are drafted from the small-c briefs.

## 2. Load

- The brief in full. Note the KPI action, the CTA, the angles with proof status, the buyer's thought, the exclusions, the handoff rule, the constraints.
- The brand brain from its recorded source (`**Brand source:**` in `CLAUDE.md`; run `bash "${CLAUDE_PLUGIN_ROOT}/plugin/find-context.sh" "$PWD"` (in the repo copy: `bash plugin/find-context.sh "$PWD"`) if nothing is recorded), as the `campaign-engine` skill says: who, what to say, how to say it. In `example` mode, the example brain.
- The inputs the workflow's "Pulls in" section names (files in `raw/campaigns/`, connected tools, read only).

## 3. Follow the workflow, one channel at a time

For each channel, walk the Steps table in order:

- **A step owned by `Claude`:** do the step exactly as written, following its rule. Meet the step's "Check before moving on" before the next step.
- **A step owned by a person (`You` or a named role):** **stop.** Show the work so far and the decision the step asks for. Wait for the answer. Record it. Do not continue past a pause on your own, and do not batch two pauses into one question.
- **A step owned by a tool (HubSpot, the CMS, the ad account):** do not do it. Write into the draft exactly what the person loads where, and move on.
- **Specs:** check every element against the Specs table as you write it. Count characters and words. Fix before moving on.
- **Angles and proof:** each asset carries one angle. A claim is written only with its proof from the brief; a (no proof) angle is written as an opinion, never as a fact or a number. Nothing from outside the brief or the brain.
- **CTA:** every CTA leads to the brief's destination and KPI action. Email 1 of a sequence may deliver the asset, but the sequence ends on the ask.
- **Voice:** the brain's voice guide and vocabulary. No em dashes. No hype words. The buyer's words from the ICP where they fit.
- **Exclusions and personal data:** no names of non-public people, no email addresses. Segments and companies only.

## 4. Write the draft

One file per channel, `projects/campaigns/<slug>/drafts/<channel>.md`, with frontmatter:

```
---
type: campaign-draft
campaign: <slug>
channel: <channel>
workflow: projects/campaigns/<slug>/workflows/<channel>.md (status at draft time)
status: draft
last_updated: ""
decisions: []        # every answer at a step a person owns, with the step number
sources: []          # brief sections, brain files, raw files used
---
```

Then the content the workflow's Outputs section lists, in the order of the steps. Mark any line that rests on a (no proof) angle or an (inferred) brief line. If the file exists, write `<channel>-v2.md` and say so; never overwrite a draft.

## 5. Hand over

**Campaign page.** If the brief's `page:` is set (not `none`), update the Drafts tab and the header as `frameworks/campaign-page.md` says, without asking, and end your reply with the link.


For each channel: the file path, the decisions taken at each pause, and anything the gate will probably flag (say it now rather than wait). Then the next step: `/campaign-engine:campaign-review <slug>` (in `example` mode, `example`) scores each draft against your quality gate. Ask **"Run it now?"** Update this campaign's row in `projects/campaigns/campaigns.md` (create the board from `frameworks/campaigns-board.md` if it is missing; example campaigns go in its Examples section): stage `drafted`. Nothing is loaded into an email, ad or CRM tool by this command; that is the human's step after Gate 2.
