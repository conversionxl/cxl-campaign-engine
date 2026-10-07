---
description: Campaign Engine step 1. Write or adjust a campaign brief from your campaign history, the brand brain, connected tools and your answers; classify it small-c or big-C; run Gate 1 and stop for your approval.
argument-hint: [example] [campaign name]
---

# /campaign-brief

Step 1 of the Campaign Engine. Turn what the business already knows, plus the user's answers, into a brief that holds decisions and no copy, then stop at Gate 1 for a human to approve it.

Read `frameworks/campaign-brief-template.md`, `frameworks/campaign-inputs.md` and the Gate 1 table in `frameworks/quality-gate.md` in full first (with the plugin and no local copy, read them from `${CLAUDE_PLUGIN_ROOT}/frameworks/`). The `campaign-engine` skill says how the folders fit together.

## Mode

- **No argument:** read `projects/campaigns/campaigns.md` and show the active campaigns in one table (campaign, stage, KPI, next command). Ask: adjust one of these, or start a new one? Then continue as below.
- **A campaign name:** the user's own campaign. Inputs from `raw/campaigns/` (excluding `example/`), the brand brain in `wiki/brand/` if present, connected tools, and the user's answers. Write to `projects/campaigns/<slug>/brief.md`. If the slug exists, this is an adjustment: read the brief, say what is there, and change only what the user asks.
- **`example`:** Acme Deals. Inputs from `raw/campaigns/example/` and the brain in `raw/campaigns/example/brand-brain/`. Write to `projects/campaigns/example-agency-upgrade/brief.md`. The campaign to brief: the Q4 upgrade campaign to the 612 lifetime-deal agencies before the 1 November price rise, KPI demos booked. Skip step 0 and use the example files as the answers; say so in one line. Never write example data into a user campaign.

## 0. Before you run

Do all of this before step 1, and wait for the answers. Skip it in `example` mode.

1. **Is the module set up here?** Look for a `## Campaign Engine` section in `CLAUDE.md` and for `projects/campaign-engine/quality-gate.md`, `projects/campaigns/campaigns.md` and `raw/campaigns/`. If any is missing and this session has the campaign-engine plugin, run `bash "${CLAUDE_PLUGIN_ROOT}/plugin/setup.sh" "$PWD"` with the shell and show its output: it creates the folders, the `.gitignore` rule, your copies of the workflows and the gate, and the CLAUDE.md section, and never overwrites a file. Without the plugin, create only the missing folders and say so. Then **sort loose drops:** if files sit in the top level of `raw/` (anything but `README.md` and the subfolders), propose a folder for each from the table in section 1 of `frameworks/campaign-inputs.md`, as `file | folder | why`, and move them after the user confirms, verbatim, with a source and date line.
2. **The brand brain.** Check `wiki/brand/` as section 2 of `frameworks/campaign-inputs.md` says. Report its state in one line, including the ICP's stage if it has one. Filled files are not asked about again: skip every question in this brief that the brain answers. If `wiki/brand/` is missing, ask once whether the user has a brain in another folder and follow the framework's row for that. If there is no brain anywhere, or a file is still a template, say the audience, messaging and voice sections will be collected here and tagged (inferred), and name the Marketing Brain command that would fill each gap. Continue either way.
3. **The six questions.** Ask the six questions in section 5 of `frameworks/campaign-inputs.md` in one message: the one number and who set it; what the last campaign to this segment returned and what sales said; who must not be reached; what proof can be stood behind today; who owns the leads on the sales side and how fast; what is changing (price, launch, event, blackout). Write the answers down; the inputs test them.
4. **Documents.** Ask for past briefs, the last readout, sales feedback and the calendar. Three ways in: dropped into `raw/campaigns/` (`past-briefs/`, `results/`, the folder itself), pasted into the chat for you to file, or named in a connected docs tool (Google Drive, Notion, ClickUp, Asana) for you to fetch and save with the link and date at the top.
5. **Voice of customer for this campaign.** Ask for the three to five things customers in the target segment say about this problem, verbatim, and where they come from. Check `raw/voc/` and `wiki/brand/icp.md` (Their words) first and offer what is already there. Ask for lost reasons and objections from the CRM.
6. **Connections.** Say which tools this session can already reach that matter for a brief (CRM, email, ads, analytics, docs, support). Ask which they use. For each one not connected, say how to connect it (section 4 of the framework) and offer to continue without it. Agree what to pull: pipeline, ACV and stage conversion from the CRM; list sizes and past open, click and reply rates from email; past CTR and cost per lead from ads; landing page conversion from GA4. Pulls are read only and go to `raw/campaigns/live/` as dated snapshots.
7. **Go or wait.** Summarise what you now have in one line each (answers, documents, VOC, live data, brain) and ask whether to start or add more first. Nothing at all: offer `example`.

## 1. Read the inputs

