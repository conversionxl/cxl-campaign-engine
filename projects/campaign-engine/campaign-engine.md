---
type: project
status: active
priority: P1
cadence: weekly
next_action: "Fill raw/campaigns/ using the checklist below, then run /campaign-brief example to see the engine on Acme Deals before the workshop"
tags: [campaign-engine, ai-native, campaigns]
---

# Campaign Engine

## Overview
A campaign engine with a human at both gates. You write or adjust a brief with Claude and approve it (Gate 1). You pick the channels and adjust each one's step-by-step workflow in the chat. Claude drafts every channel by following your version, pausing wherever a person decides. A weighted quality gate scores every draft against the brief and your criteria, and you accept or fix what it flags (Gate 2). Built in the Campaign Engine workshop of the CXL AI Native Marketer cohort, then run at home on real campaigns.

The engine:
- **The brief** (`frameworks/campaign-brief-template.md`): nine sections every campaign fills, six more for a big-C plan. Decisions only, no copy.
- **Your channel workflows:** seven starters built from CXL courses and Tyler Durman's briefs (`frameworks/workflows/`). Each campaign gets its own adjusted copy; the ones you save as defaults live in `workflows/` here, so the next campaign starts from your version.
- **Your quality gate** (`quality-gate.md`): criteria down the side, channels across the top, a weight per cell, a threshold. Tuned in the workshop to the campaigns you run.
- **Your campaigns** (`../campaigns/<slug>/`): brief, workflows, drafts, review, results. `../campaigns/campaigns.md` is the board for all of them; `/campaigns` shows it.

## Goals
- Run one real small-c campaign end to end: brief approved, drafts for every channel, a review report, and the drafts loaded by a human. That is the Demo Day assignment.
- At least one channel saved as your default in `workflows/`: it matches how your team works, not the starter.
- The quality gate has at least one criterion and one weight you changed, for a reason you can say out loud.
- The next brief you write starts from `raw/campaigns/`, not from a blank page.

## Before the workshop

Fill the inputs. Each takes a few minutes and the engine is only as good as they are.

- [ ] **Past briefs.** Two or three briefs or campaign plans you have written, in `raw/campaigns/past-briefs/`. Any format; a Google Doc link also works if Drive is connected.
- [ ] **Results.** What the last campaign to this audience returned, by channel, in `raw/campaigns/results/`. Even a few numbers.
- [ ] **Sales feedback.** What sales or the SDRs said about the leads, in `raw/campaigns/`. Reply emails and retro notes count.
- [ ] **Calendar.** Launches, events and blackout dates for the next quarter, in `raw/campaigns/calendar.md`.
- [ ] **Connections.** Which of these can Claude reach in your setup: CRM (HubSpot, Salesforce, Pipedrive), email (Customer.io, Klaviyo, Mailchimp), ads (LinkedIn, Google, Meta), analytics (GA4), docs (Drive, Notion, ClickUp), Slack. Connect what you can in Customize, then Connectors. None is required.
- [ ] **Brand brain.** If you did the Marketing Brain workshop, `wiki/brand/` should have `status: draft` or `final` on all four files. If not, the brief collects the minimum itself.
- [ ] **The campaign you will run.** Pick one real small-c campaign for the session: one goal, one offer, two or three channels. Bring the number it has to hit.
- [ ] **A dry run.** `/campaign-brief example`, then `/campaign-channels example-agency-upgrade`, `/campaign-draft example-agency-upgrade`, `/campaign-review example-agency-upgrade`, and `/campaigns` to see the board. Fifteen minutes, and you will know the shape of every file.

**Agencies:** bring your own agency's campaign or the Acme example, not a client's. `raw/campaigns/` stays on your machine, but your screen does not.

## In the session (90 minutes)

| Time | Block | Hands-on |
|---|---|---|
| 0:00 | Why briefs break, and two kinds of campaign (Tyler) | |
| 0:10 | Get the engine running: setup, example run | |
| 0:25 | Write or adjust your brief with `/campaign-brief`, approve it | Yes |
| 0:40 | Pick your channels and adjust their steps with `/campaign-channels` | Yes |
| 0:55 | Tune the gate with `/quality-gate`: your criteria, your channels, your weights | Yes |
| 1:05 | `/campaign-draft`, then `/campaign-review`: read the scorecard, fix one draft; `/campaigns` to see it on the board | Yes |
| 1:25 | Share-outs, Demo Day assignment | |

## Current status
As of 2026-10-06: module built from the workshop deck and Tyler Durman's briefs; not yet run on a real campaign.

## Key people
- Tyler Durman: brief structure, sales enablement process, the missed-campaign lesson (the HR tech example stays unnamed)
- Hesh Fekry (CXL): the engine, the commands, the workshop

## Open tasks
- [ ] Run the Acme example end to end
- [ ] Bring one real campaign to the session

## Decisions
- 2026-10-06: The brief holds decisions only. Copy moves to drafts. Specs move to workflows.
- 2026-10-06: The engine reads the brand brain but never writes to it, so the two modules stack without depending on each other.
- 2026-10-06 (0.2.0): No Miro block. Channels are adjusted step by step in the chat. Workflows live per campaign, with an optional saved default per channel. One board tracks every campaign.

## Links and sources
- `frameworks/campaign-brief-template.md`, `frameworks/workflow-format.md`, `frameworks/quality-gate.md`, `frameworks/campaign-inputs.md`, `frameworks/decision-models.md`
- Related: [[marketing-brain]] (if installed)
