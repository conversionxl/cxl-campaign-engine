---
description: Campaign Engine step 1. Write or adjust a campaign brief from your campaign history, the brand brain, connected tools and your answers; classify it small-c or big-C; run Gate 1 and stop for your approval.
argument-hint: [example | practice [idea] | campaign name]
---

# /campaign-brief

Step 1 of the Campaign Engine. Turn what the business already knows, plus the user's answers, into a brief that holds decisions and no copy, then stop at Gate 1 for a human to approve it.

**Keep it short.** Follow "Keep it short" in the `campaign-engine` skill for every reply and file: answer first, eight lines at most, one question at a time, detail in the file.

Read `frameworks/campaign-brief-template.md`, `frameworks/campaign-inputs.md`, `frameworks/linked-campaigns.md` and the Gate 1 table in `frameworks/quality-gate.md` in full first (with the plugin and no local copy, read them from `${CLAUDE_PLUGIN_ROOT}/frameworks/`). The `campaign-engine` skill says how the folders fit together.

## Mode

- **No argument:** read `projects/campaigns/campaigns.md` and show the active campaigns in one table (campaign, stage, KPI, next command). Ask: adjust one of these, or start a new one? Then continue as below.
- **A campaign name:** the user's own campaign. Inputs from `raw/campaigns/` (excluding `example/`), the brand brain from its recorded source, recent daily logs, connected tools, and the user's answers. Write to the campaign's folder: `projects/campaigns/<slug>/brief.md`, or inside its main campaign's folder (`projects/campaigns/<main>/campaigns/<slug>/brief.md`) when it is a sub-campaign. If the slug exists anywhere on the board, this is an adjustment: read the brief, say what is there, and change only what the user asks.
- **`example`:** Acme Deals. Inputs from `raw/campaigns/example/` and the brain in `raw/campaigns/example/brand-brain/`. Write to `projects/campaigns/example-agency-upgrade/brief.md`. The campaign to brief: the Q4 upgrade campaign to the 612 lifetime-deal agencies before the 1 November price rise, KPI demos booked. Skip step 0 and use the example files as the answers; say so in one line. Never write example data into a user campaign.
- **`practice [idea]`:** a made-up campaign, invented on the spot, for someone who wants to try the engine on something closer to their own work than Acme. No idea given: ask for one in a sentence (a company, what it sells, and what the campaign is for). Then ask once: use your own brand docs (a hypothetical campaign for your real company), or make the company up too? Ask the minimum in one message: who it is for and who it is not for, the goal and the one number, the offer, the deadline, and two or three things customers say. Anything the user does not know, suggest a plausible answer for them to accept or change. Write to `projects/campaigns/practice-<slug>/brief.md` with `practice: true` in the frontmatter and a first line saying it is a practice campaign with made-up inputs. The user's made-up answers count as the source; lines Claude suggested and the user accepted are tagged (made up). Skip step 0 except item 1, and in step 1 read only the brand brain (if they chose their own) and the channel starters: no `raw/campaigns/`, daily logs or connected tools. Never write practice data into `raw/` or into a real campaign. On the board it goes in the Examples section. Unlike `example`, the user can approve it and take it through every step, Gate 2 included.

## 0. Before you run

Do all of this before step 1, and wait for the answers. Skip it in `example` mode; in `practice` mode do only item 1.

