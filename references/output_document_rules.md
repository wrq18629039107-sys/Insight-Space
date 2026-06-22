# Output Document Rules

This file defines how Insight-Space produces five delivery modes:

1. 项目搜索-深度模式
2. 项目搜索-中度模式
3. 项目搜索-浅度模式
4. 视觉搜索模式
5. 项目搜索-专家模式

The user does not need a default overview document. Project-search modes should produce a flat delivery by default: one mode-specific Word report, one `链接.txt` file, and only the mode-required card folder. Deep and Medium modes include a default `项目参考卡片` folder; Shallow mode does not.
Visual Search is the only default card-only mode. Deep, Medium, Shallow, and Expert Mode are document-output modes by default. Expert Mode Word report is mandatory and cannot be replaced by cards or lightweight visual references.

Research documents and card visuals are separate output systems.

- Research documents are for analysis, judgment, source facts, transfer advice, tables, and project images used as evidence.
- Card visuals are for candidate references only: almost-selected backup projects or supplementary visual clues.
- Deep and Medium modes must output five candidate cards by default. These cards are near-miss candidates from the same research round, not selected Word cases repackaged as cards.
- Shallow mode still does not output cards by default. Visual Search outputs cards by default, and Expert Mode follows its own inspiration-card rules.
- Do not embed card visual layouts inside deep research documents.
- Do not treat project images inside a research document as card visuals; they are evidence images for analysis.

## Universal no-repeat rule

This rule applies to Deep, Medium, Shallow, Visual Search, and Expert Mode.

Repeat-search requests must not produce the same project, same source page, same project name, or same representative image in any later Word report, lightweight report, visual-search output, candidate card set, or Expert Mode inspiration card set. This includes reruns of the same title, follow-up searches,补充,换一批,再找一些,扩展, and any user request that clearly asks for another round.

Before writing a new output, compare the final shortlist against prior result evidence that is available in the session: previous `链接.txt`, previous Word/item names, prior card folders, current conversation results, and user-provided old outputs. Remove repeated projects, repeated source pages, repeated project names, repeated representative images, and obvious reposts of the same project. If a repeat is unavoidable because the topic is extremely narrow, mark it before output and ask whether the user wants adjacent references instead.

## Universal low-quality or blurry image note

This rule applies to Deep, Medium, Shallow, Visual Search, and Expert Mode.

If a strong reference has only a low-resolution, blurry, cropped, watermarked, or screenshot-based image because direct download is blocked, keep the reference when its design value is high, but add a low-quality or blurry image note near the item or in `链接.txt`:

`图片说明：不让下载，截图示意。建议结合文字分析去源网站查看。`

This note is mandatory whenever the output image is not a normal downloaded project/reference photograph. It protects the user from mistaking a quick screenshot preview for the best available source image.

Do not create generic placeholder images when a source page, visible webpage image, screenshot or cropped preview fallback can represent the selected reference. If direct image download fails, first try a source-page image, then a screenshot or cropped preview fallback of the actual reference image/page. Use a text placeholder only when no source image, screenshot, or preview can be captured, and mark it as a failure state rather than normal delivery.

## Mode Selection

Use the user's wording when it is clear.

| User Intent | Output Mode |
|---|---|
| “精品案例”, “深度模式”, “深度调研”, “汇报用”, “系统找几个项目” | 项目搜索-深度模式 |
| “中度模式”, “找几个项目看看”, “不用太深”, “先有判断” | 项目搜索-中度模式 |
| “浅度模式”, “快速找几个”, “先看看方向”, “简单项目参考” | 项目搜索-浅度模式 |
| “只要图”, “视觉参考”, “座椅参考”, “灯具参考”, “材料参考”, “小构筑物参考”, “室内细节参考” | 视觉搜索模式 |
| “专家模式”, “精准一点”, “专项”, “单点”, “最好看的”, “审美最高”, “低成本但高级”, “消防坡道”, “无障碍”, “风险避坑”, “具体做法” | 项目搜索-专家模式 |

If the user does not specify the expected deliverable, offer the five options briefly instead of guessing a heavy workflow.

### Large requested-count notice

