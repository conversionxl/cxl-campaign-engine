---
description: Campaign Engine step 2. Pick the channels this campaign needs, then walk each channel's workflow step by step in the chat and adjust it to your campaign and your tools. Writes this campaign's own version of each workflow, and offers to save it as your default.
argument-hint: <campaign slug> [channel ...]
---

# /campaign-channels

Step 2 of the Campaign Engine. Every channel is a numbered, step-by-step workflow built from the CXL courses and Tyler Durman's briefs. This command shows each one, a step at a time, and turns it into the version this campaign runs.

**Keep it short.** Follow "Keep it short" in the `campaign-engine` skill for every reply and file: answer first, eight lines at most, one question at a time, detail in the file.

Read `frameworks/workflow-format.md` first (with the plugin and no local copy, `${CLAUDE_PLUGIN_ROOT}/frameworks/workflow-format.md`). It defines the three layers, the file shape and the rules.

## Mode

- **`<slug>`:** `projects/campaigns/<slug>/brief.md` must exist with `status: approved`. If it is a draft, say so and point to `/campaign-brief <slug>`. No slug: read `projects/campaigns/campaigns.md`, list the approved campaigns, and ask which one.
- **`example-agency-upgrade`** (or `example`): the Acme campaign. Pick the channels from its brief, walk one channel (the email sequence) in full as a demonstration with the example answers, and copy the rest unchanged. Never save an example workflow as a default.
- **Channels named as arguments:** skip step 1 and go straight to those.

## 1. Pick the channels

Show one table: each starter in `frameworks/workflows/`, whether the user has a default for it in `projects/campaign-engine/workflows/`, and whether this campaign already has its own copy. Mark the channels the brief lists in its `channels` field.

Ask which channels this campaign needs. Suggest from the brief: the KPI and the stage decide (a meetings goal almost always needs a sequence and sales enablement; a problem-unaware audience needs content before an offer; every CTA needs a destination, so usually a landing page: one per offer, two at most). Say why in one line each. Then ask: **any channel that is not in the list?**

For each extra channel, offer two routes and wait for the choice:
- **Your steps.** "Type your process, one step per line, in the order you do it." Then ask, per step: who does it (Claude, you or a named role, or a tool), and what the check is before moving on. Format it as a workflow, `status: adjusted`, source "your team".
- **A suggestion.** Draft the steps from the closest starter, adapting each rule to the channel and keeping its source where it still applies; mark rules with no source as (suggested). Save with `status: suggested`, then walk it in step 2 like any other.

Update the brief's `channels` field to match the final list, and say so.

## 2. Walk each channel, step by step

For each channel, in the order the campaign will use them. Start from the most specific layer that exists: the campaign's own copy if this is a re-run, else the user's default, else the starter. Say which one in one line.

**First, the tools.** One question per channel, with choices where you can guess them: "Which tool sends these emails? 1 Customer.io · 2 HubSpot · 3 Mailchimp · 4 Other". Note which this session can reach. A tool can change a step (no threading in the email tool, no form builder in the CMS); say so in the list below.

**Then the whole channel at once, as a short list.** One line per step: number, what happens in plain words, who does it. No rules, sources or checks in the list.

```
Email sequence: 14 steps

 1  Pick what starts the sequence (a form fill, a download)      Claude
 2  Check the contact lands in one place, your CRM                 You
 3  Have the emails ready before the form goes live                You
 4  Check the form only asks for what you need                     Claude
 5  Plan 4 emails: give, help, help, ask                           Claude
 ...
14  Measure meetings booked, not opens                             Claude

Anything to change or skip? Reply with step numbers (for example "3, 9"), or "looks good".
```

- **"Looks good":** keep every step and move to the next channel.
- **Step numbers:** take them one at a time. For each, show the step in three short lines and one question:

  ```
  Step 9: Line it up with the sales team's calls
  Why it's here: sales calls and emails land on the same days, so they back each other up (Jessica Best).
  Do you want to 1 keep it · 2 change it · 3 skip it?
  ```

  - **2 Change it:** ask "What should it say instead?", rewrite the step in their words, show the new line, move on.
  - **3 Skip it:** skip it and ask for a reason in a few words. If the step feeds the review or is a human check before anything is sent, published or claimed, say so in one line ("Without this, the review can't check the timing") and ask "Skip anyway? 1 Yes · 2 Keep it".
- **"Add a step after 6":** ask what happens and who does it, add it, show the new line.
- **Plain words.** Write every step and every question as a marketer would say it. The rule, its source and the check stay in the workflow file, not in the chat. Quote an instructor only in the "Why it's here" line, in a few words.

The character limits and counts (the Specs table) are not walked step by step: say "Limits are set to Jessica Best's defaults (subject under 45 characters, and so on). Your tool's limits win where they differ", adjust them to the tool, and move on.

## 3. Write this campaign's version

For each channel, write `projects/campaigns/<slug>/workflows/<channel>.md` in the shape from the framework: `layer: campaign`, `campaign: <slug>`, `based_on` the layer it started from, `status: adjusted` (or `starter` if nothing changed, `suggested` if it came from the suggestion route and was not adjusted), `tools`, today's date. Fill the "Changes from the version it was based on" table with every change and cut and its reason. If the file exists, show the diff and ask before replacing it.

## 4. Save as your default?

For each channel that changed, ask once: **"Save this as your default <channel>, so your next campaign starts from it?"** On a yes, write it to `projects/campaign-engine/workflows/<channel>.md` with `layer: default`, keeping the changes table. If a default already exists, show the diff and ask before replacing it. Never in `example` mode.

## 5. Update the board and hand over

**Campaign page.** If the brief's `page:` is set (not `none`), update the Channels tab and the header as `frameworks/campaign-page.md` says, without asking, and end your reply with the link.


- Set the campaign's stage to `channels set` in `projects/campaigns/campaigns.md` (create the board from `frameworks/campaigns-board.md` if it is missing).
- A channel with no column in `projects/campaign-engine/quality-gate.md` will be scored with the closest column. Name the channel and the column, and suggest `/quality-gate <channel>` to give it its own.
- Summarise per channel: steps kept, changed, cut, added; the tools; whether it was saved as a default.
- **Next step:** `/campaign-engine:campaign-draft <slug>` (in `example` mode, `example`) drafts every channel by following these steps. Ask **"Run it now?"**

## Rules

- Never write to `frameworks/workflows/`. The starters stay the reference.
- Every step keeps a source. A changed rule keeps the original source and adds "adjusted: <reason>". A new step cites "your team".
- Every "You" pause the user keeps becomes a stop in `/campaign-draft`. Do not add pauses they did not ask for; do not drop the ones they kept.
- No em dashes in any file this command writes.
