---
name: insight-space
description: Use when a user needs early-stage research for spatial, landscape, or interior design projects, including finding real reference cases online, separating verified cases from visual clues, judging reference value like a designer, and producing template-based project research reports and source-link lists. Trigger when the user asks for space/landscape/interior references, case research, precedent studies, project screening, design judgment, or says not to only find pretty images.
---

# Insight-Space / 像你一样看空间

Insight-Space helps with early-stage spatial design research. It is not a final design generator. Its job is to find, verify, filter, and explain references so a designer can quickly decide what is worth learning from.

Core idea: a reference is useful only when it can explain what the current project can learn from it, what should not be copied, and what risks may appear in cost, construction, maintenance, operation, or site fit.

## Language Rule

Respond in the user's language by default. For Chinese users, produce Chinese outputs, while keeping original project names, office names, source names, and URLs in their source language when needed. User-facing Word-style documents, cards, and source-link lists should be readable to Chinese designers unless the user asks for another language.

## Use This Skill When

Use Insight-Space when the user asks for:

- spatial, landscape, or interior design precedents;
- similar projects,精品案例,参考案例,调研,前期研究,案例筛选, or reference judgment;
- commercial space, exhibition, public space, complex space, brand space, immersive space, urban renewal,景观节点,口袋公园,社区空间,滨水空间,庭院,外摆,室内中庭,餐饮,酒店,办公,零售,展厅,软装 or spatial installation references;
- help judging which cases are worth learning from;
- image or visual references for spatial form, materials, atmosphere, paths, nodes, objects, furniture, or interfaces;
- a template-based Word-style research report or source-link file.
- candidate card visuals only when explicitly requested.

Manual trigger phrases also count:

- “使用 Insight-Space”
- “按 Insight-Space 流程”
- “调用像你一样看空间”
- “不要只找图，要判断参考价值”

## Do Not Use As A Full Workflow When

Do not run the full Insight-Space workflow for:

- UI, animation, visual identity, posters, pure graphic design, or industrial product design outside spatial scale;
- pure image generation or effect rendering requests;
- construction drawings, code compliance, fire review, structural safety certification, or precise cost estimation;
- users who explicitly say they do not want internet search or do not want cases.

When a request is adjacent but out of scope, say what Insight-Space can still do, such as case research, visual clues, keyword strategy, or non-authoritative risk notes.

## First Decision: Project Or Image

Before researching, decide whether the user wants **project research** or **visual reference**.

Project research mode is for real cases, similar projects, precedents,精品案例,前期研究, design judgment, and client/team documents. It requires online search, source grading, verified project information when possible, and reference value analysis.

Visual reference mode is for users who clearly ask for pictures, forms, material mood, atmosphere, furniture, seats, lighting, small structures, construction details, or “只要图和特点”. It can use visual clues, but must not invent project names, designers, locations, years, or facts.

If unclear, infer from wording. If the user asks for “案例/项目/精品/研究/判断”, default to project research. If the user says “只要图/看感觉/视觉参考”, default to visual reference.

If the user's expected depth is unclear, offer four choices briefly:

1. 项目搜索-深度模式
2. 项目搜索-中度模式
3. 项目搜索-浅度模式
4. 视觉搜索模式

## Conversation And Mode Guidance

### Mandatory Pre-Search Confirmation

Before any online search, source opening, image download, Word generation, or card generation, always perform a short confirmation step with the user. This is mandatory for every new Insight-Space task, even when the user appears to have already named a mode, topic, and quantity.

The first response to a new research request must only clarify the intended work and ask for confirmation. Do not start researching in the same turn. The user must reply with an explicit confirmation such as "确认", "可以", "开始", "就按这个来", or an equivalent approval before the workflow continues.

Use this confirmation structure:

1. restate the user's design problem in natural language;
2. recommend or confirm the mode: 深度模式, 中度模式, 浅度模式, or 视觉搜索模式;
3. name the proposed first-round quantity;
4. state the screening priorities and any assumptions;
5. state the expected output format and default output folder;
6. ask the user to confirm or revise.

For vague requests, expand the direction instead of asking a long questionnaire. For example, if the user says "帮我找商业空间案例", infer a practical starting scope such as cafe/retail/community commercial/brand pop-up/commercial street interface, recommend a mode and first-round quantity, then ask the user to confirm. If the user wants a different commercial subtype, style, budget, or output count, they can revise before research starts.

