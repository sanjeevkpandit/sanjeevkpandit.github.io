---
name: til
description: Publish a Today I Learned post to the blog. Prompts for what was learned, creates the post, opens a local preview, then commits and pushes on confirmation.
---

# TIL Publisher

Publish a Today I Learned post to `content/posts/`. Follow these steps in order without skipping any.

## Step 1: What did you learn?

Ask the user: "What did you learn today?"

Use their answer as the basis for the title and description.

## Step 2: Extra tags

Ask the user: "Any extra tags? (comma-separated, or press enter to skip — e.g. javascript, career, tools)"

`til` is always included. Their answer adds to it.

## Step 3: Create the file

Derive from the user's input:
- **date**: today's date in YYYY-MM-DD format (use the `date` command: `date +%Y-%m-%d`)
- **slug**: lowercase words joined by hyphens, max 6 words, no "til" prefix (e.g. `redis-setnx-deprecated`)
- **title**: `"TIL: "` + user's answer in sentence case
- **description**: user's answer trimmed to one sentence, ending with a period
- **tags**: always includes `"til"` plus any extra tags provided (lowercase, hyphenated, no spaces)
- **filename**: `content/posts/<date>-<slug>.md`

Write the file with this structure:

```yaml
---
title: "TIL: <title>"
date: <YYYY-MM-DD>
tags: ["til"<, "extra-tag">]
description: "<description>"
---

<Expand the user's answer into 1–3 short paragraphs if they gave enough detail. If their answer was brief, use it as-is. Do not pad it.>
```

## Step 4: Preview

Run `hugo server` in the background (use `run_in_background=true` in the Bash tool).

Tell the user:

> Preview at **http://localhost:1313/posts/<date>-<slug>/** — say **publish** when ready, or **cancel** to discard.

## Step 5: Publish or cancel

Wait for the user's response.

**On publish (or any affirmative — "yes", "looks good", "ship it", etc.):**

1. Stop the server:
   ```bash
   pkill -f "hugo server"
   ```
2. Commit and push:
   ```bash
   git add content/posts/<filename>.md
   git commit -m "TIL: <slug with hyphens replaced by spaces>"
   git push origin dev
   ```
3. Tell the user: "Done. GitHub Actions will deploy in about a minute."

**On cancel (or any negative — "no", "cancel", "discard", etc.):**

1. Stop the server:
   ```bash
   pkill -f "hugo server"
   ```
2. Delete the file:
   ```bash
   rm content/posts/<filename>.md
   ```
3. Tell the user: "Cancelled. File deleted."
