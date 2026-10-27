---
name: keep-it-compact
description: Guardrails that keep every campaign file and campaign page short and on the base template. Apply automatically whenever the engine writes or updates a brief, workflow, draft, review, results file, the campaigns board, or a campaign page, and whenever the user asks for a change to any of them. Before adding anything the base template does not have (a tab, a section, a header line, a badge, a note), ask the user first.
---

# Keep it compact

Every campaign file and page gets longer as you iterate unless something stops it. This is that something. It applies on every run, not only the first.

## 1. The base template is fixed

**Campaign page:** these tabs, in this order, and no others: **Brief, Touchpoints, Content, Workflow, Results**, plus **Linked** only when the campaign has a main campaign, sub-campaigns or links. A page built before 0.12.0 (Brief, Channels, Review, Results) is rebuilt on these tabs at its next update. Template: `frameworks/campaign-page-template.html`.

**Header, at most three lines under the title:**
1. The campaign name with its scale badge.
2. One line: the KPI and progress, the dates, and (when linked) "Part of: <main>". Nothing else.
3. The stage bar with its label.

No other badges, counts, notes or to-dos above the tabs. A to-do goes at the top of the tab it belongs to, in one line.

**Files:** the sections in `frameworks/campaign-brief-template.md` and in each workflow's Outputs list. Nothing else.

## 2. Ask before adding anything outside it

A new tab, section, header line, badge, file, or a block that is not in the template: **ask first**, in one line, and wait.

> "That would add a <Social proof tab> to the page, outside the base template. 1 Add it · 2 Put it in <Content, as one fold> · 3 Skip"

Record a yes in the brief's frontmatter as `page_extras: [social-proof]`, so it is not asked again. Never add an extra because it seemed useful.

## 3. Budgets

Visible words, not counting starter prompts and tooltips. Over budget by more than 10%: cut the least useful lines, once, and check once more. Up to 10% over, or still over after one cut: publish and say by how much in one line. Never trim and re-check in a loop. Never shrink the font to fit.

| Where | Budget |
|---|---|
| Page header (title to tabs) | 40 words |
| Brief tab | 800 words |
| Touchpoints tab | 400 words |
| A channel sub-tab (Content or Workflow) | 3,500 words, of which notes and plans 200 |
| One piece (an email, a post, a page edit) | the copy, plus 2 lines of notes at most |
| Review summary (top of Content) | 300 words: the top three fixes and the scores table; the full list folded below the channels |
| Results tab | 400 words |
| Linked tab | 300 words |
| `brief.md` | 900 words before `## Sources` (`## Evidence` in briefs before 0.10.0) |
| `review.md` | 800 words |
| Landing pages | one per offer, two at most |

## 4. Change in place

- **Replace, never append.** A change rewrites the line it changes. No "(changed)", "new 11 Oct", "v2" or "updated" labels on the page or in a file: git keeps the history.
- **No changelog on the page.** A log of what changed goes in the commit message or the daily log.
- **One fact, one place.** If a fact is on the Brief tab, other tabs link to it; they do not repeat it.
- **Pages, notes and drafts for a linked campaign stay in that campaign.** This campaign gets one line pointing to it.

## 5. Check before every publish

Run `bash "${CLAUDE_PLUGIN_ROOT}/plugin/page-check.sh" <page.html>` (and on `brief.md` and `review.md`). Fix every FLAG, or ask the user about it, before you publish. Say in one line what you cut.

No em dashes.
