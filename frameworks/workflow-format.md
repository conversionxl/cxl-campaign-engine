---
type: framework
source: CXL Campaign Engine workshop. Starter steps come from the CXL course instructors and Tyler Durman, cited on each step.
used_by: /campaign-channels, /campaign-draft, /campaign-review
tags: [campaign-engine, workflow]
---

# Channel workflow format

Every channel the engine drafts follows a workflow: a numbered, step-by-step process. Each step says what happens, who does it, the rule it follows and where that rule comes from, and the check before moving on. `/campaign-channels` walks you through each step in the chat so you can keep, change or cut it for your campaign and your tools. `/campaign-draft` follows the result step by step. `/campaign-review` checks the drafts against it.

## Three layers

A workflow exists in up to three places. The engine always uses the most specific one it finds.

| Layer | Where | What it is | Who changes it |
|---|---|---|---|
| **Starter** | `frameworks/workflows/<channel>.md` | The plugin's template, built from the CXL courses and Tyler Durman's briefs. Same for everyone | Nobody. It is the reference |
| **Your default** | `projects/campaign-engine/workflows/<channel>.md` | Your team's version, saved after you adjusted a channel once and said "save as my default". Every new campaign starts from it instead of the starter | `/campaign-channels`, when you say yes to saving |
| **This campaign** | `projects/campaigns/<slug>/workflows/<channel>.md` | The version this campaign runs. Two campaigns can run different versions of the same channel | `/campaign-channels <slug>` |

So the first campaign starts from the starter, and you make your changes. Say yes to "save as my default", and the second campaign starts from your version: your step count, your tools, your approvals. You only adjust what is different about that campaign.

## The starters

The five channels the workshop promises, plus the two most campaigns need:

| Channel | Slug | Built from |
|---|---|---|
| Email campaign | `email-campaign` | Jessica Best, Email Marketing Fundamentals |
| Email sequence | `email-sequence` | Jessica Best; Tyler Durman's sequences |
| Blog post | `blog-post` | Andy Crestodina; Tycho Luijten |
| Social (LinkedIn posts and carousels) | `social-post` | Andy Crestodina; Tycho Luijten |
| Sales enablement | `sales-enablement` | Tyler Durman; Kyle Bastien |
| Landing page | `landing-page` | CXL landing page optimization course |
| Ad tests | `ad-tests` | CXL LinkedIn ads course; Nick Christensen's ad scoring |

**Any other channel** (a webinar, a partner email, direct mail, a podcast guest spot): `/campaign-channels` offers two routes. **Your steps:** you type your process, one step per line, and it formats them into this shape, asking who does each and what the check is. **A suggestion:** it drafts the steps from the closest starter and marks the file `status: suggested` until you have been through it once.

## The file

```markdown
---
type: workflow
channel: <slug>
layer: starter | default | campaign
campaign: <slug>                 # campaign layer only
based_on: <path of the file it was copied from>
status: starter | suggested | adjusted
tools: []                        # the tools this version uses, e.g. [HubSpot, Canva]
last_updated: ""
tags: [campaign-engine, workflow]
---

# <Channel name>

One line on what this channel produces and when a campaign uses it.

## Pulls in
- The brief: sections used
- The brand brain: files used (if present)
- Other inputs: files in raw/, connected tools

## Steps

| # | Step | Who | Rule | Source | Check before moving on |
|---|---|---|---|---|---|
| 1 | ... | Claude | ... | Best, Copywriting | ... |
| 2 | ... | You (pause) | ... | Tyler Durman | ... |

## Specs
Counts, character limits, formats. Checked by /campaign-review.

| Element | Spec | Source |
|---|---|---|

## Outputs
The files this workflow writes, under `projects/campaigns/<slug>/drafts/`.

## Changes from the version it was based on
| Step | Change | Why |
```

## Rules

- **Who is one of three things.** `Claude` (the engine does it), `You` or a named role such as `Sales lead` (a person decides; the engine stops and waits), or a tool such as `HubSpot` (a person does it in that tool, outside the engine; the draft notes what to load where).
- **Every step has a rule and a source.** A starter step that cannot name its source is not in the starter. A step you add cites "your team" and the reason you gave.
- **Every "You" step is a real decision.** If the marketer would only glance at it, cut the pause.
- **Specs live here, not in the brief.** The gate checks drafts against them.
- **The outputs list is the contract.** The gate fails a draft that is missing an output the workflow names.
- **The changes table is how the next campaign learns.** Every keep, change or cut in `/campaign-channels` with its reason is recorded, so a teammate can see why your version differs from the starter.
