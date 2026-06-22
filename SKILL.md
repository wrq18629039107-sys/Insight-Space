---
name: insight-space
description: Use when a user needs design reference research for spatial projects or adjacent design disciplines, including verified cases, visual clues, expert-mode single-point references, aesthetic benchmarks, implementation/risk judgment, and template-based Word reports or source-link lists. Trigger on case research, precedent study, source screening, specialist design questions, requests not to only find pretty images, or shortcut phrases such as 调用IS, 调用 IS, 使用 Insight-Space, 按 Insight-Space 流程, 调用像你一样看空间.
---

# Insight-Space / 像你一样看空间

Insight-Space helps with early-stage spatial design research. It is not a final design generator. Its job is to find, verify, filter, and explain references so a designer can quickly decide what is worth learning from.

Core idea: a reference is useful only when it can explain what the current project can learn from it, what should not be copied, and what risks may appear in cost, construction, maintenance, operation, or site fit.

## Professional Scope And Source Routing

Insight-Space V2.0 should first judge the user's professional field, then choose where to search. The principle is: 先判断专业，再判断去哪里搜.

Deep, Medium, Shallow, and Visual Search modes still fit best when the user asks for broad spatial/project references. Expert Mode / 专项模式 is the better default when the user asks about a single point, object, element, material expression, visual system, product detail, brand graphic, sculpture, public-art element, or other precise design reference.

V2.0 can support 环境设计, 建筑学, 公共艺术, 雕塑, 视觉传达, 产品设计, 工艺美术, and 数字媒体艺术 through source routing. This does not mean every discipline receives a full custom workflow. It means the search pool should match the discipline before mode execution starts. Animation and photography are not main V2.0 target disciplines because static reference cards and Word reports cannot properly judge motion rhythm, sequence, sound, shooting logic, lens language, or photo-series context.

For the complete professional source-priority table, read `references/source_research_rules.md` before online search when the request is not clearly standard spatial research.

## Language Rule

Respond in the user's language by default. For Chinese users, produce Chinese outputs, while keeping original project names, office names, source names, and URLs in their source language when needed. User-facing Word-style documents, cards, and source-link lists should be readable to Chinese designers unless the user asks for another language.

## Use This Skill When

Use Insight-Space when the user asks for:

- spatial, landscape, or interior design precedents;
- similar projects,精品案例,参考案例,调研,前期研究,案例筛选, or reference judgment;
- commercial space, exhibition, public space, complex space, brand space, immersive space, urban renewal,景观节点,口袋公园,社区空间,滨水空间,庭院,外摆,室内中庭,餐饮,酒店,办公,零售,展厅,软装 or spatial installation references;
- help judging which cases are worth learning from;
- expert-mode help for precise spatial questions, such as 专项节点,单点做法,审美标杆,落地控制,消防坡道,无障碍,柜台,导视,座椅,廊架,灯光,材料表达, or risk avoidance;
- image or visual references for spatial form, materials, atmosphere, paths, nodes, objects, furniture, or interfaces;
- a template-based Word-style research report or source-link file.
- candidate card visuals only when explicitly requested.

Manual trigger phrases also count:

- “调用IS”
- “调用 IS”
- “使用 Insight-Space”
- “按 Insight-Space 流程”
- “调用像你一样看空间”
- “不要只找图，要判断参考价值”

## Do Not Use As A Full Workflow When

Do not run the full spatial Insight-Space workflow for:

- UI, animation, photography, visual identity, posters, pure graphic design, or industrial product design outside spatial scale, unless the user confirms a constrained Expert Mode / 专项模式 or lightweight visual-reference task that can be judged from static material;
- pure image generation or effect rendering requests;
- construction drawings, code compliance, fire review, structural safety certification, or precise cost estimation;
- users who explicitly say they do not want internet search or do not want cases.

When a request is adjacent but out of scope, say what Insight-Space can still do, such as case research, visual clues, keyword strategy, or non-authoritative risk notes.