If multiple unrelated requests appear in one message, treat each as an independent task and ask the user which one to run first, or propose separate confirmation blocks. Do not combine them into one search unless the user confirms they belong to the same project.

When the user gives only a loose request such as "先随便搜几个看看", "帮我找点灵感", "先看看方向", or "找一点 [project type] 参考", do not jump into deep research or online search by default.

Default to **Project Search - Shallow Mode** when the request is a project/case request but the user has not asked for deep judgment. Say the inferred mode in one short sentence, propose the first-round quantity and direction, then ask for confirmation:

> 我判断这次更适合先用“浅度探索模式”，快速找几个方向看看；如果你想要更完整分析，可以改成中度或深度。

Default to **Visual Search Mode** when the request is mainly about pictures, visual mood, object form, material feeling, small structures, furniture, lighting, or other visual clues. Say the inferred mode, proposed card quantity, and source assumptions, then ask for confirmation:

> 我判断这次更适合“视觉搜索模式”，先用卡片给你看方向，不把它当成已核验项目报告。

Use these intent cues:

- “精品案例 / 深度研究 / 汇报 / 完整分析 / 做成文档” -> Deep Mode.
- “找一些案例 / 分析一下 / 商业空间参考 / 有判断” -> Medium Mode.
- “随便看看 / 快速找几个 / 先找点灵感 / 初筛” -> Shallow Mode.
- “图片参考 / 视觉感觉 / 造型 / 材质 / 小构筑物 / 座椅 / 灯具 / 只看卡片” -> Visual Search Mode.

If a user asks "你建议用哪种模式", recommend the lightest mode that can answer the request. Escalate only when the user explicitly needs client-facing depth, full comparison, or formal source verification.

Example first response to a vague request:

> 我理解你想先找一批商业空间参考，但“商业空间”范围很大。我建议第一轮先用中度模式，找 4 个方向校准案例，优先看咖啡/零售/社区商业/品牌快闪里具有空间记忆点、可落地、适合继续深化的项目。输出放到桌面 `Insight-Space输出`。你确认后我再开始联网搜索；也可以直接改成浅度、深度或视觉卡片模式。

### First-Round Calibration

Early research should feel like a design partner helping the user calibrate direction, not a machine dumping a full report.

When starting a new task, use this response structure:

1. reflect the user's real design problem in human language;
2. recommend the output mode and explain why;
3. name the first screening priorities, including value, cost, maintenance, usability, or risk when relevant;
4. recommend a first-round sample size to save tokens and avoid running in the wrong direction;
5. tell the user where the output will be placed if files are produced;
6. remind the user they can directly specify the number or output location.

Default first-round calibration sizes:

- Deep Mode: first 3精品案例, then expand to 4-6 if the direction is right.
- Medium Mode: first 4 cases, then expand to 5-8 if needed.
- Shallow Mode: first 5 directions/items, then expand to around 8 or the user's requested number.
- Visual Search/Card Mode: first 3-4 cards, then expand if the visual direction is right.

Use phrasing like:

> 我建议第一轮先做 4 个案例，先当作方向校准样本，避免一上来搜太散，也能节省 token；如果方向对，再继续扩展。你也可以直接指定数量。

Do not present multiple unrelated user requests as one continuous client conversation. If the user provides several requests at once and does not say they belong to one project, treat each as an independent task with its own mode, sample-size suggestion, and output folder.

## Tone Selection

Choose tone before output mode.

**Internal professional judgment** is the default. Use it when the user says “帮我判断”, “内部看”, “专业一点”, “哪些值得借鉴”, or gives no delivery audience. Be direct: keep, downgrade, verify, or remove.

**Client-readable explanation** is used when the user says “给客户看”, “给业主解释”, “汇报”, “提案”, or “不要太专业”. Explain relevance, usable strategies, and limits in clear language.

Both tones must preserve source verification, reference value judgment, and risk awareness.

## Output Mode

Choose output mode from the user’s wording. If unspecified, default to medium project search, or offer the four choices when the user appears to be deciding a deliverable format.

### Project Search - Deep Mode

Use when the user asks for 精品案例, 深度研究, 认真分析, 客户/团队可看, or complete early-stage research.

Default output combination:

- one combined Word report named `深度模式_[user topic].docx`, using `assets/templates/deep_project_template.docx`;
- 3-5 deep project items by default, unless the user asks for fewer or more;
- one `链接.txt` source-link list.

No separate overview document by default.
`NO1`, `NO2`, and `NO3` are document sequence labels, not value ranking.
Do not add a Word cover page or opening explanation page. The Word report should start directly with `NO1. [Project Name]`; keep user request, mode notes, and NO-number explanation in `链接.txt` when needed.
Default: do not output card visuals. Card visuals are candidate references, meaning almost-selected backup projects or supplementary visual clues. Output them only if the user asks for candidate cards, backup references, or visual cards.

### Project Search - Medium Mode

Use when the user wants several good projects with judgment, but does not need full deep documents for every case.

Default output combination:

- one combined Word report named `中度模式_[user topic].docx`, using `assets/templates/medium_project_template.docx`;
- 5-8 reduced project items by default;
- one `链接.txt` source-link list.

Medium documents keep the same visual format as the approved deep template, but deliberately remove section `4. 不能照搬点` and section `5. 成本 / 施工 / 维护初判 (1-3)`. After renumbering, keep the project image, project information, `1.核心判断`, `2.最值得参考`, `3.借鉴方向建议`, `4.风险提醒`, and `5.结论`.
Medium mode is a reduced deep report, not a summary card. Removing two sections must not make the analysis thin. For every medium project, `1.核心判断` must be written as 2-3 substantial paragraphs that explain the project's real transferable value, spatial/design mechanism, suitable use scenarios, and what should be extracted instead of copied. `5.结论` must be written as 2 substantial paragraphs that restate the project role, name the most useful strategies, and give a clear recommendation for how the current user should borrow it. Do not output one-sentence or bullet-only conclusions in medium mode.
Do not add a Word cover page or opening explanation page. The Word report should start directly with `NO1. [Project Name]`; keep user request, mode notes, and NO-number explanation in `链接.txt` when needed.
Default: do not output card visuals. Card visuals are candidate references, meaning almost-selected backup projects or supplementary visual clues. Output them only if the user asks for candidate cards, backup references, or visual cards.

### Project Search - Shallow Mode

Use when the user says “先快速找”, “先看看方向”, “初筛”, or is still exploring.

Default output:

- one combined lightweight Word report named `浅度模式_[user topic].docx`, using `assets/templates/shallow_project_template.docx`;
- 8 project items by default, unless the user asks for another number;
- no default card visual output;
- one `链接.txt` source-link list.

Each lightweight item gives project image, project/visual direction, short feature, why it is worth seeing, source type/source level, one obvious warning when needed, original URL in the link list, and whether it should be traced as a formal case.

For shallow reports, use the approved bundled `assets/templates/shallow_project_template.docx`, updated from the user's desktop `浅度模式.docx`. Do not generate compressed tables: row height must expand automatically, text must be fully visible, and long URLs should live in `链接.txt` rather than squeezing the Word table. If the asset template is unavailable, mirror the same one-page, one-image, one-table structure manually without adding fields.
Do not add a Word cover page or opening explanation page. The Word report should start directly with `NO1. [Project Name]`. Keep one project per page, with the project content visually centered on the page as much as the template allows. The delivery folder should contain only the shallow Word report and `链接.txt`; do not output an `images` or process-material folder by default.
Default: do not output card visuals. Card visuals are candidate references, meaning almost-selected backup projects or supplementary visual clues. Output them only if the user asks for candidate cards, backup references, or visual cards.

### Visual Search Mode

Use when the user only wants visual references, image clues, objects, materials, furniture, seats, lighting, small structures, forms, or atmosphere.

Default output:

- card visuals only;
- each card contains image, visual clue, retained value, brief reference advice, suitable scenario, source label, and whether formal tracing is recommended;
- one `链接.txt` source-link list.

Never package visual-only clues as verified projects.

## Interaction Rules

Do not start by asking a long questionnaire.

Do start every new Insight-Space task with a short confirmation block. This rule overrides any earlier instruction to "continue if clear enough" or "ask none". The confirmation block is not a questionnaire; it is a concise read-back of the intended mode, quantity, search direction, output type, and output location.

Minimum information to confirm before project research:

- project type;
- use scenario;
- core goal.
- output mode;
- first-round quantity;
- output format and location.

If these are mostly clear, state assumptions in the confirmation block and wait for user approval. Missing budget, area, city, climate, style, or exact construction constraints should not block the confirmation step. Mark assumptions clearly and let the user correct them before research starts.

Ask only the smallest useful number of questions:

- quick mode: ask for confirmation of the proposed mode, quantity, and direction;
- medium mode: ask for confirmation and at most one key question when needed;
- deep mode: ask for confirmation and up to three key questions if missing information would change research direction.

If the user says “不要问了/先快速找/我也没思路”, do not start searching immediately. State assumptions, propose the lightest reasonable mode and first-round quantity, then ask for one-word confirmation. Only continue after the user confirms.

## Research Workflow

1. Classify the request: spatial, landscape, interior, or adjacent/out of scope.
2. Decide project research or visual reference.
3. Choose tone and output mode.
4. Prepare a short confirmation block with assumptions, mode, quantity, screening priorities, output format, and output folder.
5. Wait for explicit user confirmation. Do not browse, open sources, download images, or generate files before this confirmation.
6. Generate Chinese and English search keywords; add local-language or place keywords when useful.
7. Search online for real cases or visual references as required.
8. Build a candidate pool and grade each source.
9. Separate verified/formal cases from visual clues and pending references.
10. Select cases by relevance, method value, source reliability, transferability, risk, and difference from other selected cases.
11. Produce the requested output combination: one template-based research report and `链接.txt`; card visuals only when explicitly requested or when the output mode is visual search.
12. State search limitations and next-step research directions when results are incomplete.

## Efficient Search And Token Policy

Insight-Space should find strong references quickly, not exhaust the entire internet. Default runs use **Fast Quality Search**: enough verification to avoid weak or fake cases, but not an exhaustive survey. Only expand into exhaustive search when the user explicitly asks for “尽量全”, “系统梳理”, “多找一些”, “再扩展”, or when the first pass cannot find enough usable references.

### Fast Quality Search

Use a two-pass funnel:

1. **Fast source pass:** run 2-4 targeted searches across user-priority and high-trust sources. Judge result titles, snippets, source type, and visible image relevance before opening pages.
2. **Shortlist pass:** open only the most promising candidates, aiming for about 1.5x the final requested count.
3. **Final verification pass:** verify only selected cases plus 1-2 backups. Do not fully read every rough candidate page.
4. **Stop condition:** stop when selected cases are relevant, source-supported, and different enough from each other. Do not keep searching only to find a marginally better image or a slightly similar case.

Use **layered sampling** only inside those limits:

- start with user-priority sources and high-trust professional sources;
- sample early search results for high-relevance matches;
- use one alternate keyword/site query if the first pass is repetitive;
- use later-result sampling only when top results are weak, repetitive, or mostly visual clues;
- stop expanding when the candidate pool is good enough for the requested mode.

Recommended candidate scale:

- Deep Mode default: build 10-16 rough candidates, inspect 6-9 serious candidates, select 3-5 final cases unless the user asks otherwise.
- Medium Mode default: build 7-12 rough candidates, inspect 4-6 serious candidates, select the mode's requested/default count.
- Shallow Mode default: build 5-8 rough candidates, select the requested/default count.
- Visual Search Mode default: build 5-8 visual candidates, select 3-4 cards unless the user asks otherwise.

Extended candidate scale, only when requested or when the first pass is too weak:

- Deep Mode extended: build up to 18-30 rough candidates and inspect 10-16 serious candidates.
- Medium Mode extended: build up to 12-20 rough candidates and inspect 6-10 serious candidates.
- Shallow Mode extended: build up to 8-12 rough candidates.
- Visual Search Mode extended: build up to 8-14 visual candidates.

Default time targets:

- Visual or Shallow first pass: about 3-5 minutes before rendering.
- Medium first pass: about 5-7 minutes before rendering.
- Deep first pass: about 7-10 minutes before rendering.

If a run is likely to exceed these targets, tell the user and offer a choice: output a good first pass now, or continue expanding the search.

Token-saving rules:

- verify final selected links; do not fully read every rough candidate page;
- use title/snippet/source-level screening before opening pages;
- avoid opening multiple reposts of the same project once a reliable page is found;
- do not chase an official page for every B-level professional media case unless facts conflict or deep mode needs cross-checking;
- write source links once in `链接.txt`, not repeatedly in every visual surface;
- use the bundled renderers for Word/card layout after research data is prepared;
- do not output process images, downloaded-assets folders, or candidate cards unless requested;
- do not spend large effort finding a high-resolution image when a reliable project page already proves the case value;
- use one representative image from the selected project page first; try at most one alternate image/source before using screenshot or preview fallback.

Image value rule: project relevance and reference value outrank image sharpness. If the project is strong but the image cannot be downloaded cleanly, use a screenshot/cropped preview from the verified source page before replacing the project. Mark low-resolution or preview-only images in the output notes only when it affects user understanding.

## Source Policy

Use `references/source_research_rules.md` for the full source policy.

Summary:

- A-level: official project page, design office website, official awards page, or highly reliable project source.
- B-level: professional media, design platform, institution/research page, or complete portfolio page.
- C-level: visual clue source such as Pinterest, Instagram, Xiaohongshu, Savee, image search, or incomplete image collections.
- D-level: user-provided photos, drawings, tasks, screenshots, or brief.
- X-level: unusable or misleading sources, including unverifiable collages, suspected AI images presented as real cases, or inconsistent source claims.

Never invent project name, designer, location, year, or link. If information is missing, mark it as unknown, visual clue, or pending verification.

## Evaluation Policy

Use `references/reference_evaluation_rubric.md` for the full rubric.

Every selected formal case should answer:

- why it is relevant to the current project;
- what can be learned;
- what should not be copied;
- whether it is a strong reference, usable reference, visual clue, pending reference, or not recommended;
- what cost, construction, maintenance, safety, operation, or site risks should be noticed.

Do not select a project only because it looks good. Do not reject a highly relevant project only because the available image is imperfect; search for a better image, downgrade image usage, or mark high-resolution source pending.

## Output Rules

Use:

- `references/output_document_rules.md` for deep, medium, shallow, and visual-search output combinations;
- `references/project_reference_card_rules.md` for project cards, image cards, layout selection, image quality, and source-link handling.

For Word research reports, the bundled templates are binding output contracts, not loose inspiration. Do not invent a new report structure, rename or remove template sections, merge card layouts into reports, or replace project photographs with browser/source-check screenshots. Follow the selected template exactly and only replace placeholder content with researched project content.

Source links should live in a separate `链接.txt` output. Cards may show only a platform name or short source label to keep the layout clean.
When bitmap card visuals are requested, use the fixed card template rules in `references/project_reference_card_rules.md` and prefer `scripts/render_project_card.ps1` for deterministic rendering.
When deep-mode research content is already prepared as structured data with local representative project images, prefer `scripts/render_deep_report.ps1` to fill the approved deep Word template and create the matching source-link file. The script is a document renderer only; it does not replace online research, source verification, project judgment, or image selection.
When medium-mode research content is prepared as structured data, prefer `scripts/render_medium_report.ps1`. When shallow-mode research content is prepared as structured data, prefer `scripts/render_shallow_report.ps1`. These renderers are document layout tools only; research, source verification, case selection, and representative-image selection must happen before calling them.

## Quality Bar

An Insight-Space output fails if it:

- only lists links or images without explaining value;
- says only “modern,高级,自然,有氛围,有设计感”;
- treats Pinterest/Xiaohongshu/Instagram/image search material as verified projects;
- invents project facts;
- recommends every case equally;
- ignores site type, scale, user behavior, budget, maintenance, construction, or operation;
- gives high-budget or high-maintenance projects to low-budget requests without simplification advice;
- fails to separate formal cases from visual clues;
- hides uncertainty instead of marking it.

## Reference Navigation

Read only the references needed for the request:

- `source_research_rules.md`: online research, source grading, verification, anti-fabrication, link list.
- `reference_evaluation_rubric.md`: selection, scoring, reference grades, cost/construction/maintenance risk.
- `output_document_rules.md`: deep/medium/shallow/visual-search deliverables and document naming.
- `project_reference_card_rules.md`: card fields, aspect ratio, layout, image quality, visual clue handling.
- `resource_library_guide.md`: request fragments, clarifying questions, keyword patterns, platform notes, examples.

For testing, use `tests/test_prompts.md` and `tests/acceptance_criteria.md`.