When the user asks for many cases, many cards, or a larger-than-default selection, the confirmation block must explain the larger search scope before online search starts. Tell the user that the run will increase the rough candidate pool, why that protects quality, and that it may take about 5-8 extra minutes.

Use this large-count confirmation wording when appropriate:

```text
鉴于你本次要筛选的案例比较多，我会把初筛候选池从默认 [默认候选数] 个左右提高到 [扩大候选数] 个左右，再从里面筛出正式案例和候选卡片。这样质量会更稳，但时间大概会多 5-8 分钟。你确认后我再开始。
```

English control wording: Large requested-count notice; increase the rough candidate pool; about 5-8 extra minutes; before online search starts.

## Naming Rules

Project-search report filenames:

- `深度模式_[user topic].docx`
- `中度模式_[user topic].docx`
- `浅度模式_[user topic].docx`
- `专家模式_[user topic].docx`

Inside each report, use `NO1`, `NO2`, `NO3`... as item sequence labels only, not value ranking. Do not imply that NO1 is always more valuable than NO2 or NO3. Use a short project name. If the project name is uncertain, use a clear visual direction and mark facts pending in the document.

Source-link text output:

- `链接.txt`

Default delivery folder structure:

- use the desktop folder `Insight-Space输出` when a desktop filesystem is available;
- create one numbered task folder for each independent task, such as `01_中度模式_商业街区入口装置`, `02_视觉卡片_展陈材料氛围参考`, `03_深度模式_景观塔系统研究`, or `04_专家模式_消防坡道专项参考`;
- increment the two-digit task number for repeated use so the user can find previous runs easily;
- if the user specifies another output location, use the user's location instead;
- if no desktop filesystem is available, use the current workspace output directory or ask for a location only when necessary;
- inside each numbered task folder, keep delivery flat: one Word report at the folder root when applicable, one `链接.txt` at the folder root, and a separate card folder only for Deep/Medium default candidate cards, Visual Search cards, Expert Mode inspiration cards, or user-requested card outputs;
- no `images`, source-image, process-material, or downloaded-assets folder by default. Images used in the report should be embedded in the Word document; process assets should not be delivered unless the user explicitly asks.

Candidate card output:

- `project_reference_cards`
- or `项目参考卡片`

Deep and Medium default candidate-card output:

- folder name: `项目参考卡片`;
- quantity: five cards by default, unless the user asks for another number;
- source pool: near-miss candidates from the same research round;
- role: useful backup references that almost entered the Word report, not selected Word cases repackaged as cards;
- link handling: keep full URLs in the task-level `链接.txt` or a card-folder `链接.txt`, whichever keeps the delivery clearer.

Card visuals are candidate references, meaning almost-selected backup projects or supplementary visual clues. Do not use candidate cards to repackage the selected projects unless the user explicitly asks for a card version of selected cases.

Expert Mode inspiration card output, only if requested:

- `更多单点可能性`

These cards are extra single-point possibilities, not verified Word cases. Keep them separate from the Expert Mode Word report and full source links.

## Template Assets

Use the bundled Word templates whenever producing project-search reports:

| Mode | Template asset |
|---|---|
| Project Search - Deep Mode | `assets/templates/deep_project_template.docx` |
| Project Search - Medium Mode | `assets/templates/medium_project_template.docx` |
| Project Search - Shallow Mode | `assets/templates/shallow_project_template.docx` |
| Project Search - Expert Mode / 专项模式 | `assets/templates/expert_mode_template.docx` for single-point/special-topic Word reports |

If a template cannot be loaded, mirror its structure manually and state that the template was unavailable.

### Automation coverage and boundaries

Word layout automation exists for all four Word-output modes:

- Deep Mode: `scripts/render_deep_report.ps1`;
- Medium Mode: `scripts/render_medium_report.ps1`;
- Shallow Mode: `scripts/render_shallow_report.ps1`;
- Expert Mode / 专项模式: `scripts/render_expert_report.ps1`.

Bitmap card layout automation uses `scripts/render_project_card.ps1`.

Deep and Medium candidate cards use the card renderer for the default five `项目参考卡片`. These are near-miss candidates from the same research round.

Expert Mode default eight inspiration cards use the same card renderer for the `更多单点可能性` folder, usually numbered `C01-C08`. These are a separate single-point inspiration pool and must not reuse Word cases.

