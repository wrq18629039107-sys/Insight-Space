# Output Document Rules

This file defines how Insight-Space produces four delivery modes:

1. 项目搜索-深度模式
2. 项目搜索-中度模式
3. 项目搜索-浅度模式
4. 视觉搜索模式

The user does not need a default overview document. Project-search modes should produce a flat delivery by default: one mode-specific Word report and one `链接.txt` file.

Research documents and card visuals are separate output systems.

- Research documents are for analysis, judgment, source facts, transfer advice, tables, and project images used as evidence.
- Card visuals are for candidate references only: almost-selected backup projects or supplementary visual clues. Project-search modes do not output them by default; output candidate cards only if the user asks.
- Do not embed card visual layouts inside deep research documents.
- Do not treat project images inside a research document as card visuals; they are evidence images for analysis.

## Mode Selection

Use the user's wording when it is clear.

| User Intent | Output Mode |
|---|---|
| “精品案例”, “深度模式”, “深度调研”, “汇报用”, “系统找几个项目” | 项目搜索-深度模式 |
| “中度模式”, “找几个项目看看”, “不用太深”, “先有判断” | 项目搜索-中度模式 |
| “浅度模式”, “快速找几个”, “先看看方向”, “简单项目参考” | 项目搜索-浅度模式 |
| “只要图”, “视觉参考”, “座椅参考”, “灯具参考”, “材料参考”, “小构筑物参考”, “室内细节参考” | 视觉搜索模式 |

If the user does not specify the expected deliverable, offer the four options briefly instead of guessing a heavy workflow.

## Naming Rules

Project-search report filenames:

- `深度模式_[user topic].docx`
- `中度模式_[user topic].docx`
- `浅度模式_[user topic].docx`

Inside each report, use `NO1`, `NO2`, `NO3`... as item sequence labels only, not value ranking. Do not imply that NO1 is always more valuable than NO2 or NO3. Use a short project name. If the project name is uncertain, use a clear visual direction and mark facts pending in the document.

Source-link text output:

- `链接.txt`

Default delivery folder structure:

- use the desktop folder `Insight-Space输出` when a desktop filesystem is available;
- create one numbered task folder for each independent task, such as `01_中度模式_商业街区入口装置`, `02_视觉卡片_展陈材料氛围参考`, or `03_深度模式_景观塔系统研究`;
- increment the two-digit task number for repeated use so the user can find previous runs easily;
- if the user specifies another output location, use the user's location instead;
- if no desktop filesystem is available, use the current workspace output directory or ask for a location only when necessary;
- inside each numbered task folder, keep delivery flat: one Word report at the folder root when applicable, one `链接.txt` at the folder root, and no nested `01_...` / `02_...` subfolders by default;
- no `images`, source-image, process-material, or downloaded-assets folder by default. Images used in the report should be embedded in the Word document; process assets should not be delivered unless the user explicitly asks.

Candidate card output, only if requested:

- `project_reference_cards`
- or `项目参考卡片`

Card visuals are candidate references, meaning almost-selected backup projects or supplementary visual clues. Do not use candidate cards to repackage the selected projects unless the user explicitly asks for a card version of selected cases.

## Template Assets

Use the bundled Word templates whenever producing project-search reports:

| Mode | Template asset |
|---|---|
| Project Search - Deep Mode | `assets/templates/deep_project_template.docx` |
| Project Search - Medium Mode | `assets/templates/medium_project_template.docx` |
| Project Search - Shallow Mode | `assets/templates/shallow_project_template.docx` |

If a template cannot be loaded, mirror its structure manually and state that the template was unavailable.

### Binding Template Contract

The three Word templates are exact output contracts. They are not mood references and not optional layout suggestions.

Hard rules:

- Do not invent a new Word report structure.
- Do not rename, remove, reorder, or merge template sections.
- Do not add extra analysis sections unless the user explicitly asks for a new section.
- Do not replace project photographs with browser UI screenshots, search-result screenshots, website header screenshots, or source-check screenshots.
- If a reliable project image exists on a verified source page but direct download is blocked, use a cropped screenshot of the actual project photograph from that page as a low-cost preview fallback. Do not spend excessive token/time searching for a higher-resolution copy unless the user asks for publication-quality images.
- Use one accurate representative project image in the template image position by default. Additional project images are allowed only when the user asks for them or when the template already contains the slots.
- Keep card visuals separate from research documents. Card visuals are never inserted as the project image in a deep, medium, or shallow report.
- Keep `NO1`, `NO2`, `NO3` as sequence labels only.
- Do not add a Word cover page, title page, or opening explanation page for deep, medium, or shallow project-search reports. Start the Word document directly with `NO1. [Project Name]`.
- Keep user request, output mode notes, and the explanation that `NO` is not a ranking in `链接.txt` when needed, not at the beginning of the Word report.
- In a combined project-search report, start each `NOx` project block on a new page.
- Each `NOx` block must be produced by repeating the selected mode's template block, not by writing a free-form report.
- The conclusion must follow the template's expanded conclusion pattern. Do not reduce it to a short one-sentence ending.