- `raw/campaigns/` in full (past briefs, results, sales feedback, calendar, `live/`). Note the sections the past briefs always fill, the specs they retype (those belong in workflows, not here), and every goal that was or was not hit.
- The brand brain (or the example brain): `icp.md` for audience and their words, `positioning-messaging.md` for the owned key message, pillars and proof points, `voice-guide.md` and `vocabulary.md` for constraints.
- The live pulls agreed in step 0. Save each before using it; cite the snapshot path.
- The channel starters in `frameworks/workflows/` and any defaults in `projects/campaign-engine/workflows/`: the channels the engine has a workflow for. A channel the user wants that has neither is still listed; `/campaign-channels` will take their steps or suggest some.

**Copy in a past brief is evidence of angles and offers, not something to carry over.** The new brief holds decisions only.

## 2. Classify

Apply the rule from the template: the goal decides, and big-C needs a strategic goal plus at least one more trigger. Show the five triggers with a yes or no and the evidence for each, propose small-c or big-C, and ask the user to confirm. Big-C: sections 10 to 15 are filled and section 14 lists the small-c briefs the plan will spawn. Small-c: sections 10 to 15 are omitted.

## 3. Draft the brief

Fill the template section by section, in order. Rules:

- **Decisions, not copy.** No headlines, no email text, no ad lines. An angle is a claim plus its proof, in one line.
- **Every line traces to an input**: a file (cite the path), a brain file (cite the section), a snapshot (cite the path and date range), or the user's answer (say so). Anything else is tagged **(inferred)**.
- **Proof.** Each angle's proof comes from the hub's proof points row or a file in `raw/`. No proof: mark the angle **(no proof)**. Never state a number the inputs do not contain. A claim that needs legal or a sign-off goes in section 9.
- **Audience.** Include from the ICP's core segment unless the user says otherwise. Exclude existing customers from acquisition offers, the negative ICP, anyone in an active sales conversation, and whatever the user named. State the size and its source.
- **Buying stage.** Quote the buyer's thought verbatim from VOC, with its source. If none exists, leave it blank and say the brief is weaker for it.
- **Sales enablement.** Write the lead definition and the handoff rule in the form Tyler Durman uses: what counts as a lead, who is alerted, where (CRM to Slack), and the time limit (default: an MQL is called within one working day; a meeting is confirmed, researched and prepped). Name the sales owner.
- **Measurement.** UTM convention, conversion events, the fields sales needs, the test submission before traffic. Kill rule and scale rule, each with a number and a date.
- **Big-C (sections 10 to 15).** Pipeline math from the CRM snapshot; every number cited or left blank. TAM check as IF / AND / THEN with the numbers. Journey map with the buyer's thought per stage. Architecture as phases, each a small-c brief to come. Team and budget: roles (responsible, accountable, supporting), budget by program, expected return against the math. Sections the inputs cannot fill are drafted from the rest of the plan and tagged (inferred), because those are the sections that stay blank otherwise.
- Set `status: draft`, `scale`, `owner`, `dates`, `channels` (a first proposal; `/campaign-channels` confirms it), `sources`. Update this campaign's row in `projects/campaigns/campaigns.md` (create the board from `frameworks/campaigns-board.md` if it is missing; example campaigns go in its Examples section): stage `brief`.

## 4. Gate 1

Fill the Gate 1 table from `frameworks/quality-gate.md`, row by row, with a pass or fail and a note. Any fail: show it, propose the fix, and ask. Do not ask for approval while a row fails. Typical fails: the KPI is an asset action (downloads) when the goal is meetings; no exclusions; an angle with no proof; no handoff time; no kill rule.

## 5. Ask for approval

Show the brief in one screen: goal, approach, audience include and exclude, offer, angles with proof status, stage and thought, handoff rule, kill rule, classification. Then ask: **approve, change, or hold?**

- **Approve:** set `status: approved`, `approved_by`, `approved_on`. Update this campaign's row in `projects/campaigns/campaigns.md` (create the board from `frameworks/campaigns-board.md` if it is missing; example campaigns go in its Examples section): stage `approved`. Say what comes next: `/campaign-channels <slug>` to pick the channels and adjust their steps, then `/campaign-draft <slug>`.
- **Change:** make the change, re-run Gate 1, ask again.
- **Hold:** leave `status: draft` and list what is missing.

Approval is the human's. Never set `approved` on your own, in any mode. In `example` mode, stop at the question and say that the dry run ends here, with the brief ready to approve.

## 6. Checks

Answer honestly from what you wrote:
- Could someone read this brief in five minutes and know what to make and what not to make?
- Does every CTA the drafts will carry lead to the KPI action, not to the asset?
- How many (inferred) tags are open, and which single input would resolve the most?
- Which channels does the brief propose, and which have no starter yet (so `/campaign-channels` will need the user's steps or a suggestion)?

Then the file path and the next command.

## Last. Connect it to the repo

If the repo has a `CLAUDE.md` with no `## Campaign Engine` section, or an `AGENTS.md` that does not mention `projects/campaigns/`, say so and offer to add the section from `plugin/claude-md-section.md`. Change nothing without a yes.
