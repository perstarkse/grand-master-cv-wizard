# Agent Guidelines

## Project Overview
- This repo manages multiple Typst-based CVs that are each self-contained profiles (no shared template file in this repo).
- Each profile `.typ` file corresponds to a specific language and focus area (tech, leadership, health/psychology, tailored employer variants).
- PDFs are written to `build/` with one output per profile.

## Files & Profiles
- Core English profiles:
  - `en-tech.typ` – tech-focused CV.
  - `en-leadership-tech.typ` – tech + leadership-focused CV.
- Core Swedish profiles:
  - `sv-tech.typ` – tech-focused CV.
  - `sv-health-psych.typ` – health/psychology-focused CV.
  - `sv-health-lead.typ` – health leadership-focused CV.
  - `sv-leadership-tech.typ` – tech + leadership-focused CV.
- Tailored profiles:
  - `anpassade-cvn/sv-trafikverket-tictec.typ` – Swedish, tailored to Trafikverket TicTec.

- Reference template (non-profile):
  - `templates/template-reference.typ` – English reference CV template; used as a starting point, but not treated as an active profile.

All profiles:
- Import `@preview/basic-resume:0.2.9`.
- Define the same contact variables: `name`, `location`, `email`, `github`, `linkedin`, `phone`, `personal-site`.
- Use the same content helpers: `#work`, `#edu`, `#project`, `#extracurriculars`, headings like `== Summary`, `== Skills`, etc.

## Conventions
- Keep contact information and factual data (dates, titles, institutions, URLs) consistent across all profiles unless intentionally diverging.
- Language is profile-specific:
  - English profile files (`en-*`) use English headings and bullets.
  - Swedish profile files (`sv-*`, `anpassade-cvn/*.typ`) use Swedish headings and bullets.
- Do not change macro signatures:
  - Preserve named arguments for `#work`, `#edu`, `#project`, `#extracurriculars`.
  - Keep bullets (`- ...`) immediately following the relevant macro call.
- Section ordering is part of each profile’s positioning (e.g., tech roles foreground projects/skills, leadership roles foreground leadership, governance, and core competencies). Prefer editing within sections over reordering them unless explicitly requested.

## Recommended Agent Entrypoints

These are the main operations an agent should support; treat them as a contract.

### 1. `list_profiles`
- Return a catalog of available profiles with:
  - `id` (e.g., `en-tech`, `sv-health-psych`, `sv-trafikverket-tictec`),
  - `path` (Typst file path),
  - `language` (`en` or `sv`),
  - `focus` (e.g., `tech`, `leadership-tech`, `health-psych`, `health-lead`, `tailored`).

### 2. `select_profile(language, focus, tailored_role?)`
- Resolve user intent like “Swedish tech CV” or “English leadership profile” to a single file.
- If `tailored_role` is specified, prefer:
  - Existing tailored profile in `anpassade-cvn/` if it matches,
  - Otherwise propose creating a new file there (see `create_tailored_profile`).

### 3. `inspect_profile(profile_id)`
- Read a specific `.typ` file and return a structured representation:
  - Global contact block.
  - Section list (by `== Heading`).
  - Entries under each section:
    - `work` entries mapped from `#work(...)` plus their bullet lists.
    - `project` entries from `#project(...)`.
    - `education` entries from `#edu(...)`.
    - `extracurricular` entries from `#extracurriculars(...)`.
- Use this structured form for reasoning and edits; when writing back, preserve the original macros and layout as much as possible.

### 4. `edit_profile_section(profile_id, section, instructions)`
- Edit content only within a named section (e.g., `Summary`, `Skills`, `Work Experience`, `Education`, `Projects`, `Core Competencies`).
- Rules:
  - Preserve macro calls and argument names (`#work(company: ..., dates: ...)` etc.).
  - Preserve language (English vs Swedish wording).
  - Keep bullets as single lines starting with `- `.
  - Avoid renaming or deleting sections unless explicitly asked.
