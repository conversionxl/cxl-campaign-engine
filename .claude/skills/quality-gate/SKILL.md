---
name: quality-gate
description: How to score a campaign brief or draft with the Campaign Engine's weighted quality gate (criteria × channel × weight) and how to tune the gate. Apply automatically whenever asked to review, score, QA, check or approve campaign copy, a brief, an email, a sequence, an ad, a landing page or enablement material in this repo, and whenever /campaign-review or /quality-gate runs.
---

# Quality gate

A gate that passes everything is not a gate. This one fails loudly on the failures that sank real campaigns, and it belongs to the user: `projects/campaign-engine/quality-gate.md` is the authority, `frameworks/quality-gate.md` is the default it started from.

## Which gate

Gate 1 checks a brief: pass or fail, every row, before approval. Gate 2 scores a draft: 0, 1 or 2 per row, weighted by channel, routed to SHIP, REVIEW or FIX. Read the row definitions and the weights from the user's file every time; never from memory. If the user's file is missing, use the default and say so.

## Scoring a draft

1. **Load the brief first.** The KPI action, the CTA, the angles and their proof status, the buyer's thought, the exclusions, the handoff rule. Without the brief there is nothing to score against; say so and stop.
2. **Load the workflow** for the channel: its Outputs and Specs. Missing outputs and spec breaches are the Workflow row.
3. **Load the brand brain** (or the example brain). Voice, vocabulary, proof points, their words.
4. **Score every row with a weight above 0** for this channel. Quote the line that earned the score in the note. A score without a quoted line is a guess.
5. **Arithmetic:** weighted = sum(score × weight) ÷ sum(2 × weight). Route by the thresholds in the file. A 0 on a non-negotiable row (marked \*) is FIX regardless.
6. **Propose a fix for every 0 and 1**, in the brand's voice, from the brief's proof. Fidelity fails are cut or cited, never softened. Goal fails get the ask attached where the asset is.

## The rows that need judgment

- **Goal.** Trace each CTA to the KPI action. The HR tech lesson: 17 downloads, 0 meetings, because nothing asked for the meeting.
- **Fidelity.** Inventory every number, customer, quote and case study. Each is in the brief or the brain, or the row is 0. "Trusted by 2,000+ agencies" with no source is a 0, not a 1.
- **Stage.** Problem-unaware readers get the problem; consideration gets differentiation and third-party proof; implementation gets de-risking. Copy that pitches the product to the unaware fails.
- **Voice.** Always and Never lines, banned words, the buyer's words, and the AI tells: em dashes, "it's not X, it's Y", triplets of adjectives, "unlock", "seamless", "game-changing".
- **Consistency.** Lay the headline, offer and CTA of every draft side by side before scoring any one of them.
- **Differentiation.** Ask: could the nearest competitor run this unchanged? If yes, 0 or 1.

## Tuning the gate

The weights are an opinion to be corrected by the user's misses. Add a row when a readout shows a failure the gate had no row for, and cite the readout. Raise to 3 or non-negotiable the row that would have stopped the last miss. Cut or lower a row the user overrules every time. Add a column per channel they run. Record every change in the Changes table with the reason in their words. Three overrules of one row across campaigns is a weight problem, not a draft problem.

## Decision models

The gate can be written as a Jev or Clef question set (`frameworks/decision-models.md`): one typed question per row, weights and thresholds in code. The model answers the questions; it never decides the route and never explains. Treat its output as a second opinion to show next to the scored sheet, and calibrate it on 20 to 30 labelled past drafts before trusting it. Never let it auto-approve a send, a publish or a budget.

## Always

- The human decides. Report the route, propose the fix, wait.
- Log overrules with reasons.
- No em dashes, in the review or in any fix you write.