Exception for flat graphic/brand tasks: when the user asks for graphic design, brand identity, menu layout, poster/layout, packaging visual system, typography hierarchy, information hierarchy, visual identity, or similar flat-visual references, run a constrained source-routed workflow rather than the full spatial workflow. Across all five modes, use Behance as the only default search/source platform for the first pass. Do not default to Pinterest, image search, or other visual platforms for these flat graphic/brand tasks unless the user explicitly asks for them or Behance cannot provide enough usable references and the user approves expansion. Mark Behance material as portfolio/visual-system reference, not as a verified built spatial project.

## First Decision: Project Or Image

Before researching, decide whether the user wants **project research** or **visual reference**.

Project research mode is for real cases, similar projects, precedents,精品案例,前期研究, design judgment, and client/team documents. It requires online search, source grading, verified project information when possible, and reference value analysis.

Visual reference mode is for users who clearly ask for pictures, forms, material mood, atmosphere, furniture, seats, lighting, small structures, construction details, or “只要图和特点”. It can use visual clues, but must not invent project names, designers, locations, years, or facts.

If unclear, infer from wording. If the user asks for “案例/项目/精品/研究/判断”, default to project research. If the user says “只要图/看感觉/视觉参考”, default to visual reference.

If the user's expected depth is unclear, offer five choices briefly:

1. 项目搜索-深度模式
2. 项目搜索-中度模式
3. 项目搜索-浅度模式
4. 视觉搜索模式
5. 项目搜索-专家模式

## Universal Output Guardrails

### Universal no-repeat rule

This rule applies to Deep, Medium, Shallow, Visual Search, and Expert Mode.

Repeat-search requests must not produce the same project, same source page, same project name, or same representative image in any new Word report or card set. Treat user wording such as "再跑一次", "换一批", "重复搜索", "补充几个", "再找一些", "同样标题再来一版", "扩展", or "下一轮" as a repeat-search request unless the user explicitly asks to reuse prior cases.

Before selecting final cases or cards, build a short exclusion list from the current conversation, previous `链接.txt` files, visible prior output folders, and any user-provided old result. Exclude matching project names, source URLs, source pages, representative images, and obvious reposts of the same project. If the search field is too narrow and avoiding all repeats is impossible, say so before output and ask whether the user wants adjacent directions or accepts one clearly marked repeat.

### Universal low-quality or blurry image note

This rule applies to Deep, Medium, Shallow, Visual Search, and Expert Mode.

When a selected reference is strong but the usable image is low-resolution, blurry, cropped, watermarked, or only available through a screenshot because the source does not allow direct download, keep the reference if it is valuable, but add a low-quality or blurry image note in the Word item, card link list, or `链接.txt`:

`图片说明：不让下载，截图示意。建议结合文字分析去源网站查看。`

Do not create generic placeholder images when a source page, visible webpage image, screenshot or cropped preview fallback can represent the selected reference. If direct image download fails, first try a source-page image, then a screenshot or cropped preview fallback of the actual reference image/page. Use a text placeholder only when no source image, screenshot, or preview can be captured, and mark it as a failure state rather than normal delivery.

Do not silently present a poor screenshot as a normal high-quality project photograph. Do not replace a strong reference with a weaker one only because the weaker image downloads more cleanly.

## Conversation And Mode Guidance

### Mandatory Pre-Search Confirmation

Before any online search, source opening, image download, Word generation, or card generation, always perform a short confirmation step with the user. This is mandatory for every new Insight-Space task, even when the user appears to have already named a mode, topic, and quantity.

The first response to a new research request must only clarify the intended work and ask for confirmation. Do not start researching in the same turn. The user must reply with an explicit confirmation such as "确认", "可以", "开始", "就按这个来", or an equivalent approval before the workflow continues.

Use this confirmation structure:

1. restate the user's design problem in natural language;
2. recommend or confirm the mode: 深度模式, 中度模式, 浅度模式, 视觉搜索模式, or 专家模式;
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
- “专家模式 / 精准一点 / 专项 / 单点 / 最好看的 / 审美最高 / 低成本但高级 / 消防坡道 / 无障碍 / 风险 / 施工 / 维护 / 不能踩坑 / 具体做法” -> Expert Mode.

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

### Large requested-count notice

When the user asks for many cases, many cards, or a larger-than-default selection, explain the quality/time tradeoff before online search starts. Do not quietly keep the normal candidate pool and then force weak results into the output.

