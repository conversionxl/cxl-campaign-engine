# Campaign to-dos: grouped, and linked to your tasks

`projects/campaigns/<slug>/todos.md` holds everything a person still has to do. The To-dos tab is built from it. `/campaign-brief`, `/campaign-channels` and `/campaign-draft` keep it current.

## How it is grouped

Three levels, so anyone can find their work in seconds:

1. **Area:** who works on it. Use the areas this campaign needs, such as Tech, Paid, Email and social, Webinars, Sales, Product. Three to six is usually right. Never one area per channel by habit: a page, a checkout and a tracking fix are all Tech.
2. **Bigger task:** a piece of work with several to-dos inside it, such as "Paid plan questions" or "Webinar setup". Any to-dos that finish the same thing, or one person's list of open questions, share a bigger task.
3. **To-do:** one thing one owner can finish. A to-do that stands alone sits directly under its area, with no bigger task.

```markdown
## Paid

### Paid plan questions · [task](https://example.com/task/123)

| To-do | Owner | Due | Done when | Task |
|---|---|---|---|---|
| Answer the 10 questions on the plan | Bruno | 5 Nov | All 10 answered | [Open](https://example.com/task/124) |
```

Rules:
- **Columns:** to-do, owner, due, done when, task. No Channel column: the area says it.
- **In date order** inside each bigger task. Areas run in the order the work has to happen.
- **One line per to-do.** If it has "then" in it, it is two to-dos.
- **A vague date gets a real one** when it can: "before the first send" becomes that send's date, and "before each session" becomes one to-do per session. Keep "when received" as words, and leave the date empty.
- **Finished to-dos leave the file** and close in the task tool.
- **Channel steps at launch** (the `### Launch tasks` in each draft) go in a closed fold at the bottom of the tab, by area. They are checks while a channel goes live, not tasks to track one by one.

## Task cards follow the brief

A task card is specced from the brief, in the brief's own structure, so anyone who opens it knows what it is for without opening the campaign.

- **The main task** carries the At a glance block: goal, who, offer and CTA, why take it now, why us, point of view, key message, channels. Then key dates, constraints and a link to the campaign page.
- **Each bigger task** uses the same fields in the same order, scoped to its piece of the work: area, goal, who, offer and CTA, key message, key dates, constraints, done when, brief. Leave out a field that doesn't apply.
- **Each subtask** holds its done when, plus one line of context if it needs it.
- **Copy from the brief, don't write anew.** A field the brief doesn't answer stays out. Copy still lives in the drafts, not on the card.

## Task platform: ask once

The first time a campaign writes `todos.md`, settle where its tasks live. Record the answer in the brief's `tasks:` line (a link, or `none`) and never ask again for this campaign.

1. **Look at which tools this session can call.** Work management means ClickUp, Asana, Notion, Linear, Jira, Trello, Monday and the like.
2. **One is connected:** name it, then ask one question: "Do you already have tasks for this campaign, do you want me to create them, or should the to-dos stay on the campaign page?"
   - **They have tasks:** ask for the link to the main task or list, read it, and match each to-do to a task. Link the matches. Show what has no match and offer to create it.
   - **They want tasks:** ask which list or parent task to use. Show the plan first (areas, bigger tasks, to-dos, owners, dates), and create only on their yes.
   - **Stay on the page:** set `tasks: none` and leave the Task column out.
3. **None is connected:** ask which tool they manage work in. Say how to connect it (`frameworks/campaign-inputs.md`, section 4), then offer to carry on with the to-dos on the campaign page. Never assume a platform, and never require one.

When creating tasks:
- **Mirror the groups.** A bigger task becomes a task with subtasks. Reuse an existing task when one already covers the work, rather than making a duplicate.
- **Put "Done when" in the task description**, so the task stands on its own.
- **Someone can't be assigned** (they aren't in the tool, or lack access to the list): give the task to the person working with them, and name the real owner in the task's title or description. Tell the user.
- **Say who gets notified.** Assigning people notifies them, so the plan you show names them.
- **Create and link only.** Never close, move, reassign or delete a task the user didn't ask you to.