1. **Is the module set up here?** Look for a `## Campaign Engine` section in `CLAUDE.md` and for `projects/campaign-engine/quality-gate.md`, `projects/campaigns/campaigns.md` and `raw/campaigns/`. If any is missing and this session has the campaign-engine plugin, run `bash "${CLAUDE_PLUGIN_ROOT}/plugin/setup.sh" "$PWD"` with the shell and show its output: it creates the folders, the `.gitignore` rule, your copies of the workflows and the gate, and the CLAUDE.md section, and never overwrites a file. Without the plugin, create only the missing folders and say so. Then **sort loose drops:** if files sit in the top level of `raw/` (anything but `README.md` and the subfolders), propose a folder for each from the table in section 1 of `frameworks/campaign-inputs.md`, as `file | folder | why`, and move them after the user confirms, verbatim, with a source and date line.
2. **Brand and daily logs.** Run `bash "${CLAUDE_PLUGIN_ROOT}/plugin/find-context.sh" "$PWD"` (in the repo copy: `bash plugin/find-context.sh "$PWD"`). It lists every brand source (this folder, other installed plugins such as a company plugin, a recorded folder) with each file's status, and where the daily logs are. Pick the brand source as section 2 of `frameworks/campaign-inputs.md` says: the one recorded as `**Brand source:**` in `CLAUDE.md`; else the only one found; else ask once, recommend one, and record the answer. For the logs, follow section 2b (ask once only if there are none and no personal OS here). Then check the chosen brain. Report its state in one line, including the ICP's stage if it has one. Filled files are not asked about again: skip every question in this brief that the brain answers. If no source holds a brain, ask once whether the user has one in another folder and follow the framework's row for that. If there is no brain anywhere, or a file is still a template, say the audience, messaging and voice sections will be collected here and tagged (inferred), and name the Marketing Brain command that would fill each gap. Continue either way.
3. **Show what you found, in three lines.** Brand (which source, its state), daily logs (how many, any that mention this campaign), files in `raw/campaigns/`. Do not list paths.
4. **Ask for what is missing, one message at a time, three questions at most per message.** Work down this list and skip anything the brain, the logs, the files or a connected tool already answers:
   1. The one number this campaign is accountable for, and by when.
   2. What the last campaign to this audience returned, and what sales said. ("Drop the readout in `raw/campaigns/` or paste it here.")
   3. Who must not get this.
   4. What proof you can stand behind today: numbers, customers, quotes you are allowed to use.
   5. Who on the sales side owns the leads, and how fast they act.
   6. The budget: a total, and what goes to paid channels. And anything changing: a price, a launch, an event, a blackout date.
   7. What buyers compare you with: a named competitor, doing it themselves, or doing nothing.
   8. What customers say about this problem, in their words, if the brain and `raw/voc/` have nothing.
   Number the questions so the user can answer "1: 70 sales by 10 Nov, 3: existing customers". Accept "skip" and "don't know"; mark those fields (inferred) and move on.
   Then, once, as its own message: **linked campaigns** (`frameworks/linked-campaigns.md`). Show the board's active campaigns as numbered choices and ask: "1 Is this part of a bigger campaign? 2 Will it have sub-campaigns? 3 Does anything run alongside it: feeding it, fed by it, or reaching the same people in the same weeks?" A main campaign that does not exist yet: offer to start it as a draft stub and put this campaign inside it. Write each link on both briefs and say so.
5. **Connections, only if they would answer something still missing.** Say in one line which tools this session can reach. Ask about others only when a missing answer lives there (a target needs the CRM, a baseline needs the email tool). Pulls are read only and saved to `raw/campaigns/live/`.
6. **Decision model, once per folder.** If `CLAUDE.md` has no `**Decision model:**` line, ask once: "Do you want a second, automatic check from a decision model (Jev or Cloudflare's Clef) on the brief and every draft? It needs an API key. 1 No (most people) · 2 Jev · 3 Clef · 4 Both". Record the answer as `**Decision model:** none | jev | clef | both` in the Campaign Engine section of `CLAUDE.md`. Never ask again; `frameworks/decision-models.md` says how it runs.
7. **Go.** Start drafting as soon as the goal, the audience and the offer are known. Everything else can be (inferred) and fixed at Gate 1. Nothing at all: offer `example`, or `practice` to make one up.

## 1. Read the inputs