Automation is a rendering layer only. It saves layout and formatting tokens, but it does not search the web, choose platforms, select cases, verify links, download images, screenshot pages, choose representative images, write design judgment, write card copy, or decide whether an image is strong enough. Those decisions must be completed before calling any renderer.

### Binding Template Contract

The Word templates are exact output contracts. They are not mood references and not optional layout suggestions.

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
- one `项目参考卡片` folder with five candidate cards by default;
- one `链接.txt`.

Do not create a separate overview document by default.
Do not create nested folders by default.
Do not create a cover/title/summary page inside the Word report by default. The report starts directly with `NO1`.
Default: output five candidate cards. Card visuals are candidate references, meaning almost-selected backup projects or supplementary visual clues. The five default cards must come from near-miss candidates from the same research round, not selected Word cases repackaged as cards. Keep the card visual output separate from the main report.
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
- one `项目参考卡片` folder with five candidate cards by default;
- one `链接.txt`.

Medium is not “cards only”. It is a deep-template reduction.
Do not create a cover/title/summary page inside the Word report by default. The report starts directly with `NO1`.
Default: output five candidate cards. Card visuals are candidate references, meaning almost-selected backup projects or supplementary visual clues. The five default cards must come from near-miss candidates from the same research round, not selected Word cases repackaged as cards. Keep them separate from the main report.

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

Shallow mode still does not output cards by default.

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

## Expert Mode Output

Use when the user needs a precise professional answer rather than broad inspiration. Expert Mode is the fifth mode, but it is also an intent router: confirm what the user cares about before choosing the output depth and format.

Default output:

- one report named `专项模式_[user topic].docx`;
- one `链接.txt` source-link list;
- one `更多单点可能性` folder with 8 inspiration cards by default.

Expert Mode Word report is mandatory. Word 文档 cannot be removed from Expert Mode, even when the request is mainly about aesthetics, material, form, mood, or visual feeling. The cards are a divergent-thinking supplement, not a substitute for the Word report.

### Expert Mode Confirmation Template

When the user has already stated the direction, quantity, and whether cards are needed, use this concise pre-search confirmation instead of a long explanation. Keep the wording short and human. Replace bracketed fields with the current task content.

```text
本次我会按专项模式：[方向] 来走。

Word 文档：[数量] 个真实案例/真实项目参考，重点看：[核心关注点]。

筛选重点：[筛选关键词 1]、[筛选关键词 2]、[筛选关键词 3]、[筛选关键词 4]，以及哪些做法适合转译到真实项目里。

输出结构：[专项模式_用户需求_数量个参考.docx] + 8 张更多单点可能性卡片 + 链接.txt。

你确认后我就开始。
```

Do not remove the Word document from the Expert Mode output structure. If the user explicitly refuses cards, cards may be omitted, but the Word report must remain. If the user has not stated quantity, recommend the lightest useful first-round Word quantity and ask for confirmation. If the user has already replied with clear confirmation, proceed with research and do not repeat this block again.

When Expert Mode outputs both a Word report and inspiration cards, keep their roles separate: the Word report uses verified real cases or traceable project references; the inspiration cards are visual clues and may mainly come from Pinterest, Behance, image search, or similar platforms. Inspiration cards do not need to be constrained by whether each item is a verified real project, but they must not invent project facts, designers, locations, years, or official links.

Expert Mode recency applies to inspiration cards when requested. If the user says recent, recent years, 近几年, 最近几年, 近三年, or similar, recent-years wording binds both Word cases and inspiration cards. The `更多单点可能性` folder should then prioritize recent visual clues and recent design language, not old iconic projects used as easy filler. Older references may appear only as a limited `classic divergent clue` when clearly labelled in `链接.txt` or card notes.

Flat graphic/brand mode exception across all five modes: when the task is menu layout, cafe menu design, poster layout, brand identity, visual identity, packaging visual system, typography hierarchy, information hierarchy, or another flat graphic-design reference, use Behance only by default for the first pass. Do not default to Pinterest for this category. If Behance is insufficient, ask before expanding to Pinterest or other visual platforms. In the Word and link file, describe these as Behance portfolio/visual-system references unless the page clearly proves built/project status. When Expert Mode outputs `更多单点可能性` cards for this category, those cards also default to Behance only.

