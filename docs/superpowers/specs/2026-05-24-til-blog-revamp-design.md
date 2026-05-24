# Design: TIL Blog Revamp

**Date:** 2026-05-24
**Status:** Approved

## Goal

Revive sanjeevkpandit.com.np as an active blog. Introduce a frictionless TIL (Today I Learned) publishing workflow so content gets published continuously. Longer posts coexist under the same structure. Zero additional infrastructure cost.

---

## 1. Cleanup

Remove dead weight before building anything new.

- Remove `themes/jane` and `themes/hugo-theme-jane` git submodules (unused theme)
- Remove `public/` git submodule (legacy from manual deploy era; GitHub Actions handles deployment)
- Remove `deploy.sh` (replaced by GitHub Actions)
- Rewrite `content/about.md` (current content is 6+ years outdated)

None of these affect the live site or the deployment pipeline.

---

## 2. Theme: PaperMod

Replace `hugo-coder` with [PaperMod](https://github.com/adityatelange/hugo-PaperMod).

- Add as a git submodule at `themes/PaperMod`
- Color scheme: `auto` (follows system preference, defaults toward dark)
- Update `config.toml` to set `theme = "PaperMod"` and configure PaperMod params

Key PaperMod config params:

```toml
[params]
  defaultTheme = "auto"
  ShowReadingTime = true
  ShowPostNavLinks = true
  ShowBreadCrumbs = false
  ShowCodeCopyButtons = true
  ShowTags = true
  ShowRssButtonInSectionTermList = true
```

---

## 3. Content Structure

All posts live under `content/posts/`. No separate `/til/` section.

TIL posts are differentiated by the `til` tag. PaperMod auto-generates `/tags/til/` as a browsable index.

**TIL front matter:**

```yaml
---
title: "TIL: <what you learned>"
date: YYYY-MM-DD
tags: ["til", "<topic>"]
description: "<one sentence summary>"
---
```

**Regular post front matter:**

```yaml
---
title: "<post title>"
date: YYYY-MM-DD
tags: ["<topic>", "<topic>"]
description: "<one sentence summary>"
---
```

Rules enforced at creation time:
- `description` is always required
- TIL posts always have `til` as a tag
- Filename convention: `YYYY-MM-DD-<slug>.md` (flat, no subdirectory for TILs)

Update `archetypes/default.md` to use YAML front matter aligned to PaperMod.

---

## 4. TIL Skill (`/til`)

A Claude Code skill that makes publishing a TIL take under two minutes.

**Flow:**

1. Invoke `/til` in Claude Code or Claude Desktop
2. Skill asks: what did you learn? (freeform, one sentence or a few words is enough)
3. Skill asks: any tags beyond `til`? (optional)
4. Skill creates `content/posts/YYYY-MM-DD-<slug>.md` with complete front matter
5. Skill runs `hugo server` and prints the local preview URL
6. You review in browser
7. You confirm. Skill stops the server, commits the file, pushes to `dev`
8. GitHub Actions builds and deploys automatically

**Skill location:** `.claude/skills/til.md`

---

## 5. SEO

PaperMod handles the baseline automatically:

- OpenGraph and Twitter Card meta tags (title, description, image)
- Canonical URLs
- Hugo generates `sitemap.xml` at `/sitemap.xml`
- `robots.txt` is already enabled in `config.toml`

The only ongoing discipline required: every post must have a `description`. The `/til` skill enforces this at creation time by refusing to proceed without one.

No additional SEO plugins or configurations are needed.

---

## 6. Navigation

Update `config.toml` menu to reflect the new structure:

```toml
[[menu.main]]
  name = "Posts"
  url = "/posts/"
  weight = 1

[[menu.main]]
  name = "TIL"
  url = "/tags/til/"
  weight = 2

[[menu.main]]
  name = "About"
  url = "/about/"
  weight = 3
```

---

## 7. Deployment Pipeline

No changes. Existing GitHub Actions workflow stays as-is:

- Push to `dev` triggers build
- Hugo builds with `--minify`
- `gh-pages` pushes output to `master`
- GitHub Pages serves from `master`
- `sanjeevkpandit.com.np` DNS points to GitHub Pages

---

## Out of Scope

- Comments system
- Newsletter/subscription
- Search functionality
- Analytics changes (Google Tag Manager already in place)
- Migrating or updating old posts
