# TIL Blog Revamp Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Revive sanjeevkpandit.com.np with PaperMod theme, a TIL publishing workflow via Claude Code skill, and a clean repo free of legacy dead weight.

**Architecture:** All posts (TIL and long-form) live under `content/posts/` differentiated by the `til` tag. Deployment stays on GitHub Pages via existing GitHub Actions on `dev` push. A Claude Code skill at `.claude/skills/til.md` handles the full TIL create → preview → publish flow.

**Tech Stack:** Hugo 0.160.1+, PaperMod theme (git submodule), GitHub Actions, GitHub Pages

---

## File Map

| File | Action | Purpose |
|---|---|---|
| `themes/jane/` | Remove (submodule) | Unused theme |
| `themes/hugo-coder/` | Remove (submodule) | Replaced by PaperMod |
| `themes/hugo-theme-jane/` | Remove (directory) | Unused theme files |
| `public/` | Remove (submodule) | Legacy manual deploy |
| `deploy.sh` | Remove | Replaced by GitHub Actions |
| `themes/PaperMod/` | Create (submodule) | New theme |
| `config.toml` | Rewrite | PaperMod config + navigation |
| `.gitignore` | Modify | Add `public/` |
| `static/CNAME` | Create | Ensure custom domain survives gh-pages deploys |
| `archetypes/default.md` | Rewrite | YAML front matter for PaperMod |
| `content/about.md` | Rewrite | Remove stale content |
| `.claude/skills/til.md` | Create | TIL publishing skill |
| `CLAUDE.md` | Modify | Document /til skill |

---

## Task 1: Remove dead submodules and legacy files

**Files:** `.gitmodules`, `.gitignore`, `themes/jane/`, `themes/hugo-coder/`, `themes/hugo-theme-jane/`, `public/`, `deploy.sh`

- [ ] **Remove themes/jane submodule**

  ```bash
  git submodule deinit -f themes/jane
  git rm -f themes/jane
  rm -rf .git/modules/themes/jane
  ```

- [ ] **Remove themes/hugo-coder submodule**

  ```bash
  git submodule deinit -f themes/hugo-coder
  git rm -f themes/hugo-coder
  rm -rf .git/modules/themes/hugo-coder
  ```

- [ ] **Remove public/ submodule**

  ```bash
  git submodule deinit -f public
  git rm -f public
  rm -rf .git/modules/public
  ```

- [ ] **Remove themes/hugo-theme-jane directory**

  ```bash
  git rm -rf themes/hugo-theme-jane 2>/dev/null || rm -rf themes/hugo-theme-jane
  ```

- [ ] **Remove deploy.sh**

  ```bash
  git rm deploy.sh
  ```

- [ ] **Add public/ to .gitignore**

  Open `.gitignore` and add `public/` on its own line. The file currently contains:
  ```
  .hugo_build.lock
  resources/_gen/

  !CLAUDE.md
  !.claude
  ```
  Add `public/` so it becomes:
  ```
  .hugo_build.lock
  resources/_gen/
  public/

  !CLAUDE.md
  !.claude
  ```

