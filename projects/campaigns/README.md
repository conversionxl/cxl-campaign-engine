# projects/campaigns/

One folder per campaign, named by its slug. Created by `/campaign-brief`.

```
projects/campaigns/<slug>/
  brief.md          decisions only, no copy; status moves draft → approved (Gate 1) → running → closed
  drafts/           one file per channel, written by /campaign-draft from your workflow for that channel
  review.md         the quality gate's scorecard, written by /campaign-review (Gate 2)
  results.md        what it returned, added by you when it closes; the next brief reads it
```

A big-C plan is a campaign folder too. Its section 14 lists the programs it spawns; each becomes its own small-c folder here, with `parent:` in its frontmatter pointing back.

Campaign folders are committed. They hold decisions and copy, never customer lists or personal data; those stay in `raw/`.
