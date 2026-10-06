---
type: framework
source: CXL Campaign Engine workshop. The swimlane format follows the AI Workflow Redesign workshop boards.
used_by: /workflow-update, /campaign-draft, /campaign-review
tags: [campaign-engine, workflow, swimlane]
---

# Channel workflow format

Every channel the engine can draft is a workflow file in `projects/campaign-engine/workflows/<channel>.md`. The six starters ship in `frameworks/workflows/` and are copied there by setup. `/workflow-update` rewrites one from a swimlane diagram you adjusted. `/campaign-draft` follows it step by step. `/campaign-review` checks that every output the workflow names exists and stays inside its specs.

**The workflow is the participant's, not the plugin's.** The starters are a sensible default. The exercise is to make them match how your team works: cut steps, add approvals, change outputs, add a channel.

## The swimlane

Each channel is one swimlane diagram with four lanes, read left to right:

| Lane | Holds |
|---|---|
| **Pulls in** | What the step reads: the brief, the brand brain, a file in `raw/`, a connected tool |
| **Claude Code** | What Claude does with it |
| **Marketer** (or a named role: sales lead, campaign owner, designer) | What a human checks, decides or approves. One lane per human role |
| **Comes out** | The file, spec or message the step produces |

Each column is a step. A human lane entry is a pause: `/campaign-draft` stops there, shows the work, and waits.

## The file

```markdown
---
type: workflow
channel: <slug, same as the file name>
status: starter | adjusted         # adjusted once /workflow-update has rewritten it
last_updated: ""
source: starter | <path of the screenshot or description it was built from>
tags: [campaign-engine, workflow]
---

# <Channel name>

One line on what this channel produces and when a campaign uses it.

## Pulls in
- The brief: sections used
- The brand brain: files used (if present)
- Other inputs: files in raw/, connected tools

## Steps

| # | Lane | Step | Comes out |
|---|---|---|---|
| 1 | Claude Code | ... | ... |
| 2 | Marketer | Checks ... (pause) | approval or changes |

## Specs
Character limits, counts, formats, required elements. Checked by /campaign-review.

| Element | Spec |
|---|---|
| | |

## Outputs
The files this workflow writes, under `projects/campaigns/<slug>/drafts/`.

## Review criteria that weigh most for this channel
Optional: the rows in `projects/campaign-engine/quality-gate.md` that this channel weights 3.
```

## Rules

- **Steps are concrete.** "Writes four emails, each carrying one angle from the brief" beats "writes the sequence".
- **Every human lane entry is a real decision.** If the marketer would only glance at it, cut the pause.
- **Specs live here, not in the brief.** The same character limits used to be retyped in every brief; now they live once, per channel.
- **The outputs list is the contract.** The gate fails a draft that is missing an output the workflow names.
- **Adjusted beats starter.** When your workflow and the starter disagree, yours wins. `/workflow-update` shows the diff before it writes.