When Expert Mode outputs inspiration cards, the card folder must be named `更多单点可能性`. The cards should use short conversational Chinese, exactly three short sentences, and no `保留价值` footer; keep only a weak source label on the card and place full URLs in `链接.txt` when available.

No Word-card overlap in Expert Mode. When Expert Mode outputs both a Word report and inspiration cards, the Word report and inspiration cards must be disjoint sets. Do not reuse selected Word cases, their same project images, same source pages, or same project names as Expert Mode inspiration cards. The Word report is for verified/traceable cases that carry the argument; the cards are for extra visual directions and option expansion. If a candidate has already entered the Word report, remove it from the card pool and replace it with a different visual clue, adjacent detail, or non-selected candidate. Only break this rule when the user explicitly asks for a card version of the selected Word cases.

Expert Mode first confirms one of these types:

| Expert intent | Default quantity | Output emphasis |
|---|---:|---|
| 审美标杆型 | 8-12 个视觉/项目参考 | 为什么好看,形式语言,材料表达,氛围方法,适合转译到哪里 |
| 单点专项型 | 6-10 个专项参考 | 这个点解决什么问题,可借鉴做法,适用场景,不能误用的地方 |
| 落地控制型 | 4-6 个强相关案例 | 低成本,施工难度,维护,运营,材料替代,简化转译 |
| 风险避坑型 | 3-5 个高可信案例 plus necessary 专项线索 | 消防,无障碍,安全,维护,规范边界,失败风险; only as design reference |
| 综合专业型 | 4-6 个精品案例 | 审美,方法,落地,风险一起判断 |

### 专家模式输出重点

- If the user asks for "最好看的", "审美最高", "氛围", "材料表达", or "形式", do not force a cost/construction table. Focus on visual and design-language transfer.
- If the user asks for one specific element such as 柜台,坡道,座椅,灯光,导视,廊架, or材料, treat that element as the main research object. Do not call it "局部参考"; use `专项参考`, `单点参考`, `视觉线索`, or `现场线索`.
- If the user asks for low cost, implementation, maintenance, or risk, include 可借鉴点,不能照搬点,风险提醒.
- If a visual or social source is useful but not verified, mark it clearly as 视觉线索,现场线索, or 待验证来源 and do not invent project facts.
- For `单点专项型` Word output, use the approved bundled template `assets/templates/expert_mode_template.docx`. Do not reuse deep, medium, shallow, or visual-card structure for this output. If the user only wants images, mood, material, or form clues and has not chosen Expert Mode, route them to Visual Search; once Expert Mode is confirmed, the Word report remains mandatory and cards only broaden the inspiration pool.

### 小点专项收缩标准

Use this standard when the user's expert request is a small element rather than a complete project type. Deep-mode text can remain available for full project research, but small-point expert search needs a narrower standard.

Before research, perform `突破口确认`:

1. Restate the user's small point.
2. Translate it into 3-5 possible design breakthrough points.
3. Recommend 1-2 main breakthrough points for the first round.
4. Ask the user to confirm, or state a default if the user wants speed.

For each selected result, classify it as one of:

- `主突破点强相关`: directly shows the confirmed small point and can be used as a main reference.
- `相邻专项参考`: not the same scene, but the small-point method is transferable.
- `视觉线索/现场线索`: useful for style, mood, composition, or local realism, but not verified as a project.
- `淘汰`: attractive image or project, but it does not answer the confirmed breakthrough point.

Do not mix all directions into one result pool. 中文执行规则：不混成一个结果池。If a query such as `售楼部柜体` can mean 书墙,水吧柜,背景柜,材料展示墙,模型展示柜, and生活方式陈列, split the result list by the confirmed breakthrough point. A beautiful sales-center project that does not clearly show the target small point should be downgraded to background reference or removed.

Before writing a single-point Expert Mode report, apply the small-point quality gate before writing. Do not let an ordinary cabinet image, ordinary lamp image, ordinary ramp image, or generic decoration image enter the Word report only because it matches the object name. Each selected Word case must explain the user's confirmed point through a visible strategy: object-as-space, object-as-interface, object-as-path, object-as-service, object-as-light, object-as-material system, object-as-memory point, or another clear professional logic.

