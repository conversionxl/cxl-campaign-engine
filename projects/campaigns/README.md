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

**Linked campaigns** (`frameworks/linked-campaigns.md`). Sub-campaigns live inside their main campaign; campaigns that run alongside each other keep their own folders and link both ways in their briefs.

```
projects/campaigns/
  cxl-ai-native-leader/              main campaign (big-C)
    brief.md
    campaigns/
      ai-native-sprint-nov26/        sub-campaign, parent: cxl-ai-native-leader
      webinar-series-nov26/          sub-campaign, links: feeds ai-native-sprint-nov26
  q4-partner-launch/                 stands alone
```

Two levels only. Slugs are unique across the board.

Campaign folders are committed. They hold decisions and copy, never customer lists or personal data; those stay in `raw/`.