In the confirmation block, say that you will increase the rough candidate pool and that the run may take longer. Use concrete numbers when possible. For example:

> 鉴于你本次要筛选的案例比较多，我会把初筛候选池从默认 16 个左右提高到 25 个左右，再从里面筛出正式案例和候选卡片。这样质量会更稳，但时间大概会多 5-8 分钟。你确认后我再开始。

English control wording: Large requested-count notice; increase the rough candidate pool; about 5-8 extra minutes; before online search starts; from 16 to about 25 candidates.

Do not present multiple unrelated user requests as one continuous client conversation. If the user provides several requests at once and does not say they belong to one project, treat each as an independent task with its own mode, sample-size suggestion, and output folder.

## Tone Selection

Choose tone before output mode.

**Internal professional judgment** is the default. Use it when the user says “帮我判断”, “内部看”, “专业一点”, “哪些值得借鉴”, or gives no delivery audience. Be direct: keep, downgrade, verify, or remove.

**Client-readable explanation** is used when the user says “给客户看”, “给业主解释”, “汇报”, “提案”, or “不要太专业”. Explain relevance, usable strategies, and limits in clear language.

Both tones must preserve source verification, reference value judgment, and risk awareness.

## Output Mode

Choose output mode from the user’s wording. If unspecified, default to medium project search, or offer the five choices when the user appears to be deciding a deliverable format.

### Project Search - Deep Mode

Use when the user asks for 精品案例, 深度研究, 认真分析, 客户/团队可看, or complete early-stage research.

Default output combination:

- one combined Word report named `深度模式_[user topic].docx`, using `assets/templates/deep_project_template.docx`;
- 3-5 deep project items by default, unless the user asks for fewer or more;
- one separate candidate-card folder named `项目参考卡片`, containing five cards by default;
- one `链接.txt` source-link list.

No separate overview document by default.
`NO1`, `NO2`, and `NO3` are document sequence labels, not value ranking.
Do not add a Word cover page or opening explanation page. The Word report should start directly with `NO1. [Project Name]`; keep user request, mode notes, and NO-number explanation in `链接.txt` when needed.
Default: output five candidate cards. Card visuals are candidate references, meaning almost-selected backup projects or supplementary visual clues from the same research pool. They must be near-miss candidates from the same research round, not selected Word cases repackaged as cards.

### Project Search - Medium Mode

Use when the user wants several good projects with judgment, but does not need full deep documents for every case.

Default output combination:

- one combined Word report named `中度模式_[user topic].docx`, using `assets/templates/medium_project_template.docx`;
- 5-8 reduced project items by default;
- one separate candidate-card folder named `项目参考卡片`, containing five cards by default;
- one `链接.txt` source-link list.

Medium documents keep the same visual format as the approved deep template, but deliberately remove section `4. 不能照搬点` and section `5. 成本 / 施工 / 维护初判 (1-3)`. After renumbering, keep the project image, project information, `1.核心判断`, `2.最值得参考`, `3.借鉴方向建议`, `4.风险提醒`, and `5.结论`.
Medium mode is a reduced deep report, not a summary card. Removing two sections must not make the analysis thin. For every medium project, `1.核心判断` must be written as 2-3 substantial paragraphs that explain the project's real transferable value, spatial/design mechanism, suitable use scenarios, and what should be extracted instead of copied. `5.结论` must be written as 2 substantial paragraphs that restate the project role, name the most useful strategies, and give a clear recommendation for how the current user should borrow it. Do not output one-sentence or bullet-only conclusions in medium mode.
Do not add a Word cover page or opening explanation page. The Word report should start directly with `NO1. [Project Name]`; keep user request, mode notes, and NO-number explanation in `链接.txt` when needed.
Default: output five candidate cards. Card visuals are candidate references, meaning almost-selected backup projects or supplementary visual clues from the same research pool. They must be near-miss candidates from the same research round, not selected Word cases repackaged as cards.

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
Shallow mode still does not output cards by default.

### Visual Search Mode

Use when the user only wants visual references, image clues, objects, materials, furniture, seats, lighting, small structures, forms, or atmosphere.