- `raw/campaigns/` in full (past briefs, results, sales feedback, calendar, `live/`). Note the sections the past briefs always fill, the specs they retype (those belong in workflows, not here), and every goal that was or was not hit.
- **Daily logs** from the last 30 days, searched for the campaign's name, product, offer, audience and KPI: decisions already made, commitments to sales, earlier attempts. Use what they settle instead of asking again, cite the log file, and treat any number in a log as a lead to its source, never as a metric.
- The brand brain from the chosen source (or the example brain): `icp.md` for audience and their words, `positioning-messaging.md` for the owned key message, pillars and proof points, `voice-guide.md` and `vocabulary.md` for constraints.
- **Linked briefs:** the main campaign's brief (its goal tree, audience and dates), each sub-campaign's and each alongside campaign's (audience, dates, offer, cadence). Cite a number from one to that brief. Where an alongside campaign reaches the same people in the same weeks, the Constraints say who sends what and the combined cadence.
- The live pulls agreed in step 0. Save each before using it; cite the snapshot path.
- The channel starters in `frameworks/workflows/` and any defaults in `projects/campaign-engine/workflows/`: the channels the engine has a workflow for. A channel the user wants that has neither is still listed; `/campaign-channels` will take their steps or suggest some.

**Copy in a past brief is evidence of angles and offers, not something to carry over.** The new brief holds decisions only.

## 2. Classify

Apply the rule from the template: the goal decides, and big-C needs a strategic goal plus at least one more trigger. Show the five triggers with a yes or no and the evidence for each, propose small-c or big-C, and ask the user to confirm. Write the result and its reason in a few words on the At a glance Goal line ("Scale: small-c, one tactical goal in 8 weeks"), so anyone reading the brief or the campaign page sees which kind it is. Big-C: sections 10 to 15 are filled and section 14 lists the small-c briefs the plan will spawn. Small-c: sections 10 to 15 are omitted.

## 3. Draft the brief

Fill the template section by section, in order, then write the At a glance block last. Rules:

- **Short.** One line per field, three lines per list at most, about 300 words above the Evidence section. Reasoning, maths, baselines, full source paths and open questions go to Evidence. If a field needs a paragraph, it is two decisions: split it or move the explanation to Evidence.

- **Decisions, not copy.** No headlines, no email text, no ad lines. An angle is a claim plus its proof, in one line.
- **Every line traces to an input**, with a short tag in the field (`(Metorik)`, `(icp.md)`, `(your answer)`) and the full source in Evidence or `sources`. Anything else is tagged **(inferred)**.
- **Proof.** Each angle's proof comes from the hub's proof points row or a file in `raw/`. No proof: mark the angle **(no proof)**. Never state a number the inputs do not contain. A claim that needs legal or a sign-off goes in section 9.
- **Audience.** Include from the ICP's core segment unless the user says otherwise. Exclude existing customers from acquisition offers, the negative ICP, anyone in an active sales conversation, and whatever the user named. State the size and its source.
- **Buying stage.** Quote the buyer's thought verbatim from VOC, with its source. If none exists, leave it blank and say the brief is weaker for it. **Weighing against:** name up to three alternatives the buyer compares (a competitor's product or cohort, doing it themselves, doing nothing) from VOC, sales notes or the brand brain's competitor notes. Never invent a competitor's offer or price; a name with no source is tagged (inferred).
- **Constraints.** Budget is always the first line: a total and the paid channels' share, with its source, or "not set". Then events or launches running at the same time.
- **Offer.** One destination per offer. A campaign needs one landing page, two at most; a third needs a different offer or audience, named in Evidence.
- **Sales enablement.** Write the lead definition and the handoff rule in the form Tyler Durman uses: what counts as a lead, who is alerted, where (CRM to Slack), and the time limit (default: an MQL is called within one working day; a meeting is confirmed, researched and prepped). Name the sales owner.
- **Measurement.** UTM convention, conversion events, the fields sales needs, the test submission before traffic. Kill rule and scale rule, each with a number and a date.
- **Big-C (sections 10 to 15).** Pipeline math from the CRM snapshot; every number cited or left blank. TAM check as IF / AND / THEN with the numbers. Journey map with the buyer's thought per stage. Architecture as phases, each a small-c brief to come. Team and budget: roles (responsible, accountable, supporting), budget by program, expected return against the math. Sections the inputs cannot fill are drafted from the rest of the plan and tagged (inferred), because those are the sections that stay blank otherwise.
- **Linked campaigns.** Fill the section under At a glance and set `parent:` and `links:` in the frontmatter, as `frameworks/linked-campaigns.md` says. Leave the section out when it stands alone.
- Set `status: draft`, `scale`, `owner`, `dates`, `channels` (a first proposal; `/campaign-channels` confirms it), `sources`. Update this campaign's row in `projects/campaigns/campaigns.md` (create the board from `frameworks/campaigns-board.md` if it is missing; example campaigns go in its Examples section): stage `brief`.