For home storage/cabinet topics, avoid ordinary full-house customization examples unless the case turns storage into a spatial system. Prefer cases where the cabinet becomes a wall/interface, lifestyle display, hidden storage layer, proportion-control tool, lighting/material carrier, or daily-behavior organizer. If the case is only a nice wardrobe or catalogue cabinet, keep it out of the Word report and at most use it as a loose visual clue.

For Expert Mode Word cases, stay in the same requested object category unless the user asks for adjacent expansion. If the confirmed point is bench/seating, the counted Word cases must be benches, seating systems, or seat-related details; do not replace a weak bench candidate with a lamp, lighting product, signage object, or unrelated furniture category.

Expert Mode inspiration cards can be more divergent than the Word cases. They may include adjacent inspiration, analogy references, plane references, material references, object references, or atmosphere references when those images help the designer think through the confirmed point. Each card still must explain its single-point help clearly; adjacency cannot become random filler.

### 专项模式 Word 模板格式

For `单点专项型` Word reports, use `assets/templates/expert_mode_template.docx` as the fixed text and layout contract. The report is not a complete project introduction. It is a case-judgment page for one special point: why this reference is usable, what the user should look at, how to explain it in a presentation, where it applies, and where it cannot be copied.

Use the approved section order exactly:

1. `专项命题`: name the user's specific object and the current judgment focus.
2. `核心判断`: one concise judgment sentence. It should explain how this reference responds to the user's special point, not just say it is modern, attractive, or high-end.
3. Basic information table: keep `策略归类`, `项目类型`, and `设计机构` rows. Use compact source labels in this table; the full original URL is written later in section `6. 原网址 / 延伸查看`.
4. One representative image: use the image that best shows the special point. Do not use browser UI screenshots, search-result screenshots, or unrelated whole-project beauty shots when a stronger detail image is available.
5. `1. 选用逻辑`: use the four-row logic table:
   - `专项矛盾`: what problem or tension this reference answers;
   - `转译动作`: what the case actually does;
   - `参考价值`: why this is useful for the user's current decision;
   - `适用前提`: where and when it applies, including limits.
   Do not add extra rows such as `落地表达`, `维护要点`, `Xxxx`, or free-form rows. The finalized template uses exactly these four rows.
6. `2. 与本次重点的关系`: write two short paragraphs. Paragraph 1 explains the direct relationship between the case and the user's special point. Paragraph 2 expands around the user's priority, such as aesthetics, material, cost, atmosphere, function, construction, or risk.
7. `3. 汇报表达口径`: provide one human presentation sentence that can be placed into a design report. It should sound like a designer explaining a strategy to a client, not a database abstract.
8. `4. 适用场景判断`: keep the compact labels `适合` and `判断重点`, but write the content as a case-specific applicability judgment around 用户这次确认的核心关注点.
9. `5. 照搬风险底线`: keep this compact with `风险底线` and `落地控制`.
10. `6. 原网址 / 延伸查看`: write the original source URL inside the Word case block, plus a short image note when the image is a screenshot/cropped preview or low-quality fallback.

Section 4 writing rule:

- 用户这次确认的核心关注点 must control the section. If the user cares about 冲击力和导入感, judge whether this case can create the first visual hit, whether it can actually guide people inward, and what condition makes it fail. If the user cares about 审美, 成本, 落地, 风险, 材料, 氛围, or 传播性, write through that priority instead.
- 每个案例的适用判断必须有不同判断角度. For example, one case may be a strong传播入口, another may be a quiet导入界面, another may be a low-cost前场触点, and another may depend on content operation. Do not flatten them into the same wording.
- 不要让每个案例都以同一套 "更适合... / 判断重点..." stock phrasing开头. The labels can stay fixed, but the sentence rhythm should sound like a designer making a live judgment for this specific user.
- Keep it concise: usually 1-2 natural sentences under `适合` and 1 focused sentence under `判断重点`. Do not turn it into a long analysis paragraph; the detailed reasoning belongs in section 2.

Formatting rules:

- Preserve the template's approved typography, bolding, table structure, image position, and section order.
- When rendering the Word file, copy/open `assets/templates/expert_mode_template.docx` as the base document and fill its existing fields. Do not create a blank Word document and insert the template into it; that can lose the approved page setup and make tables or headings appear compressed in Word.
- Do not manually reset page margins or table widths for Expert Mode output. The template's page setup and table widths are the contract.
- When replacing placeholder paragraphs, replace only the paragraph text, not the paragraph mark. Preserving the paragraph mark keeps the approved heading line spacing, font scaling, and table-adjacent spacing intact.
- Main body text is generally not bold; bold only the small labels that the approved template already emphasizes.
- Do not add extra headings or merge sections.
- Do not expand the `1. 选用逻辑` table beyond its four approved rows.
- Do not turn sections 4 and 5 into long analysis paragraphs. They only lock the applicability boundary and risk bottom line.
- If the same special-point report contains several selected references, repeat the same template block once per reference and start each block on a new page.

Template field order:

```text
ID + reference name
专项命题
核心判断
基础信息：策略归类｜项目类型｜设计机构/地点年份/来源
[one representative image]
1. 选用逻辑
2. 与本次重点的关系
3. 汇报表达口径
4. 适用场景判断
5. 照搬风险底线
6. 原网址 / 延伸查看
```

Expert Mode is the exception to the general link rule: show the selected case's full URL inside the Word body under section `6. 原网址 / 延伸查看`, and still keep the consolidated source list in `链接.txt`. Use emphasis only where the approved template already has emphasis.

### Expert Word Renderer

When Expert Mode case content has already been researched, verified, and prepared as structured data, prefer `scripts/render_expert_report.ps1` to produce the Word report. This renderer fills `assets/templates/expert_mode_template.docx` and creates the matching `链接.txt`.

Use the renderer only after the research phase has prepared:

- topic and original user request;
- selected case list with `no`, `title`, `topic_line`, `core`, `strategy`, `project_type`, `designer`, `url`, and local representative `image_path`;
- four `1. 选用逻辑` values: `logic_conflict`, `logic_action`, `logic_value`, and `logic_condition`;
- three relationship paragraphs: `relation_1`, `relation_2`, and `relation_3`;
- one report sentence: `presentation`;
- applicability and risk fields: `suitable`, `suitable_focus`, `risk`, and `control`.
- optional `image_note` or `source_note`, especially when the representative image is a screenshot/cropped preview or low-quality fallback. If omitted, the renderer writes a neutral source-viewing note.

The renderer does not search the web, verify links, choose cases, choose the representative论点图, write design judgment, or render inspiration cards. Those steps remain part of Insight-Space research. If the template, JSON input, required field, or local image path is missing, the renderer should fail rather than silently generating a broken report.

After changing the Expert renderer or Expert template, run `tests/test_expert_report_renderer.ps1`.

For `消防登高面` expert reports, first classify each selected case into one dominant strategy branch and write through that branch:

| Strategy branch | Typical scene | Writing focus |
|---|---|---|
| 前置协调型 | scheme-stage projects where fire, traffic, and landscape can still move | coordinate hard fire conditions before aesthetic treatment |
| 骨架整合型 | public buildings, exhibition halls, cultural centers, large public sites | merge fire surface into path, plaza, and landscape skeleton |
| 界面转译型 | commercial entrances, office ground floors, industrial courtyards | turn hard fire ground into arrival and staying interface |
| 地形柔化型 | residential courtyards, community spaces, continuous fire surfaces | soften hard ground with terrain, planting, and movable furniture |
| 轻运营激活型 | commercial streets, long fire plazas, limited-budget fields | activate required clear ground with movable furniture and events |
| 主题叙事型 | show areas, resort housing, marketing scenes | dissolve hard fire ground through material and spatial narrative |

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
说明：深度/中度模式默认输出 5 张候选参考卡片；浅度模式默认不输出卡片。卡片为差一点入选 Word 文档的候选参考，不代表价值排序。

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
- Expert Mode should be precise to the user's confirmed intent; do not turn every expert request into cost/construction analysis.
- Card visuals should support browsing and selection only when requested or when using visual search mode.
- Link text files support source checking.
- All outputs must help a designer decide quickly.