## Project Search - Deep Mode

Use for:

- 精品案例;
- 深度研究;
- serious analysis;
- client/team review;
- cases requiring value judgment and risk awareness.

Default output:

- one combined Word report named `深度模式_[user topic].docx`, using `assets/templates/deep_project_template.docx`;
- 3-5 deep project items by default, unless the user asks for fewer or more;
- one `链接.txt`.

Do not create a separate overview document by default.
Do not create nested folders by default.
Do not create a cover/title/summary page inside the Word report by default. The report starts directly with `NO1`.
Default: do not output card visuals. Card visuals are candidate references, meaning almost-selected backup projects or supplementary visual clues. If the user asks for cards, keep the card visual output separate from the main report.
Keep `链接.txt` short and focused on original URLs rather than repeating analysis.

### Final Image Requirement

Final-version case documents should include images, not placeholders, whenever reliable images are available.

Image priority:

1. user-provided images or images already embedded in user-provided documents;
2. images from verified project pages or professional media pages, with source and copyright note;
3. cropped screenshot previews of the actual project photograph on a verified source page when direct image download is blocked;
4. generated images only when the user asks for conceptual images or when real project images are unavailable.

If generated images are used, label them clearly as generated visual aids, not project photographs.
If a screenshot preview is used because the original image cannot be downloaded, keep it simple and do not downgrade the project only for image sharpness.
If no reliable image can be used, state that the image area is pending instead of silently using a fake project image.

### Deep Template Structure

Use `assets/templates/deep_project_template.docx` exactly. For each selected project, repeat the template block and replace only the placeholder content.

Deep project block order:

1. `NOX. XXXXX(项目中英文)`
2. `中度项目搜索：xxxx参考。序号不代表价值排序。`  
   Keep the template sentence style and replace the topic text as needed.
3. One accurate representative project image from the verified project page or reliable professional media page.
4. Project information table:
   - `项目类型`
   - `设计/机构`
   - `地点/年份`
   - `原网址`
5. `核心判断`
   - Write at least three expanded judgment points.
   - Point a: why the project has reference value.
   - Point b: explain from design, spatial, operation, material, path, brand, or user-behavior angle.
   - Point c: state why it is suitable as a strong reference for the current user need.
6. `2.最值得参考`
   - Table columns must remain: `参考点` / `为什么重要` / `项目怎么用`.
7. `3.借鉴方向建议`
   - Table columns must remain: `方向` / `可借鉴做法` / `落地提醒`.
   - Keep template row logic such as `形体`, `材料`, and other current-project directions when applicable.
8. `4. 不能照搬点`
   - Table columns must remain: `不要照搬` / `原因` / `替代做法`.
9. `5. 成本 / 施工 / 维护初判 (1-3)`
   - Table columns must remain: `维度` / `评分` / `判断` / `处理建议`.
   - Rows must include `成本`, `施工`, and `维护`.
10. `6.风险提醒`
    - Use three concise bullet warnings by default.
11. `7.结论`
    - Follow the template's expanded three-paragraph conclusion pattern:
      - paragraph 1: this project can serve as what kind of reference, and its value is a strategy rather than a directly copied form;
      - paragraph 2: for the current user need, explain how to use it in form/path/material/function/operation or other relevant dimensions;
      - paragraph 3: state what to focus on, what to borrow cautiously, and how to break it into controllable implementation modules.

Do not turn the conclusion into a one-sentence summary. The case should read as a standalone project file inside the combined report.

### Table Automation

Use tables whenever they make the document easier to read.

Prefer tables for:

- project information;
- source verification;
- cost / construction / maintenance judgment;
- current-project transfer suggestions;
- do-not-copy warnings;
- candidate comparison when several cases are discussed together.

Do not write long paragraph blocks when a two-column or three-column table would be clearer.

### Deep Document Readability

After the image and three value points, make the later judgment sections easy to scan.

Use clear emphasis for:

- selected / not selected reason;
- strongest transferable strategy;
- current-project action;
- cost, construction, and maintenance risk;
- do-not-copy warnings;
- final recommendation.