## 4. Gate 1

Fill the Gate 1 table from `frameworks/quality-gate.md`, row by row, with a pass or fail and a note. Any fail: show it, propose the fix, and ask. Do not ask for approval while a row fails. Typical fails: the KPI is an asset action (downloads) when the goal is meetings; no exclusions; an angle with no proof; no handoff time; no kill rule.

If `CLAUDE.md` records `**Decision model:** jev`, `clef` or `both`, also run the Gate 1 rows through it (with `both`, through each) as `frameworks/decision-models.md` says. Save the answers to `projects/campaigns/<slug>/gate-output.json` and say one line in the chat ("Jev and Clef agree", or the checks they both fail). Never write model results into the brief: they live in the review, where `/campaign-review` folds them into its recommendations under the step Brief. The models never override the table; the human decides.

## 5. Ask for approval

Show only the At a glance block, then one line per Gate 1 problem if any, then the link to the brief. Ask: **"1 Approve · 2 Change something · 3 Not yet"**. Do not show the full brief in the chat.

- **1 Approve:** set `status: approved`, `approved_by`, `approved_on`. Update this campaign's row in `projects/campaigns/campaigns.md` (create the board from `frameworks/campaigns-board.md` if it is missing; example campaigns go in its Examples section): stage `approved`. Then the next step: `/campaign-engine:campaign-channels <slug>` picks the channels and adjusts each one's steps. Ask **"Run it now?"**
- **2 Change something:** ask what, make the change, re-run Gate 1, show the At a glance block again.
- **3 Not yet:** leave `status: draft` and say in one line what is missing.

Approval is the human's. Never set `approved` on your own, in any mode. In `example` mode, stop at the question and say that the practice brief ends here, ready to approve. Then the next step: `/campaign-engine:campaign-channels example` shows how a channel's steps get adjusted, on the same practice campaign. Ask **"Run it now?"**, and offer `/campaign-engine:campaign-brief <your campaign>` as the other way forward.

**Campaign page.** After the approve question is answered (approve, change or not yet), ask once if the brief has no `page:` yet: "Want a page for this campaign you can share? Each step adds a tab to it. 1 Yes · 2 No". Follow `frameworks/campaign-page.md`: on Yes, build the page with the Brief tab filled and record `page:`; on No, record `page: none`. If `page:` is already set, update the Brief tab and give the link. Either way the page shows the scale badge next to the title and, for a linked campaign, the family line and Linked tab; refresh this campaign's card on every linked campaign's page that has one.

## 6. Checks

Answer honestly from what you wrote:
- Could someone read the At a glance block in thirty seconds, and the brief in three minutes, and know what to make and what not to make? Is it under about 300 words above Evidence? If not, cut.
- Does every CTA the drafts will carry lead to the KPI action, not to the asset?
- How many (inferred) tags are open, and which single input would resolve the most?
- Which channels does the brief propose, and which have no starter yet (so `/campaign-channels` will need the user's steps or a suggestion)?

Then the file path and the next step, as the `campaign-engine` skill's hand-off rule says.

## Last. Connect it to the repo

If the repo has a `CLAUDE.md` with no `## Campaign Engine` section, or an `AGENTS.md` that does not mention `projects/campaigns/`, say so and offer to add the section from `plugin/claude-md-section.md`. Change nothing without a yes.
