# projects/campaigns/

`campaigns.md` is the board: every campaign, its stage, KPI against target, and the next command. `/campaigns` shows and refreshes it. Then one folder per campaign, named by its slug, created by `/campaign-brief`.

```
projects/campaigns/<slug>/
  brief.md          decisions only, no copy; status moves draft → approved (Gate 1)
  workflows/        this campaign's step-by-step workflow per channel, from /campaign-channels
  drafts/           one file per channel, written by /campaign-draft from this campaign's workflow
  review.md         the quality gate's scorecard, written by /campaign-review (Gate 2)
  results.md        what it returned and the lesson, written by /campaigns close; the next brief reads it
```

A big-C plan is a campaign folder too. Its section 14 lists the programs it spawns; each becomes its own small-c folder here, with `parent:` in its frontmatter pointing back.

Campaign folders are committed. They hold decisions and copy, never customer lists or personal data; those stay in `raw/`.