Default output:

- card visuals only;
- each card contains image, visual clue, retained value, brief reference advice, suitable scenario, source label, and whether formal tracing is recommended;
- one `链接.txt` source-link list.

Never package visual-only clues as verified projects.

### Project Search - Expert Mode

Use when the user needs a more precise professional search than broad case research. Expert Mode is not only a construction, cost, or maintenance mode. Its job is to first identify what kind of professional judgment the user needs, then choose the search pool, source tolerance, quantity, and output focus accordingly.

Expert Mode is document-first and cannot be card-only. Once a task is confirmed as Expert Mode / 专项模式, one Word-style report is mandatory even when the user cares mainly about image feeling, form, material, mood, or aesthetics. Cards are a divergent-thinking supplement, not a replacement for the Word judgment.

Expert Mode must start with a confirmation of the user's expert intent:

- `审美标杆型`: find world-range high-aesthetic, distinctive form/material/atmosphere references. Do not default to cost or construction discussion unless the user asks. Default first output: 8-12 个视觉/项目参考.
- `单点专项型`: research a specific element such as 柜台,坡道,座椅,灯光,导视,廊架,栏杆,入口,外摆,景观节点, or material detail. This is the main target, not a secondary "局部参考". Default first output: 6-10 个专项参考.
- `落地控制型`: focus on low cost, construction difficulty, maintenance, operation, material replacement, and simplified transfer. Default first output: 4-6 个强相关案例.
- `风险避坑型`: focus on fire, accessibility, safety, maintenance, code boundary, and failure risks as design reference only. Do not present it as formal code compliance or professional review. Default first output: 3-5 个高可信案例 plus necessary 专项线索.
- `综合专业型`: for important projects that need aesthetics, method, implementation, and risk together. Default first output: 4-6 个精品案例.

Before searching, ask the user to confirm the expert intent, first-round quantity, and `主突破点`. This is the Expert Mode `突破口确认` step. If the user's wording already makes the intent clear, state the inferred type and likely breakthrough point, then wait for confirmation instead of asking a long questionnaire.

For small-point requests such as 柜体,坡道,座椅,导视,灯光,材料,水吧,入口, or展示墙, do not immediately search the literal word. First help the user choose one or two breakthrough points. Explain the likely options in practical design language. For example, `售楼部室内柜体` may split into:

- 书墙/展示墙: creates order, cultural atmosphere, and background value;
- 水吧柜/服务柜: connects service, display, storage, and hospitality;
- 洽谈区背景柜: improves composition, lighting, and client-facing texture;
- 材料展示墙/模型展示柜: turns sales information into a designed interface;
- 生活方式陈列: makes the sales office feel like a future living scene.

Only after the user confirms the main breakthrough point should the search pool be built. If the user does not choose, pick the most useful default and state it clearly.

For Expert Mode small-point searches, apply a quality gate before selection. Do not search only the literal object name or select ordinary full-house customization, generic product photos, generic wardrobes, plain TV walls, or catalogue furniture just because they match the noun. Translate the object into what it does in space. For cabinet/storage topics, use strategy keywords such as `storage as architecture`, `integrated joinery`, `bespoke millwork`, `cabinet wall`, `hidden storage wall`, `收纳墙`, `隐藏柜体`, `木作墙`, and `家具化墙面`. Select references that show cabinet as spatial skeleton, interface, hidden function, lifestyle display, material/light carrier, or visual memory.

This downgrade logic applies across design fields, not only interiors. If the user asks for a single-point reference and the result is only an ordinary conventional product or pattern, such as a generic chair, lamp, cabinet, UI panel, poster layout, signage board, sculpture object, facade pattern, or catalogue image, downgrade it unless it shows a clear aesthetic benchmark, system logic, detail method, scene relationship, or transferable professional move. Expert Mode Word cases and inspiration cards must not overlap: selected Word cases, same source pages, same project names, or same representative images cannot be reused as Expert Mode inspiration cards unless the user explicitly asks for card versions of the Word cases.

For Expert Mode, prefer formal/special references from within the last 3 years. Older references can be selected only when they have strong quality backing such as a well-known studio or company, official source, reputable professional media, award source, or recognized benchmark value. Do not use ZCOOL / 站酷 as a default source or card source.