Avoid burying the main judgment inside long paragraphs. If a section contains several warnings, start with a one-line judgment, then explain the reasons.
Use conclusion-first writing: state the judgment first, then explain. Keep paragraphs short. Use tables, compact labels, and short warnings so a designer can scan the page quickly during a meeting.

### Deep Word Renderer

When deep-mode project content has already been researched, verified, and prepared as structured data, prefer `scripts/render_deep_report.ps1` to produce the Word report. This renderer fills `assets/templates/deep_project_template.docx` and creates the matching `链接.txt`.

Use the renderer only after the research phase has prepared:

- user topic and original user request;
- selected project list with `NOx`, project name, project type, designer/office, location/year, original URL, and local representative image path;
- three core-judgment paragraphs;
- reference-point table rows;
- direction-suggestion table rows;
- do-not-copy table rows;
- cost / construction / maintenance rows;
- three risk reminders;
- three expanded conclusion paragraphs.

The renderer does not search the web, verify links, choose cases, or choose images. Those steps remain part of the Insight-Space research workflow. If the template, JSON input, or local image path is missing, the renderer should fail rather than silently generating a broken report.

After changing the deep renderer or deep template, run `tests/test_deep_report_renderer.ps1`.

## Project Search - Medium Mode

Use for:

- several useful projects;
- early project comparison;
- user wants judgment but not full deep analysis;
- 5-8 project-level references.

Default output:

- one combined Word report named `中度模式_[user topic].docx`, using `assets/templates/medium_project_template.docx`;
- 5-8 reduced project items by default;
- one `链接.txt`.

Medium is not “cards only”. It is a deep-template reduction.
Do not create a cover/title/summary page inside the Word report by default. The report starts directly with `NO1`.
Default: do not output card visuals. Card visuals are candidate references, meaning almost-selected backup projects or supplementary visual clues. If the user asks for cards, keep them separate from the main report.

### Medium Template Structure

Use `assets/templates/medium_project_template.docx` exactly. Medium mode keeps the same visual format as the approved deep template, but removes only section `4. 不能照搬点` and section `5. 成本 / 施工 / 维护初判 (1-3)`. It is not a card layout and not a free-form list.

Medium project block order:

1. `NOX. XXXXX(项目中英文)`
2. `中度项目搜索：xxxx参考。序号不代表价值排序。`
3. One accurate representative project image from the verified project page or reliable professional media page.
4. Project information table:
   - `项目类型`
   - `设计/机构`
   - `地点/年份`
   - `原网址`
5. `核心判断`
   - Write at least three expanded judgment points, following the same logic as the template example.
6. `2.最值得参考`
   - Table columns must remain: `参考点` / `为什么重要` / `项目怎么用`.
7. `3.借鉴方向建议`
   - Table columns must remain: `方向` / `可借鉴做法` / `落地提醒`.
8. `4.风险提醒`
   - Use two concise bullet warnings by default.
9. `5.结论`
   - Follow the same expanded three-paragraph conclusion pattern as the template.

Medium mode omits the deep template's full section `4. 不能照搬点` and full section `5. 成本 / 施工 / 维护初判 (1-3)`, then renumbers the remaining risk and conclusion sections as `4.风险提醒` and `5.结论`. Do not add replacement tables for the omitted sections by default. Do not replace the expanded conclusion with a short ending.

### Medium Word Renderer

When medium-mode project content has already been researched, verified, and prepared as structured data, prefer `scripts/render_medium_report.ps1` to produce the Word report. This renderer fills `assets/templates/medium_project_template.docx` and creates the matching `链接.txt`.

Use the renderer only after the research phase has prepared:

- user topic and original user request;
- selected project list with `NOx`, project name, project type, designer/office, location/year, original URL, and local representative image path;
- three core-judgment paragraphs;
- three reference-point table rows;
- four direction-suggestion table rows;
- two concise risk reminders by default;
- three expanded conclusion paragraphs.

The renderer does not search the web, verify links, choose cases, or choose images. If the template, JSON input, or local image path is missing, it should fail rather than silently generating a broken report.

After changing the medium renderer or medium template, run `tests/test_medium_report_renderer.ps1` and `tests/test_medium_template.ps1`.

## Project Search - Shallow Mode

Use for:

- “先快速找”;
- direction scan;
- early inspiration screening;
- unclear project stage.

Default output:

- one combined lightweight Word report named `浅度模式_[user topic].docx`, using `assets/templates/shallow_project_template.docx`;
- 8 project items by default, unless the user requests another number;
- no default card visual output;
- one `链接.txt`.

