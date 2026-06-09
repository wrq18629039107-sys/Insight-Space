# Medium And Shallow Word Automation Implementation Plan

> Completed on 2026-06-08.

**Goal:** Add deterministic Word renderers for Insight-Space medium and shallow project-search modes.

**Architecture:** Keep research separate from rendering. Each renderer accepts structured JSON with selected project data and local representative images, repeats the approved Word template block, embeds images into Word, writes one report plus link file, and does not output process-image folders.

**Tech Stack:** PowerShell, Microsoft Word COM automation, JSON input, bundled Word templates.

---

### Task 1: Medium Renderer Test And Sample

**Files:**
- Created: `examples/medium_report_input_sample.json`
- Created: `tests/test_medium_report_renderer.ps1`

- [x] Write sample JSON with one medium project using the existing card-template image as a local placeholder.
- [x] Write a failing test that calls `scripts/render_medium_report.ps1`.
- [x] Test verifies: Word exists, link file exists, first paragraph starts with `NO1.`, there are exactly 3 tables, at least 1 image, headings `1/2/3/4/5` exist, and wrong `6/7` headings do not exist.

### Task 2: Shallow Renderer Test And Sample

**Files:**
- Created: `examples/shallow_report_input_sample.json`
- Created: `tests/test_shallow_report_renderer.ps1`

- [x] Write sample JSON with two shallow projects using the existing card-template image as local placeholder.
- [x] Write a failing test that calls `scripts/render_shallow_report.ps1`.
- [x] Test verifies: Word exists, link file exists, no `images` output folder is created, document starts with `NO1.`, has one table and one image per project, and each project starts on a new page.

### Task 3: Medium Renderer

**Files:**
- Created: `scripts/render_medium_report.ps1`

- [x] Parse JSON fields: `topic`, `user_request`, optional `output_dir`, `projects`.
- [x] Validate each project has title, project type, designer, location/year, URL, image path, core judgment, reference points, direction suggestions, risks, and conclusion.
- [x] Repeat `assets/templates/medium_project_template.docx` once per project.
- [x] Fill title, search line, image, project information, reference tables, risk reminder, and conclusion.
- [x] Save medium-mode Word plus link file.

### Task 4: Shallow Renderer

**Files:**
- Created: `scripts/render_shallow_report.ps1`

- [x] Parse JSON fields: `topic`, `user_request`, optional `output_dir`, `projects`.
- [x] Validate each project has title, project type, designer, location/year, feature, value, warning, URL, and image path.
- [x] Repeat `assets/templates/shallow_project_template.docx` once per project.
- [x] Preserve the image placeholder by replacing only the text before the template image in the first paragraph.
- [x] Save shallow-mode Word plus link file, and do not create image/process folders.

### Task 5: Documentation And Verification

**Files:**
- Modified: `SKILL.md`
- Modified: `references/output_document_rules.md`
- Modified: `tests/acceptance_criteria.md`

- [x] Document that prepared medium data should use `scripts/render_medium_report.ps1`.
- [x] Document that prepared shallow data should use `scripts/render_shallow_report.ps1`.
- [x] Run all renderer and template tests.