- Typical tasks:
  - Rewrite `Summary` for a specific role or seniority.
  - Adjust `Skills` / `Core Competencies` emphasis.
  - Rewrite or tighten bullet points for impact and clarity.

### 5. `sync_experience_across_profiles(source_profile_id, targets, scope)`
- Treat one profile as the source of truth for a given scope and update others:
  - `scope` can be `contact-info`, `work-history`, `projects`, `education` (one or several).
- Behaviors:
  - For same-language profiles, copy the relevant blocks/bullets directly unless that profile intentionally diverges.
  - For cross-language profiles, update factual data (dates, titles, institutions, URLs, metrics), but preserve language and tone.
- Use this when a new job, project, or thesis description is added/updated and should be reflected across variants.

### 6. `create_tailored_profile(base_profile_id, new_id, target_role_description)`
- Create a new Typst file for a specific employer or posting, usually under `anpassade-cvn/`.
- Start from an existing base profile that is closest in language and focus (e.g., `sv-tech.typ`).
- Copy:
  - Contact block and factual work/education history.
  - Sections and macro structure.
- Tailor:
  - `Summary` / `Sammanfattning`.
  - `Skills` / `Färdigheter` / `Core Competencies`.
  - Bullet points under the most relevant `#work` and `#project` entries.
- Name the file to reflect language and role (e.g., `anpassade-cvn/sv-<org-or-role>.typ`).

### 7. `build_profile(profile_id)` and `build_all`
- Compile Typst sources to PDFs in `build/` using `typst compile`:
  - Example: `typst compile en-tech.typ build/tech.pdf`.
  - Follow the existing naming pattern where possible (e.g., `en-leadership-tech.typ` → `build/leadership-tech.pdf`).
- `build_all`:
  - Enumerate all `*.typ` files in the repo.
  - Compile each into a corresponding `build/*.pdf`, creating `build/` if it does not exist.

### 8. `update_contact_info(field, new_value)`
- Update `name`, `location`, `email`, `github`, `linkedin`, `phone`, or `personal-site` across all `.typ` files.
- Always apply changes consistently across profiles unless a specific profile should intentionally diverge (and document that in code or prompts).

## Writing & Editing Style
- Maintain a concise, impact-focused tone; emphasize scope, ownership, and measurable outcomes where available.
- Use vocabulary appropriate to the profile focus:
  - Tech: highlight infra, tooling, languages, and delivery.
  - Leadership: highlight stakeholders, governance, mentoring, safety/quality, and decision-making.
  - Health/psychology: highlight clinical work, evidence base, patient safety, research/analysis.
- Avoid exaggeration; keep statements accurate and supportable.
- Respect existing positioning choices in each profile; when in doubt, propose changes rather than silently overwriting major shifts in focus.

## Context Resources
- `resources/blog-posts.md` is a curated snapshot of the public blog posts at `blog.stark.pub`.
  - Use it to understand writing style, technical depth and concrete project details (e.g., LLM-studien, Axum/Rust, säker datahantering med GPG/pass, Pandoc/Markdown-flöden).
  - When referencing blog-based arbete i CV:n (projekt, publikationer, färdigheter), prefer facts and wording grounded in this file instead of inventing new claims.
- Additional resources may be added over time (for example, offline snapshots of key GitHub-repon under `resources/`).
  - If such GitHub snapshots exist, treat them as the primary source for repo names, teknisk stack och ansvarsbeskrivningar i projektavsnitt.

## Quality & Safety Checks
- Before major edits:
  - Confirm which profile(s) you are editing and why.
  - Prefer working through `edit_profile_section` / structured representations instead of raw string replaces.
- After edits:
  - Ensure all Typst macros still parse (no missing commas, quotes, or parentheses).
  - If possible, compile the changed profile(s) with `typst compile` to check for errors before sharing PDFs.
- Do not remove or rename files without explicit instruction.