Expert Mode recency applies to inspiration cards when requested. If the user says recent, recent years, 近几年, 最近几年, 近三年, or similar, recent-years wording binds both Word cases and inspiration cards. Do not let the Word report follow the recent-years request while the `更多单点可能性` cards are filled with old iconic projects. Older visual clues may appear only as a small, clearly labelled `classic divergent clue` when they are more useful than recent material and when they do not replace the requested recent inspiration pool.

Expert Mode output defaults to:

- one Word-style report is mandatory, named `专项模式_[user topic].docx`;
- one `链接.txt` source-link list;
- one `更多单点可能性` folder with eight divergent inspiration cards by default;
- for `单点专项型` Word reports, use the fixed template `assets/templates/expert_mode_template.docx`.

Expert Mode inspiration cards must be named `更多单点可能性`. These cards are for extra single-point possibilities outside the Word cases: use short conversational Chinese, write exactly three short sentences, do not write 保留价值, keep only a weak source label on the card, and keep full URLs in `链接.txt` when available.

For Expert Mode cards / 专项模式项目卡片, use this source priority by default for spatial/object/form/material topics: Pinterest -> Behance -> other high-quality visual platforms. These cards are inspiration-first, not candidate supplements from the Word search pool. For graphic/brand single-point topics such as menu layout, poster layout, brand identity, packaging system, typography hierarchy, or visual identity, use Behance only by default for both Word references and cards. Use this priority only for Expert Mode cards; other project-search modes should still use useful non-selected candidates from the same research round when cards are requested.

Use the following output emphasis:

- If the user wants image feeling, form, material, or atmosphere inside Expert Mode, still produce the mandatory Word report, then use the eight divergent inspiration cards to broaden visual possibilities.
- If the user cares about implementation or risk, include 可借鉴点,不能照搬点,风险提醒.
- If the user cares about aesthetics, focus on 为什么好看,形式语言,材料表达,氛围方法, and 适合转译到哪里.
- Use 专项参考,单点参考,视觉线索,现场线索 instead of "局部参考" in Expert Mode.
- If one element can mean several different things, separate candidates by confirmed breakthrough point; do not mix all directions into one result pool.

#### Expert Mode As Case-Judgment Tool

Expert Mode, especially `单点专项型`, must behave like a case-judgment tool, not a case database. The user usually already knows the object they care about; the report should help them decide why a case is usable, what can be borrowed, how to explain it to a client, and where the risk boundary is.

For `单点专项型` Word outputs, follow `assets/templates/expert_mode_template.docx` exactly. Keep the approved typography, bolding, table structure, image position, and section order. Do not reuse deep, medium, shallow, or card layouts for this output.

The template order is:

- `专项命题`: user's specific object plus the current judgment focus;
- `核心判断`: one concise sentence explaining how the reference responds to the special point;
- compact basic information table: `策略归类`, `项目类型`, `设计机构`;
- one representative image that best shows the special point;
- `1. 选用逻辑`: four-row table using only `专项矛盾`, `转译动作`, `参考价值`, and `适用前提`; do not add extra logic rows such as `落地表达`, `维护要点`, `Xxxx`, or free-form rows;
- `2. 与本次重点的关系`: two short paragraphs, first for direct relevance, second for the user's priority such as aesthetics, material, cost, atmosphere, function, construction, or risk;
- `3. 汇报表达口径`: one human presentation sentence that can be placed into a design report;
- `4. 适用场景判断`: compact `适合` and `判断重点`, but the language must be written as a user-priority applicability judgment;
- `5. 照搬风险底线`: compact `风险底线` and `落地控制`.

第 4 条不能写成固定句式. Keep the labels `适合` and `判断重点`, but write the content around the user's confirmed priority, such as 冲击力, 导入感, 审美, 成本, 落地, 风险, or 传播性. It should judge when the case works for this user's problem, when it fails, and what condition makes it worth using. Do not make every case start with the same pattern like "更适合... / 判断时重点看..."; vary the angle according to the selected case.

