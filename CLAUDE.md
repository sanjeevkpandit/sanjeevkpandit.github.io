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

Hugo v0.160.1 is required. The `deploy.sh` script enforces this version check before building.

## Deployment

Pushing to the `dev` branch triggers GitHub Actions (`.github/workflows/deploy.yml`), which builds the site and pushes the generated `public/` output to the `master` branch. The live site is served from `master`.

Do **not** manually edit the `public/` directory — it is a git submodule tracking the `master` branch of this same repo and is managed entirely by CI.

## Architecture

This is a [Hugo](https://gohugo.io/) static site using the **hugo-coder** theme (active), with `hugo-theme-jane` also present as a submodule but unused.

- `config.toml` — site configuration, theme selection, social links, nav menu
- `content/` — Markdown source files; `about.md` (About page) and `posts/` (blog posts)
- `static/` — static assets (images, favicons)
- `i18n/en.toml` — UI string translations
- `themes/hugo-coder/` — git submodule; do not modify directly
- `archetypes/` — templates for `hugo new` content creation

To create a new blog post: `hugo new posts/my-post.md`

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

## TIL Workflow

Use the `/til` skill in Claude Code or Claude Desktop to publish a Today I Learned post.

The skill handles: prompting for content → creating `content/posts/YYYY-MM-DD-slug.md` → local preview via `hugo server` → commit and push to `dev` on confirmation.

TIL posts are regular posts tagged with `til`. All posts live in `content/posts/`. The `/tags/til/` page on the site lists all TILs.