Use `assets/templates/shallow_project_template.docx` exactly. Each shallow item follows the template's minimal field order:

1. `NOx.xxxxxxxxxxx`
2. One compact accurate project image when available.
3. `项目类型`
4. `设计/机构`
5. `地点/年份`
6. `一句话特征`
7. `为什么值得看`
8. `提醒`
9. `原网址`

Do not do full cost/construction/maintenance analysis. Add one warning only when the risk is obvious. Full URLs may remain in `链接.txt` when placing them inside the Word table would damage layout.

### Shallow Report Template

Use the bundled `assets/templates/shallow_project_template.docx` as the standard layout. This asset has been updated from the user's approved desktop `浅度模式.docx`. The default shallow output is one Word report containing all selected projects, plus a separate `链接.txt` at the same delivery level.

If no template asset is available, mirror the same one-page, one-image, one-table shallow block structure manually without adding new fields.

Shallow report layout requirements:

- place all project items in one document, not one document per project;
- place exactly one shallow project item on each page by default;
- keep the shallow project block visually centered on the page as much as the template allows;
- keep project images compact so the report remains quick to scan;
- use tables only when they improve readability;
- never use fixed row heights that hide text;
- allow table rows to expand automatically so all text is fully visible;
- do not let long URLs compress the table; put full URLs in `链接.txt`;
- the Word report may show source name/source level, while `链接.txt` holds the full original links;
- default delivery contains only the shallow Word report and `链接.txt`; do not output an `images`, source-image, or process-material folder unless the user explicitly asks for it;
- do not output card visuals unless the user explicitly asks for candidate cards, backup references, or visual cards.

### Shallow Word Renderer

When shallow-mode project content has already been researched, verified, and prepared as structured data, prefer `scripts/render_shallow_report.ps1` to produce the Word report. This renderer fills `assets/templates/shallow_project_template.docx` and creates the matching `链接.txt`.

Use the renderer only after the research phase has prepared:

- user topic and original user request;
- selected project list with `NOx`, project name, project type, designer/office, location/year, original URL, and local representative image path;
- one-sentence feature;
- why it is worth seeing;
- one concise warning or reminder.

The shallow renderer embeds images into Word and must not create `images`, source-image, process-material, or downloaded-assets folders by default.

After changing the shallow renderer or shallow template, run `tests/test_shallow_report_renderer.ps1`.

## Visual Search Output

Use when the user only wants pictures, visual mood, forms, material clues, object references, seats, lighting, furniture, small structures, or detail references.

Default output:

- card visuals only;
- one `链接.txt` source-link list.

Each image card includes:

- image;
- visual clue;
- retained value;
- brief reference advice;
- suitable scene;
- source label;
- whether formal tracing is recommended.

No project facts should be invented. If project facts cannot be verified, mark the item as a visual clue or “原项目待追溯”.

## Project Search vs Visual Search

Project research prioritizes:

- verified projects;
- source facts;
- case value;
- transfer strategy;
- non-copy notes;
- risk judgment.

Visual search prioritizes:

- visual readability;
- form and material clue;
- atmosphere;
- possible use;
- source type;
- whether it needs project tracing.

## Source-Link Text File

Because long URLs damage report tables and card layouts, use a separate `链接.txt` output.

Suggested format:

```text
用户问题：用户原始问题
输出模式：项目搜索-深度模式 / 项目搜索-中度模式 / 项目搜索-浅度模式
说明：项目搜索模式默认不输出卡片视觉。卡片视觉为候选参考；如果用户需要，可以再输出。

NO1. Project Name / Designer
链接：https://...

NO2. Project Name / Designer
链接：https://...
```

In cards, show only a weak source label such as `Source: gooood` when needed.

## Candidate Supplement Logic

Near-miss candidates should not be thrown away if they still have value.

When the user asks for candidate cards or backup visual references, use cards for:

- candidates that nearly entered selected cases;
- projects with incomplete facts but useful visual value;
- local strategy references;
- material, form, path, node, or atmosphere clues;
- projects worth later tracing.

Candidate cards should explain why they were not selected and what value remains.

## Output Principles

- Deep cases should be few and deep.
- Medium cases should be clear and reduced, not shallow.
- Shallow output should be fast but still source-labeled.
- Visual search may be visual-only but never fake facts.
- Card visuals should support browsing and selection only when requested or when using visual search mode.
- Link text files support source checking.
- All outputs must help a designer decide quickly.
