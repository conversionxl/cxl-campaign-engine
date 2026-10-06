---
description: Campaign Engine step 3. Draft every channel of an approved campaign by following your own workflow file for that channel, step by step, pausing at every human lane. Writes one draft per channel.
argument-hint: <campaign slug> [channel ...]
---

# /campaign-draft

Step 3 of the Campaign Engine. Take an approved brief and draft each channel the way the participant's workflow says to, not the way you would.

Read the `campaign-engine` skill, then the brief, then each channel's workflow in `projects/campaign-engine/workflows/`, then the brand brain, before writing a line.

## Mode

- **`<slug>`:** `projects/campaigns/<slug>/brief.md`. If `status` is not `approved`, stop: say the brief has not passed Gate 1 and point to `/campaign-brief <slug>`. Drafts go to `projects/campaigns/<slug>/drafts/<channel>.md`.
- **`example-agency-upgrade`** (or `example`): the Acme brief written by `/campaign-brief example`. If it does not exist, say to run that first. The brief's approval is assumed for the dry run; say so. Brain from `raw/campaigns/example/brand-brain/`.
- **Channels:** named as further arguments, or asked for in step 1.

## 1. Which channels

List the brief's `channels` and every workflow file in `projects/campaign-engine/workflows/` with its `status` (starter or adjusted). Ask which to draft now. A channel in the brief with no workflow file: say it cannot be drafted until `/workflow-update <channel>` creates one. Do not improvise a workflow.

For a **big-C** brief: do not draft channels. Read section 14 and offer to create the small-c brief folders it lists, each with `parent:` set, then stop. Channels are drafted from the small-c briefs.

## 2. Load

- The brief in full. Note the KPI action, the CTA, the angles with proof status, the buyer's thought, the exclusions, the handoff rule, the constraints.
- The brand brain as the `campaign-engine` skill says: who, what to say, how to say it. In `example` mode, the example brain.
- The inputs the workflow's "Pulls in" section names (files in `raw/campaigns/`, connected tools, read only).

## 3. Follow the workflow, one channel at a time

For each channel, walk the Steps table in order:

- **Claude Code lane:** do the step exactly as written. Produce what the "Comes out" column says.
- **Human lane (any named role):** **stop.** Show the work so far and the decision the step asks for. Wait for the answer. Record it. Do not continue past a pause on your own, and do not batch two pauses into one question.
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
workflow: projects/campaign-engine/workflows/<channel>.md (status at draft time)
status: draft
last_updated: ""
decisions: []        # every human-lane answer, with the step number
sources: []          # brief sections, brain files, raw files used
---
```

Then the content the workflow's Outputs section lists, in the order of the steps. Mark any line that rests on a (no proof) angle or an (inferred) brief line. If the file exists, write `<channel>-v2.md` and say so; never overwrite a draft.

## 5. Hand over

For each channel: the file path, the decisions taken at each pause, and anything the gate will probably flag (say it now rather than wait). Then: **next, `/campaign-review <slug>`.** Nothing is loaded into an email, ad or CRM tool by this command; that is the human's step after Gate 2.
