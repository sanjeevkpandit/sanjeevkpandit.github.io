# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Serve locally with live reload
hugo server

# Build the site
hugo

# Build with minification (as done in CI)
hugo --minify
```

## Deployment

Pushing to `dev` triggers GitHub Actions (`.github/workflows/deploy.yml`), which:
1. Builds the site with `hugo --minify`
2. Deploys via `actions/deploy-pages` to GitHub Pages (live at sanjeevkpandit.com.np)
3. Syncs the build to the `master` branch as a reference copy

Do **not** push content changes (posts, TILs) directly to `dev`. Open a PR instead. See Content Workflow below.

## Architecture

Hugo static site using the **PaperMod** theme (`themes/PaperMod/` git submodule).

- `config.toml` — site config, theme, social icons, nav menu, Google Analytics
- `content/posts/` — all blog posts and TIL entries (Markdown, YAML front matter)
- `content/about.md` — About page
- `static/` — static assets (images, CNAME)
- `archetypes/default.md` — template for new posts
- `themes/PaperMod/` — theme submodule; do not modify directly

To create a new post manually: `hugo new posts/YYYY-MM-DD-my-title.md`

## Content Workflow

All posts and TIL entries must go through a PR, not a direct push to `dev`.

**TIL posts:**
- Use the `/til` skill in Claude Code or Claude Desktop
- The skill creates a `til/<date>-<slug>` branch, opens a preview, then raises a PR against `dev` on confirmation

**Longer posts:**
- Create a branch: `post/<slug>`
- Write the post in `content/posts/YYYY-MM-DD-slug.md`
- Open a PR against `dev`

**Front matter format (all posts):**
```yaml
---
title: "Post title"
date: YYYY-MM-DD
tags: ["tag1", "tag2"]
description: "One sentence summary."
---
```

TIL posts always include `"til"` in tags. The `/tags/til/` page lists all TILs.

## Conversation/Writing style

### Do

- Use clear, simple language
- Be spartan and informative
- Use short, impactful sentences
- Use active voice
- Focus on practical, actionable insights
- Use bullet point lists in social media posts
- Use data and examples to support claims when possible
- Use "you" and "your" to directly address the reader

### Do Not

- Use em dashes anywhere. Use commas, periods, or other standard punctuation instead
- Use constructions like "not just this, but also this"
- Use metaphors or cliches
- Make generalizations
- Use setup language like "in conclusion", "in closing", or similar
- Add output warnings or notes. Provide the requested output only
- Use unnecessary adjectives or adverbs
- Use rhetorical questions
- Start sentences with conjunctions
- Use hashtags
- Use semicolons
- Use markdown formatting (in written content output)
- Use asterisks (in written content output)
- Use passive voice

### Self-Check

Review every response before sending. Confirm zero em dashes, zero asterisks, and proper punctuation. Make sure the response is direct, precise, free of any unnecessary embellishments, no sugar-coating, no extra stuffs, no overwhelming tone.
