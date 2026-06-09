# Deep Word Automation Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a first deterministic automation script that fills the approved deep-mode Word template and creates `深度模式_[topic].docx` plus `链接.txt`.

**Architecture:** Keep research judgment separate from document rendering. The renderer accepts a JSON input file containing already-selected project data, source URLs, local representative project images, and deep-template section content. It fills the bundled deep project template repeatedly, one project block per `NOx`, with a cover page first.

**Tech Stack:** PowerShell, Microsoft Word COM automation, JSON input, existing `assets/templates/deep_project_template.docx`.

---

### Task 1: Deep Renderer Test

**Files:**
- Create: `tests/test_deep_report_renderer.ps1`
- Create: `examples/deep_report_input_sample.json`

- [x] Write a failing test that calls `scripts/render_deep_report.ps1` with one sample project.
- [x] Verify the test fails because the renderer script is missing.
- [x] The test must check that the output Word opens, has one inline image, at least five tables, contains the project title, and writes `链接.txt`.

### Task 2: Deep Renderer Script

**Files:**
- Create: `scripts/render_deep_report.ps1`

- [x] Parse JSON input with fields: `topic`, `user_request`, `output_dir`, and `projects`.
- [x] Validate every project has title, project type, designer, location/year, URL, image path, core judgment paragraphs, table rows, risk bullets, and conclusion paragraphs.
- [x] Copy the deep project template block once per project.
- [x] Replace title/search text, the representative image, all five tables, risks, and expanded conclusion.
- [x] Insert a cover page first and page break before every project block.
- [x] Save `深度模式_[topic].docx` and `链接.txt`.

### Task 3: Skill Integration

**Files:**
- Modify: `SKILL.md`
- Modify: `references/output_document_rules.md`
- Modify: `tests/acceptance_criteria.md`

- [x] Document that deep-mode automated Word output should prefer `scripts/render_deep_report.ps1`.
- [x] Keep the template contract unchanged.
- [x] Add acceptance criteria for renderer test passing.

### Task 4: Verification

- [x] Run `tests/test_deep_report_renderer.ps1`.
- [x] Confirm Word opens and output structure matches deep mode.
- [x] Confirm generated `链接.txt` contains the project source URL.
