---
description: Campaign Engine step 2. Pick the channels this campaign needs, then walk each channel's workflow step by step in the chat and adjust it to your campaign and your tools. Writes this campaign's own version of each workflow, and offers to save it as your default.
argument-hint: <campaign slug> [channel ...]
---

# /campaign-channels

Step 2 of the Campaign Engine. Every channel is a numbered, step-by-step workflow built from the CXL courses and Tyler Durman's briefs. This command shows each one, a step at a time, and turns it into the version this campaign runs.

Read `frameworks/workflow-format.md` first (with the plugin and no local copy, `${CLAUDE_PLUGIN_ROOT}/frameworks/workflow-format.md`). It defines the three layers, the file shape and the rules.

## Mode

- **`<slug>`:** `projects/campaigns/<slug>/brief.md` must exist with `status: approved`. If it is a draft, say so and point to `/campaign-brief <slug>`. No slug: read `projects/campaigns/campaigns.md`, list the approved campaigns, and ask which one.
- **`example-agency-upgrade`** (or `example`): the Acme campaign. Pick the channels from its brief, walk one channel (the email sequence) in full as a demonstration with the example answers, and copy the rest unchanged. Never save an example workflow as a default.
- **Channels named as arguments:** skip step 1 and go straight to those.

## 1. Pick the channels

Show one table: each starter in `frameworks/workflows/`, whether the user has a default for it in `projects/campaign-engine/workflows/`, and whether this campaign already has its own copy. Mark the channels the brief lists in its `channels` field.

Ask which channels this campaign needs. Suggest from the brief: the KPI and the stage decide (a meetings goal almost always needs a sequence and sales enablement; a problem-unaware audience needs content before an offer; every CTA needs a destination, so usually a landing page). Say why in one line each. Then ask: **any channel that is not in the list?**

For each extra channel, offer two routes and wait for the choice:
- **Your steps.** "Type your process, one step per line, in the order you do it." Then ask, per step: who does it (Claude, you or a named role, or a tool), and what the check is before moving on. Format it as a workflow, `status: adjusted`, source "your team".
- **A suggestion.** Draft the steps from the closest starter, adapting each rule to the channel and keeping its source where it still applies; mark rules with no source as (suggested). Save with `status: suggested`, then walk it in step 2 like any other.

Update the brief's `channels` field to match the final list, and say so.

## 2. Walk each channel, step by step

For each channel, in the order the campaign will use them. Start from the most specific layer that exists: the campaign's own copy if this is a re-run, else the user's default, else the starter. Say which one in one line.

**First, the tools.** Ask once per channel: "Which tools do you use for this?" (for example the email platform, the CRM, the ad account, the CMS, the design tool). Note which this session can reach. Tools change the steps: a platform without threading changes the sequence step that threads replies; a CMS without a form builder moves the form step to a tool.

**Then the steps, one at a time.** For each step show:

```
Step 3 of 9 · Write the subject lines                      Who: Claude
Rule: under 45 characters, the offer in the first 25.     Source: Jessica Best, Copywriting
Check: two options per email, both within the limit.
Keep, change, or cut?
```

- **Keep:** move on.
- **Change:** ask what changes (the rule, who does it, the tool, the check), rewrite the step, show it back, and move on once confirmed.
- **Cut:** cut it, and ask for the reason in a few words. If the step is one the gate depends on (an output the gate checks, or a "You" pause before anything is sent, published or claimed), say which gate row it feeds and ask once more.
- **Add a step here:** the user can add a step after any step at any time.

Go briskly. If the user says "keep the rest", keep the remaining steps of that channel and move on. Show the specs table at the end of each channel and ask the same question once for the whole table, adjusting limits to the tools named (a platform's own character limits win over the starter's).

## 3. Write this campaign's version

For each channel, write `projects/campaigns/<slug>/workflows/<channel>.md` in the shape from the framework: `layer: campaign`, `campaign: <slug>`, `based_on` the layer it started from, `status: adjusted` (or `starter` if nothing changed, `suggested` if it came from the suggestion route and was not adjusted), `tools`, today's date. Fill the "Changes from the version it was based on" table with every change and cut and its reason. If the file exists, show the diff and ask before replacing it.

## 4. Save as your default?

For each channel that changed, ask once: **"Save this as your default <channel>, so your next campaign starts from it?"** On a yes, write it to `projects/campaign-engine/workflows/<channel>.md` with `layer: default`, keeping the changes table. If a default already exists, show the diff and ask before replacing it. Never in `example` mode.

## 5. Update the board and hand over

- Set the campaign's stage to `channels set` in `projects/campaigns/campaigns.md` (create the board from `frameworks/campaigns-board.md` if it is missing).
- A channel with no column in `projects/campaign-engine/quality-gate.md` will be scored with the closest column. Name the channel and the column, and suggest `/quality-gate <channel>` to give it its own.
- Summarise per channel: steps kept, changed, cut, added; the tools; whether it was saved as a default.
- **Next: `/campaign-draft <slug>`.**

## Rules

- Never write to `frameworks/workflows/`. The starters stay the reference.
- Every step keeps a source. A changed rule keeps the original source and adds "adjusted: <reason>". A new step cites "your team".
- Every "You" pause the user keeps becomes a stop in `/campaign-draft`. Do not add pauses they did not ask for; do not drop the ones they kept.
- No em dashes in any file this command writes.