- [ ] **Add CNAME file to static/**

  Create `static/CNAME` with exactly this content (no trailing newline issues — one line):
  ```
  sanjeevkpandit.com.np
  ```
  This ensures `gh-pages` deploys always include the custom domain file so GitHub Pages keeps the DNS mapping.

- [ ] **Commit**

  ```bash
  git add .gitignore static/CNAME
  git commit -m "chore: remove dead submodules, deploy.sh, add CNAME and public to gitignore"
  ```

---

## Task 2: Add PaperMod theme

**Files:** `themes/PaperMod/`, `.gitmodules`

- [ ] **Add PaperMod as a submodule**

  ```bash
  git submodule add --depth=1 https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
  ```

  Expected output ends with: `Submodule path 'themes/PaperMod': checked out '...'`

- [ ] **Commit**

  ```bash
  git add .gitmodules themes/PaperMod
  git commit -m "feat: add PaperMod theme submodule"
  ```

---

## Task 3: Rewrite config.toml for PaperMod

**Files:** `config.toml`

- [ ] **Replace config.toml entirely**

  Write the following content to `config.toml` (this replaces everything):

  ```toml
  baseURL = "https://sanjeevkpandit.com.np/"
  title = "Sanjeev Kumar Pandit"
  theme = "PaperMod"
  languageCode = "en"
  defaultContentLanguage = "en"
  enableRobotsTXT = true

  pygmentsstyle = "dracula"
  pygmentscodefences = true
  pygmentscodefencesguesssyntax = true

  [pagination]
    pagerSize = 10

  [services]
    [services.googleAnalytics]
      id = "G-WSTRHS448Q"

  [module]
    [module.hugoVersion]
      min = "0.160.1"

  [params]
    author = "Sanjeev Kumar Pandit"
    description = "Full Stack Developer sharing things I learn."
    defaultTheme = "auto"
    ShowReadingTime = true
    ShowPostNavLinks = true
    ShowBreadCrumbs = false
    ShowCodeCopyButtons = true
    ShowTags = true
    ShowRssButtonInSectionTermList = true
    ShowShareButtons = false

    [params.homeInfoParams]
      Title = "Hi, I'm Sanjeev"
      Content = "Full Stack Developer. I write about what I learn, technical and otherwise."

    [[params.socialIcons]]
      name = "github"
      url = "https://github.com/sanjeevkpandit"

    [[params.socialIcons]]
      name = "linkedin"
      url = "https://np.linkedin.com/in/sanjeevkpandit"

    [[params.socialIcons]]
      name = "twitter"
      url = "https://twitter.com/sanjeevkpandit"

  [taxonomies]
    category = "categories"
    series = "series"
    tag = "tags"

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

- [ ] **Verify Hugo builds without errors**

  ```bash
  hugo --gc 2>&1 | tail -5
  ```

  Expected: `Total in X ms` with no `ERROR` lines. The `public/` directory will be created. That is fine.

- [ ] **Commit**

  ```bash
  git add config.toml
  git commit -m "feat: switch to PaperMod theme with full config rewrite"
  ```

---

## Task 4: Update archetype and about page

**Files:** `archetypes/default.md`, `content/about.md`

- [ ] **Rewrite archetypes/default.md**

  Replace the entire file with:

  ```markdown
  ---
  title: "{{ replace .Name "-" " " | title }}"
  date: {{ .Date }}
  tags: []
  description: ""
  draft: true
  ---
  ```

- [ ] **Rewrite content/about.md**

  Replace the entire file with:

  ```markdown
  ---
  title: "About"
  slug: "about"
  ---

  Full Stack Developer based in Nepal.

  I write about things I learn, both technical and non-technical. This is where I keep those notes public.

  Find me on [GitHub](https://github.com/sanjeevkpandit), [LinkedIn](https://np.linkedin.com/in/sanjeevkpandit), or [Twitter](https://twitter.com/sanjeevkpandit).
  ```

  Note: this is a placeholder. Update the content with your actual bio whenever ready. The structure is correct.

- [ ] **Commit**

  ```bash
  git add archetypes/default.md content/about.md
  git commit -m "feat: update archetype to YAML and reset about page"
  ```

---

## Task 5: Create the /til skill

**Files:** `.claude/skills/til.md`

- [ ] **Create the .claude/skills/ directory**

  ```bash
  mkdir -p .claude/skills
  ```

- [ ] **Create .claude/skills/til.md**

  Write the following content:

  ````markdown
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
  ````

- [ ] **Commit**

  ```bash
  git add .claude/skills/til.md
  git commit -m "feat: add /til skill for frictionless TIL publishing"
  ```

---

## Task 6: Update CLAUDE.md

**Files:** `CLAUDE.md`

- [ ] **Add /til skill documentation to CLAUDE.md**

  Read the current `CLAUDE.md` and append the following section before the end of the file:

  ```markdown

  ## TIL Workflow

  Use the `/til` skill in Claude Code or Claude Desktop to publish a Today I Learned post.

  The skill handles: prompting for content → creating `content/posts/YYYY-MM-DD-slug.md` → local preview via `hugo server` → commit and push to `dev` on confirmation.

  TIL posts are regular posts tagged with `til`. All posts live in `content/posts/`. The `/tags/til/` page on the site lists all TILs.
  ```

- [ ] **Commit**

  ```bash
  git add CLAUDE.md
  git commit -m "docs: document /til skill workflow in CLAUDE.md"
  ```

---

## Task 7: Verify local build and push

- [ ] **Run hugo server and check the site**

  ```bash
  hugo server
  ```

  Open http://localhost:1313 and verify:
  - Home page loads with the `homeInfoParams` greeting and social icons
  - Navigation shows Posts, TIL, About
  - `/posts/` lists all existing posts
  - `/about/` shows the updated page
  - No Hugo build errors in the terminal output

  Stop the server with `Ctrl+C` when done.

- [ ] **Push to dev to trigger deployment**

  ```bash
  git push origin dev
  ```

  Then go to https://github.com/sanjeevkpandit/sanjeevkpandit.github.io/actions and confirm the Deploy workflow runs green.

  After it completes (~1–2 min), open https://sanjeevkpandit.com.np and verify the live site shows PaperMod.