Main body text is generally not bold; bold only the small labels that the approved template already emphasizes. Sections 4 and 5 should lock the applicability boundary and risk bottom line, not become long analysis paragraphs. If several selected references are included, repeat the same template block once per reference and start each block on a new page.

For `消防登高面` expert outputs, classify each case into one dominant strategy type before writing:

| Strategy type | Use when | Typical judgment |
|---|---|---|
| 前置协调型 | scheme is not locked and fire, traffic, and landscape can still be coordinated | integrate hard fire conditions first, then build landscape experience |
| 骨架整合型 | civic buildings, exhibition halls, cultural centers, or large public fields | put the fire operation surface inside the path and plaza system |
| 界面转译型 | commercial entrances, office ground floors, industrial-park courtyards | turn hard fire ground into arrival and staying interface |
| 地形柔化型 | residential courtyards, community spaces, continuous fire surfaces | use terrain, planting, and movable furniture to reduce hard-surface feeling |
| 轻运营激活型 | commercial streets, long fire plazas, limited-budget fields | use movable furniture and event units to create daily activity |
| 主题叙事型 | show areas, resort housing, marketing-oriented spaces | use material and spatial narrative to dissolve the hard fire ground |

Do not call a case good only because it looks good. Say how the fire operation surface is integrated, softened, activated, themed, or coordinated.

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
- expert mode: ask the user to confirm the expert intent type, first-round quantity, and whether the priority is aesthetics, single-point method, implementation, risk, or a combined professional view.

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

- Deep Mode default: build 10-16 rough candidates, inspect 6-10 serious candidates, select 3-5 final Word cases plus 5 near-miss candidate cards unless the user asks otherwise.
- Medium Mode default: build 10-14 rough candidates, inspect 6-10 serious candidates, select the mode's requested/default Word cases plus 5 near-miss candidate cards.
- Shallow Mode default: build 5-8 rough candidates, select the requested/default count.
- Visual Search Mode default: build 5-8 visual candidates, select 3-4 cards unless the user asks otherwise.
- Expert Mode default: use the confirmed expert intent to set the final output count: 审美标杆型 8-12, 单点专项型 6-10, 落地控制型 4-6, 风险避坑型 3-5 plus necessary 专项线索, 综合专业型 4-6.

Extended candidate scale, only when requested or when the first pass is too weak:

- Deep Mode extended: build up to 18-30 rough candidates and inspect 10-16 serious candidates.
- Medium Mode extended: build up to 12-20 rough candidates and inspect 6-10 serious candidates.
- Shallow Mode extended: build up to 8-12 rough candidates.
- Visual Search Mode extended: build up to 8-14 visual candidates.
- Expert Mode extended: expand only when the user asks for broader coverage or the first expert pass is too weak; prefer better keyword angles over reading many pages linearly.

Default time targets:

- Visual or Shallow first pass: about 3-5 minutes before rendering.
- Medium first pass: about 5-7 minutes before rendering.
- Deep first pass: about 7-10 minutes before rendering.
- Expert first pass: aim to finish a normal user-facing run within 15 minutes after confirmation. Very complex expert searches may stretch to about 15-18 minutes, but only after telling the user the reason and keeping the search staged; do not allow Expert Mode to drift into 20-30 minute exhaustive browsing.

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
- use one representative image from the selected project page first; try at most one alternate image/source before using screenshot or preview fallback;
- do not bulk-download galleries, create contact sheets, or collect process image folders in normal user runs; for each selected Word case or card, try one main image plus one backup image, then use screenshot/cropped preview if both fail.

Image value rule: project relevance and reference value outrank image sharpness. If the project is strong but the image cannot be downloaded cleanly, use a screenshot/cropped preview from the verified source page before replacing the project. Mark low-resolution or preview-only images in the output notes only when it affects user understanding.

## Source Policy

Use `references/source_research_rules.md` for the full source policy.

Summary:

- A-level: official project page, design office website, official awards page, or highly reliable project source.
- B-level: professional media, design platform, institution/research page, or complete portfolio page.
- C-level: visual clue source such as Pinterest, Instagram, Savee, image search, or incomplete image collections.
- D-level: user-provided photos, drawings, tasks, screenshots, or brief.
- X-level: unusable or misleading sources, including unverifiable collages, suspected AI images presented as real cases, or inconsistent source claims.

