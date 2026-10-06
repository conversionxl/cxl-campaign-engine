---
description: Campaign Engine step 2. Turn a swimlane diagram you adjusted (a screenshot, an image file, or a description) into the workflow file the engine follows for that channel, or draw a new channel. Shows the diff before writing.
argument-hint: <channel> [path to screenshot or image]
---

# /workflow-update

Step 2 of the Campaign Engine. The six starter workflows in `projects/campaign-engine/workflows/` are a default. This command makes one match how your team works, from the swimlane you drew.

Read `frameworks/workflow-format.md` first (with the plugin and no local copy, `${CLAUDE_PLUGIN_ROOT}/frameworks/workflow-format.md`).

## Inputs

- **`<channel>`:** the slug of an existing workflow (`email-sequence`, `email-campaign`, `sales-enablement`, `landing-page`, `ad-tests`, `blog-post`) or a new one (`webinar`, `linkedin-organic`, `partner-email`, `direct-mail`). No argument: list the workflows in `projects/campaign-engine/workflows/` with their `status`, and ask which one.
- **The diagram:** an image path given as the second argument, an image dropped into the chat, or a description typed out ("I added a legal check after step 3 and cut the two subject lines to one"). Read the image with the Read tool. If no diagram is given, ask for one, and offer the description route.

## Steps

1. **Read the current workflow** for the channel if one exists. Summarise it in four lines: pulls in, steps, human pauses, outputs.
2. **Read the diagram.** Transcribe it into the four lanes (pulls in, Claude Code, the human roles, comes out) and the ordered steps. Where a sticky is ambiguous, say what you read and ask. Never invent a step the diagram does not show.
3. **Show the diff** as a table: `step | before | after | change (added / removed / moved / reworded)`. Also list spec changes (counts, limits, timing) and output changes. Flag anything that would break the gate: an output the quality gate expects that is now gone, a human pause removed before a send or a claim.
4. **Wait for confirmation.** Change nothing until the user says yes.
5. **Write the workflow file** in the format from `frameworks/workflow-format.md`: `status: adjusted`, `last_updated` today, `source` the image path or "description, <date>". Keep every spec the diagram did not change. For a new channel, start from the closest starter and say which.
6. **Update the gate if needed.** A new channel needs a column in `projects/campaign-engine/quality-gate.md`. Propose weights for every row (copy the closest channel's column and explain the changes), and add them only on a yes.
7. **Say what changed** in three lines, the file path, and that `/campaign-draft` will follow this version from now on.

## Rules

- The participant's workflow wins over the starter. If a step looks wrong to you, say so once, then write what they drew.
- Every human lane entry becomes a pause `/campaign-draft` stops at. Do not add pauses the diagram does not show; do not remove the ones it does.
- Specs live in the workflow. If the diagram carries a character limit or a count, it goes in the Specs table.
- Never write to `frameworks/workflows/`: those are the reference starters. Only `projects/campaign-engine/workflows/` changes.