YinjiSPACE (`https://www.yinjispace.com/`) is a high-priority source for interior, commercial, hospitality, residential, and high-aesthetic spatial references. Treat it as B-level professional media: useful for case discovery, aesthetic judgment, material/atmosphere cues, and commercial/interior inspiration, but not a primary architecture-code or technical-verification source. For deep verification, trace key facts to an office page, official project page, award page, or another reliable source when possible.

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

Deep and Medium modes must output five candidate cards by default. These cards are near-miss candidates from the same research round, not selected Word cases repackaged as cards. Shallow mode still does not output cards by default.

Source links should usually live in a separate `链接.txt` output. Cards may show only a platform name or short source label to keep the layout clean. Exception: Expert Mode Word reports must also include each selected Word case's original URL inside that case block under `6. 原网址 / 延伸查看`, because Expert Mode reports are short and the user often needs to open the source immediately while reviewing the single point.

When bitmap card visuals are requested, use the fixed card template rules in `references/project_reference_card_rules.md` and prefer `scripts/render_project_card.ps1` for deterministic rendering.
Deep and Medium candidate cards use this renderer for the default five `项目参考卡片`. Expert Mode default eight inspiration cards also use this renderer for the `更多单点可能性` folder, usually numbered `C01-C08`.
Card automation is only a layout renderer. It does not search, select, download, screenshot, verify, or write the card copy. Research, source choice, image capture, image quality judgment, no-repeat checks, and the three short card sentences must be prepared before calling the renderer.
When deep-mode research content is already prepared as structured data with local representative project images, prefer `scripts/render_deep_report.ps1` to fill the approved deep Word template and create the matching source-link file. The script is a document renderer only; it does not replace online research, source verification, project judgment, or image selection.
When medium-mode research content is prepared as structured data, prefer `scripts/render_medium_report.ps1`. When shallow-mode research content is prepared as structured data, prefer `scripts/render_shallow_report.ps1`. These renderers are document layout tools only; research, source verification, case selection, and representative-image selection must happen before calling them.
When Expert Mode / single-point research content is prepared as structured data with local representative images, prefer `scripts/render_expert_report.ps1`. This renderer fills `assets/templates/expert_mode_template.docx` exactly, writes each case's source URL into section `6. 原网址 / 延伸查看`, and creates the matching `链接.txt`. It is a token-saving Word automation layer only; it does not search, verify links, choose cases, write design judgment, choose the论点图, or render inspiration cards.

Automation coverage summary: Word layout is automated for Deep, Medium, Shallow, and Expert Mode through the bundled Word renderers. Bitmap card layout is automated through `render_project_card.ps1` for both project candidate cards and Expert Mode inspiration cards. Online research, platform choice, case selection, source verification, representative-image choice, screenshot fallback, and design judgment are not automated and must remain part of the research workflow.

## Quality Bar

An Insight-Space output fails if it:

- only lists links or images without explaining value;
- says only “modern,高级,自然,有氛围,有设计感”;
- treats Pinterest/Instagram/image search material as verified projects;
- invents project facts;
- recommends every case equally;
- ignores site type, scale, user behavior, budget, maintenance, construction, or operation;
- gives high-budget or high-maintenance projects to low-budget requests without simplification advice;
- fails to separate formal cases from visual clues;
- hides uncertainty instead of marking it.

## Reference Navigation

Read only the references needed for the request:

- `source_research_rules.md`: online research, source grading, verification, anti-fabrication, link list.
- `source_platform_memory.md`: known platform problems, image/download fallbacks, login/captcha handling, and local runtime issue records.
- `reference_evaluation_rubric.md`: selection, scoring, reference grades, cost/construction/maintenance risk.
- `output_document_rules.md`: deep/medium/shallow/visual-search deliverables and document naming.
- `project_reference_card_rules.md`: card fields, aspect ratio, layout, image quality, visual clue handling.
- `resource_library_guide.md`: request fragments, clarifying questions, keyword patterns, platform notes, examples.

For testing, use `tests/test_prompts.md` and `tests/acceptance_criteria.md`.
