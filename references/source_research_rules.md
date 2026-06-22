# Source Research And Verification Rules

This file defines how Insight-Space searches online, grades sources, verifies project facts, handles visual clues, and avoids fabricated cases.

## Core Goal

Do not confuse a beautiful image with a verified project.

A useful research result must separate:

- verified formal cases;
- professional but secondary sources;
- visual clues;
- user-provided material;
- unusable or misleading sources.

When enough verified cases cannot be found, explain the limitation, adjust keywords, expand adjacent project types, and provide next-step search suggestions. Never invent missing facts.

## Source Levels

| Level | Source Type | Typical Sources | Can Be Used For | Limits |
|---|---|---|---|---|
| A | Formal / high-confidence project source | design office website, project official page, official awards page, official release, reliable project database | formal case basis; project name, designer, location, year, link; deep analysis | still check translation, reporting year vs completion year, and possible media packaging |
| B | Professional secondary source | professional media, design media reposts, institution reports, city renewal reports, complete Behance/portfolio project pages | candidate cases, background, strategy, operation context | key facts should be traced to A-level when possible |
| C | Visual clue source | Pinterest, Instagram, Savee, image search, image collections, partial portfolio pages | form, material, mood, composition, detail, visual direction | cannot count as verified case; do not invent project facts |
| D | User-provided material | photos, drawings, concept images, task books, screenshots, sketches | understand current project, extract problems, generate keywords | do not infer project identity, designer, year, brand, or origin unless provided |
| X | Unusable or misleading | unverifiable collages, screenshots without source, suspected AI images presented as real cases, inconsistent source claims | negative examples only | do not include as formal research output |

Source level determines how the material can be used. It is not a decorative label.

## Professional Source Routing

Stable marker: Professional Source Routing.

Before online search, judge the user's professional field first, then choose the search pool. The working principle is: 先判断专业，再判断去哪里搜.

This routing is especially important in V2.0 because Expert Mode / 专项模式 often serves designers who care about one precise point rather than a whole project. Deep, Medium, Shallow, and Visual Search modes still work best for broad spatial/project research. For other design disciplines, prefer Expert Mode or lightweight visual/reference outputs unless the user explicitly needs a full project-style report.

Default professional scope for V2.0:

| Professional field | Default source priority | Mode note |
|---|---|---|
| 环境设计 | MOOOOL / mooool / gooood / ArchDaily / ArchDaily CN / ArchCollege / YinjiSPACE / Pinterest visual clues | Deep, Medium, Shallow, and Visual Search fit broad spatial cases; Expert Mode fits single points such as paving, lighting, seating, signage, planting edge, node, small structure, or material expression. |
| 建筑学 | ArchDaily / ArchDaily CN / ArchCollege / design office official pages / award sites | Prefer formal project sources and office pages. Use Expert Mode for facade detail, entrance, ramp, atrium, structure expression, circulation, or material systems. |
| 公共艺术 | artist official pages / institution pages / public-art platforms / Behance / Pinterest visual clues | Prefer artist, institution, commissioning body, museum, gallery, or public-art project pages when facts matter. Pinterest is only a visual clue. |
| 雕塑 | Pinterest visual clues / artist official pages / gallery or institution pages / public-art project pages | Use visual clues for form discovery, then trace to artist or institution pages when the output needs a formal source. |
| 视觉传达 | Behance only by default | Use Behance only by default for first-pass references across all five modes. Expand only if the user asks or approves. |
| 产品设计 | Behance / design awards / brand official pages / Pinterest visual clues | Prefer design awards and brand pages for product facts; use Pinterest only as visual clue or direction expansion. |
| 工艺美术 | Behance / artist or workshop official pages / exhibition institutions / museums / material-craft platforms | Prefer maker, workshop, exhibition, museum, or material process sources. Separate craft process from pure style images. |
| 数字媒体艺术 | Behance / artist official pages / exhibition institutions / media-art platforms | Only handle content that can be judged from static screenshots or stills. Do not pretend to analyze time-based interaction, sound, animation rhythm, or live system behavior from still images alone. |

Excluded or limited professional fields:

- 动画 and 摄影 暂不作为 Insight-Space V2.0 的主适配专业. Future dynamic/video-oriented skills may handle them better.
- For animation-like or photography-like requests, offer only lightweight visual direction, reference discovery, or keyword suggestions unless the user provides enough material and accepts the limitation.
- Do not force animation or photography into a spatial Word-report template.

Flat graphic/brand rule applies across all five modes: for menu layout, cafe menu boards, poster layout, brand identity, visual identity, packaging system, typography hierarchy, information hierarchy, social-media layout systems, and similar flat graphic/brand tasks, use Behance only by default in the first pass. Do not default to Pinterest, image search, Savee, Instagram, mixed visual platforms, or stock-image sites for this category unless the user explicitly asks or approves expansion after Behance is insufficient.

Alamy is a C-level visual clue / stock-image source. Use it for object, material, mood, street furniture, site atmosphere, or visual-search clues when licensing-quality images help. Do not treat Alamy as a formal project source unless the original project/source is traced and verified elsewhere.

## Project Research Workflow

1. Confirm minimum start information: project type, use scenario, core goal.
2. Decide output mode and tone.
3. Generate Chinese and English search keywords; add local-language or place keywords when useful.
4. Run Fast Quality Search by default: search enough to select good cases, not to exhaust the field.
5. Search narrowly for scale, strategy, material, operation, maintenance, or site constraints only when the first pass is too generic.
6. Grade rough sources lightly by source type and relevance; grade final selected sources clearly as A/B/C/D/X.
7. Remove or downgrade sources that cannot support project facts.
8. Build a candidate pool within the default candidate limits.
9. Separate formal cases, 专项参考,视觉线索,现场线索, pending references, and rejected items.
10. Produce selected cases and source-link list. Produce card candidates for Deep and Medium modes by default, for Visual Search mode by default, for Expert Mode when requested or visually driven, and for other modes only when the user asks for candidate cards or visual backup references.

## Repeat-Search Exclusion

For repeat-search requests, build an exclusion list before final selection. Exclude any same project, same source page, same project name, or same representative image already used in the current conversation, previous `链接.txt`, visible prior output folder, or user-provided old result. This applies to formal Word cases and card candidates across Deep, Medium, Shallow, Visual Search, and Expert Mode.

If a project appears through a repost, alternate media page, translated title, cropped image, or different platform but is still the same underlying project, treat it as a repeat. Only reuse it when the user explicitly asks for a deeper version, card version, or comparison version of that same project.

## Download-Blocked Image Handling

If the best reference has a useful but low-resolution, blurry, cropped, watermarked, or screenshot-only image because the source blocks direct download, keep it only when its reference value is still high. Mark the output with:

`图片说明：不让下载，截图示意。建议结合文字分析去源网站查看。`

Do not create generic placeholder images when a source page, visible webpage image, screenshot or cropped preview fallback can represent the selected reference. If direct image download fails, first try a source-page image, then a screenshot or cropped preview fallback of the actual reference image/page. Use a text placeholder only when no source image, screenshot, or preview can be captured, and mark it as a failure state rather than normal delivery.

Do not spend excessive time chasing a clean copy when the source page already proves the reference value, but do not hide the image limitation from the user.

For speed, use a strict image-acquisition limit in normal user runs: try one main image and one backup image for each selected Word case or card. If both fail because of anti-hotlinking, login friction, webp incompatibility, or download blocking, use a screenshot/cropped preview of the actual reference image/page and add the mandatory image note. Do not bulk-download galleries, build contact sheets, or collect process-image folders unless the user explicitly asks for image-material collection.

## Source Platform Memory

Before repeating work on a known source platform, read `references/source_platform_memory.md` when relevant. This reference records platform-specific problems such as wrong links, anti-hotlink images, login walls, captcha, lazy-loaded images, webp/Word compatibility, and whether a platform is suitable for formal cases or only visual clues.

Use platform memory as a shortcut, not as proof. A final client-facing URL still needs the lightweight URL check before it is written into `链接.txt`.

If a new reusable website problem appears during research, record it in the local runtime issue file when the environment allows safe local writes:

```text
Desktop/Insight-Space输出/source_issue_memory.md
```

If that path is unavailable, write the note inside the current task output folder. Store only reusable source behavior and handling methods. Do not store passwords, cookies, private screenshots, paid content, or user-sensitive data.

When a known issue appears, switch method once instead of repeating the failed operation. For example, if a professional page opens but its direct image URL returns captcha, stop chasing the same image URL; use an official source, a screenshot crop of the actual project image, or mark the image pending while keeping the verified link.

## Layered Sampling Search

For broad searches, do not judge the whole field from only the first search-result page. Also do not browse every page one by one. The default is a time-bounded layered sampling strategy:

1. **Priority-source pass:** use Professional Source Routing first, then search 2-4 user-priority or high-trust sources. For environment/landscape research, search MOOOOL / mooool first by default. For standard spatial research, this usually means MOOOOL / mooool, gooood, ArchDaily, ArchDaily CN, ArchCollege, YinjiSPACE, Behance, Pinterest, and Alamy when relevant. For flat graphic/brand topics in any mode, override this broad list and search Behance only by default unless the user asks or approves expansion.
2. **Early-result pass:** review titles, snippets, thumbnails, and source type before opening pages.
3. **Shortlist pass:** open only the candidates that appear most relevant and source-reliable, aiming for about 1.5x the final requested output count.
4. **Difference pass:** use one alternate strategy/material/scale keyword if results are repetitive.
5. **Final verification pass:** verify selected cases plus 1-2 backups; do not fully verify every rough candidate.
6. **Stop condition:** stop expanding when the candidate pool is good enough and diverse enough, not when every possible result has been read.

Do not use a mechanical "first five pages only" rule. For a large result set, use targeted keyword angles instead of reading many pages. For example, a broad "coffee shop" search may inspect several top professional-media results and one targeted query such as "small coffee kiosk", "community cafe renovation", "bakery cafe interior", or local-language equivalents.

Default candidate scale:

| Output mode | Rough candidate pool | Serious candidates to inspect | Final selected output |
|---|---:|---:|---:|
| Deep project search | 10-16 | 6-10 | 3-5 Word cases + 5 near-miss candidate cards by default |
| Medium project search | 10-14 | 6-10 | requested/default Word cases + 5 near-miss candidate cards by default |
| Shallow project search | 5-8 | 3-6 | follow requested/default count |
| Visual search cards | 5-8 visual clues | 3-5 | 3-4 cards, unless user asks otherwise |

### Large requested-count search

Stable marker: large requested-count search.

When the user asks for many cases, many cards, or a larger-than-default output, increase the rough candidate pool before search rather than forcing weak cases into the final result. This Large requested-count notice must be included before online search starts.

Use the confirmation step to tell the user that the run will increase the rough candidate pool, protect output quality, and take about 5-8 extra minutes when the expansion is meaningful. Example: for a deep/medium run that would normally start around 16 rough candidates, say it will expand from 16 to about 25 candidates.

English control wording: Large requested-count notice; increase the rough candidate pool; about 5-8 extra minutes; before online search starts.

Practical scaling:

- if Deep Mode needs more than 5 Word cases or extra cards beyond the default five, expand the rough pool to about 20-25 candidates and inspect about 10-14 serious candidates;
- if Medium Mode needs 8 or more Word cases plus default cards, expand the rough pool to about 18-25 candidates and inspect about 10-14 serious candidates;
- if Shallow Mode needs more than 8 items, expand only enough to keep speed, usually 10-16 rough candidates;
- if the user asks for very large coverage, pause and offer a staged output instead of pretending one pass can stay fast.

Extended candidate scale is allowed only when the user asks for a fuller search, the first pass is too weak, or a client-facing deep report needs more certainty:

| Output mode | Extended rough pool | Extended serious inspection |
|---|---:|---:|
| Deep project search | up to 18-30 | up to 10-16 |
| Medium project search | up to 12-20 | up to 6-10 |
| Shallow project search | up to 8-12 | 3-8 |
| Visual search cards | up to 8-14 | 3-8 |

Use source reliability, relevance, transferability, and difference between cases to reduce the pool. Do not fully summarize every rough candidate. Keep deeper reading for serious candidates and final selected cases.

Default time targets:

- Visual or shallow first pass: about 3-5 minutes before rendering.
- Medium first pass: about 5-7 minutes before rendering.
- Deep first pass: about 7-10 minutes before rendering.
- Expert Mode normal user-facing run: aim to finish within 15 minutes after confirmation. A complex Expert Mode run can stretch to about 15-18 minutes only when the user is told why; do not let it become a 20-30 minute exhaustive search.

If research is likely to exceed the target, pause and offer the user a choice: output a good first pass now, or keep expanding the search.

## Keyword Rules

Do not search only by style words such as “高级感”, “网红”, “modern”, or “atmosphere”.

Build keywords from:

- project type;
- scene or user group;
- design goal;
- strategy word;
- scale or constraint;
- place, climate, or local context.

Examples:

| User Language | Chinese Search | English Search | Strategy Terms |
|---|---|---|---|
| 商业入口想做得有记忆点 | 商业街区入口 景观装置 导视 门头 公共艺术 | retail street entrance installation gateway placemaking signage | gateway, landmark, wayfinding, night lighting |
| 社区里想有儿童和老人都能用的小公园 | 社区口袋公园 儿童老人共享 活动场地 低维护 | pocket park intergenerational play elderly children community seating | inclusive design, safe edge, flexible seating |
| 咖啡厅要松弛但别太贵 | 小型咖啡店 低成本 室内设计 灯光 材料肌理 | small cafe interior low budget warm lighting material texture | material substitution, lighting layers, modular furniture |
| 展厅要有科技感但不要太空 | 品牌展厅 科技感 互动展示 动线 叙事空间 | brand showroom technology experience interactive exhibition circulation | narrative sequence, media wall, immersive display |
| 庭院想自然一点但好维护 | 庭院景观 低维护 自然式 种植 硬质铺装 | low maintenance courtyard landscape naturalistic planting paving | durable planting, gravel, native plants |

Use Chinese for local media, local implementation, Chinese commercial language, and construction context. Use English for international case databases, design offices, and more complete project descriptions.

### Small-Point Expert Keyword Rules

For Expert Mode small-point searches, do not search only the literal object name. First expand it into `功能词`, scene words, and risk/value words.

Process:

1. Confirm the `主突破点`.
2. Expand the object into what it does in the space.
3. Search with the object word plus functional keywords.
4. Keep separate pools for the confirmed breakthrough point, adjacent specialist references, and visual/site clues.

Examples:

| Small point | Functional keyword expansion |
|---|---|
| 售楼部柜体 | 书墙,展示墙,背景柜,水吧柜,材料展示墙,模型展示柜,生活方式陈列,洽谈区背景 |
| 咖啡店柜台 | 点单台,吧台,出杯区,外摆界面,品牌核心,灯光展示,操作动线 |
| 消防坡道 | 消防车道,无障碍坡道,地形台地,绿化缓坡,铺装转折,车行转弯,隐形消防界面 |
| 商业导视 | 入口识别,动线提示,品牌界面,夜间发光,地面/立面导向,装置化导视 |

If the first results become a mixed pool, stop and split by breakthrough point rather than continuing to collect unrelated references.

### Expert Mode Small-Point Quality Gate

For Expert Mode small-point searches, do not search only the literal object name and do not select an item only because it is a nice-looking object. The candidate must answer the confirmed breakthrough point.

Use professional strategy keywords before giving up on a topic. For storage/cabinet searches, include terms such as `storage as architecture`, `built-in storage wall`, `integrated joinery`, `bespoke millwork`, `joinery wall`, `cabinet wall`, `full-height storage wall`, `hidden storage wall`, `wall unit`, and local Chinese equivalents such as `收纳墙`, `隐藏柜体`, `木作墙`, `家具化墙面`, `柜体界面`, `生活方式陈列`.

Downgrade or reject ordinary full-house customization, generic wardrobes, generic TV walls, plain open shelves, ordinary cabinet image results, and catalogue-style furniture photos unless they clearly solve the confirmed design point.

This downgrade rule is cross-disciplinary. When the user asks a specialist single-point question in landscape, interior, architecture-adjacent, exhibition, graphic, animation, web, UI, sculpture, furniture, lighting, signage, facade, material, or any other design field, an ordinary conventional product or pattern must not be promoted only because it matches the noun. Examples include generic chair product shots, ordinary lamp catalogues, standard UI panels, common poster layouts, default signage boards, generic sculpture objects, typical cabinet details, or routine facade patterns. If the item does not show a clear aesthetic benchmark, system logic, detail method, scene relationship, or transferable professional move, downgrade to visual clue or reject.

A small-point candidate should pass at least one strong design question:

- Does it treat the cabinet as spatial skeleton, wall/interface, display system, hidden function, or visual memory?
- Does it show a transferable relationship between object, material, lighting, wall/floor/ceiling, path, or daily behavior?
- Does it create a design method that can be explained in a report, instead of only showing a purchasable style?
- Is the image strongly related to the named object or point, not only a beautiful whole-space atmosphere shot?

For Word cases, prefer verified or traceable real projects that pass this gate. For Expert Mode inspiration cards, visual clues can be looser, but still reject weak, ordinary, or unrelated images.

For Expert Mode Word cases and formal single-point candidates, keep the same requested object category unless the user explicitly asks for adjacent categories. If the user asks for benches or seating, selected Word cases should be benches, seating systems, or clearly seat-related details rather than lamps, signage, or unrelated furniture.

Expert Mode inspiration cards are looser because they are a divergent visual pool. Start from the same requested object category, then allow adjacent inspiration, analogy references, plane references, material references, object references, or atmosphere references only when the card clearly explains how the adjacent clue helps the user's single-point problem. Do not use adjacency as an excuse for random filler or to replace a weak search with unrelated objects.

## User-Priority Search Sites

For project research, run the first search pass through these user-priority sites before expanding to other sources:

1. Pinterest: `https://www.pinterest.com/`
2. Behance: `https://www.behance.net/`
3. MOOOOL / mooool: `https://mooool.com/` for environment design, landscape design, public space, landscape structure, installation, planting, paving, waterfront, park, community, and outdoor-node references.
4. gooood: `https://www.gooood.cn/`
5. 建筑学院: `https://www.archcollege.com/`
6. ArchDaily 中文: `https://www.archdaily.cn/cn`
7. YinjiSPACE: `https://www.yinjispace.com/` for interior, commercial, hospitality, residential, and high-aesthetic spatial references.
8. Alamy: `https://www.alamy.com/` for visual-search image clues and object/material references when licensing-quality images are useful.

Use them differently:

- MOOOOL / mooool is the first-priority source for 环境设计 / landscape-oriented research. Use it early for landscape projects, public spaces, parks, waterfronts, landscape structures, installations, paving, planting, sales-center landscape, community outdoor nodes, and high-aesthetic landscape precedents.
- gooood, 建筑学院, and ArchDaily 中文 are preferred Chinese professional sources for formal or semi-formal project research.
- YinjiSPACE is a high-priority source for interior, commercial, hospitality, residential, and high-aesthetic spatial references. Treat it as B-level professional media: useful for case discovery, aesthetic judgment, material/atmosphere cues, and commercial/interior inspiration, but not a primary architecture-code or technical-verification source. For deep verification, trace key facts to an office page, official project page, award page, or another reliable source when possible.
- Behance is useful for portfolio, concept, pavilion, exhibition, brand, and visual-system references, but must be checked for built/unbuilt status.
- Pinterest is useful for visual clues and reverse-search direction. It should not be treated as a verified project source unless it leads to an original project page.
- Alamy is useful for high-quality image clues, objects, furniture, materials, small structures, and visual search. Treat it as an image/visual source, not a formal project-fact source unless the original project source is traced.

After this priority pass, expand to official project pages, design office websites, international media, awards pages, and other databases as needed.

When reporting search logic, mention whether the priority sources produced formal cases, visual clues, or no reliable match.

## Blocked Or Low-Trust Sites

Do not use `https://www.archilovers.com/` as a default reliable source. User testing found multiple Archilovers links opened to wrong or unreliable pages. If Archilovers appears in search results, treat it as low-trust and verify through an official project page, design office, ArchDaily, gooood, or another reliable source before using it. Do not put Archilovers links into client-facing source lists unless the exact URL has been opened and confirmed.

Do not use `ZCOOL / 站酷` as a default Insight-Space search source, project source, or Expert Mode inspiration-card source. User testing found the average visual and professional quality too low for this skill's selection standard. If ZCOOL / 站酷 appears in search results, treat it as blacklisted by default: reject it, or use it only as a user-provided clue when the user explicitly gives that link. Do not use ZCOOL / 站酷 to fill missing card counts.

Always open and verify client-facing URLs before writing them into a document or `链接.txt`. A search-result title is not enough.

`链接写入前必须打开验证`: every final URL in a user-facing link list must be opened or checked immediately before delivery. It must either return a successful page with a plausible title/content, or be marked as pending and not used as a confident source. If the page opens but the title/content does not match the case, remove or replace the link. Do not keep a link only because it appeared in search results or looked plausible from memory.

### Lightweight URL Check

For shallow and medium outputs, keep URL verification lightweight to reduce cost:

- verify only final selected links, not every search candidate;
- check that the URL opens successfully, follows normal redirects, and returns a plausible page title;
- if a title is empty, mismatched, or generic, do one more quick check; if still uncertain, mark pending or remove it from `链接.txt`;
- do not read or summarize the full page just to validate a link;
- reject or replace links that return errors, wrong pages, login walls, unrelated titles, or obviously broken media pages;
- write verified final links into `链接.txt` with project name and URL;
- if a link cannot be verified quickly, downgrade the project or replace it with the next candidate rather than forcing it into the report.

For deep outputs, cross-check selected links when useful, but do not chase every repost chain. If a reliable professional source already supports the case and facts are internally consistent, use it and mark the source level.

## Platform Handling

| Platform Type | Typical Use | Watch Out |
|---|---|---|
| office/project official page | verify project facts and design intent | official pages may hide maintenance or operation problems |
| ArchDaily, Dezeen, designboom, Divisare, Landezine | formal cases and project description | distinguish project year, publish year, and award year |
| Chinese design media such as MOOOOL / mooool / gooood / 有方 / Archiposition | local context, landscape/environment, commercial and built references | repost chain may blur source and facts |
| YinjiSPACE | high-end interior/commercial/hospitality/residential and high-aesthetic spatial cases | B-level professional media; not a primary architecture-code or technical-verification source |
| Behance / portfolio platforms | concept, visual system, exhibition and brand space | may be concept, student work, or unbuilt |
| Pinterest / Savee / Alamy / image search | visual clues, object/material references, and reverse search | never treat as verified project unless traced to a reliable original source |
| Instagram / visual social platforms | user behavior, popularity, photo spots, local trend | usually not project-fact source |
| user uploads | current project analysis and search direction | do not infer facts not provided |

## 专家模式来源处理

Expert Mode changes how sources are used, not the anti-fabrication rules. The search should match the confirmed expert intent:

- `审美标杆型`: include high-quality visual platforms, design media, official pages, portfolios, YinjiSPACE, Pinterest, Alamy, and Instagram when they help identify strong form, material, atmosphere, or composition. Mark non-verified items as 视觉线索 or 待验证来源.
- `单点专项型`: search by the exact element and problem, such as 柜台,消防坡道,无障碍坡道,座椅,导视,廊架,灯光,栏杆,材料节点. Use complete projects when possible, but allow single-point sources as 专项参考 or 单点参考 when the specific detail is the main value.
- `落地控制型`: prefer built projects, local professional media, office pages, project photos, Chinese commercial examples, and sources with visible construction/material clues.
- `风险避坑型`: prefer higher-confidence sources and clearly state that the result is design reference only, not formal code compliance, fire review, accessibility certification, structural review, or cost estimate.
- `综合专业型`: use formal project sources first, then add visual/现场线索 only when they explain a method that formal cases do not show clearly.

Pinterest, Instagram, Alamy, Savee, image search, and similar platforms may be valuable in Expert Mode, especially for aesthetics, atmosphere, furniture, lighting, details, and single-point inspiration. They still 不能当作已验证项目 unless traced to a reliable original source. Do not invent project name, designer, location, year, completion status, or official URL from these platforms.

### Flat Graphic/Brand Source Rule

For requests that are explicitly about flat graphic or brand design, use Behance only by default across all five modes. This includes menu layout, cafe menu systems, poster layout, brand identity, visual identity, packaging visual systems, typography hierarchy, information hierarchy, brand guideline pages, social-media layout systems, and similar graphic-design points.

Do not default to Pinterest, image search, Savee, Instagram, or mixed visual platforms for these flat graphic/brand tasks. User testing showed that Pinterest quality is too uneven for this use case and makes the agent spend time screening weak template/repost material. Behance is the preferred default because complete portfolio pages usually show a clearer visual system, author context, and multiple touchpoints.

If Behance cannot provide enough usable references, state that limitation and ask whether to expand beyond Behance. Only use Pinterest or other platforms when the user explicitly requests them or approves expansion. When using Behance in this exception, label the result as a portfolio/visual-system reference or visual clue; do not treat it as a verified built spatial project unless the page clearly proves that status.

### Expert Mode recency rule

For Expert Mode Word cases and formal/special references, prioritize projects completed, published, awarded, or clearly documented within the last 3 years from the current run date. This keeps single-point research closer to current design taste, material expression, client expectations, and social-media传播语境.

When a reference is older than 3 years, keep it only when it has strong quality backing: a well-known studio or company, an official project page, a reputable professional media page, an award/institution source, or a widely recognized benchmark value. Otherwise downgrade it to visual clue or reject it, even if the image looks usable.

If the source has no clear year, do not invent one. Use source strength and design quality as the fallback: keep only high-confidence/high-quality references, and mark uncertain items as 视觉线索,现场线索, or 待验证来源 instead of treating them as formal cases.

Expert Mode recency applies to inspiration cards when requested. When the user says recent, recent years, 近几年, 最近几年, 近三年, or similar, recent-years wording binds both Word cases and inspiration cards. For Expert Mode `更多单点可能性`, first search recent visual clue pools and recent professional/visual platforms; do not use old iconic projects to fill Expert Mode cards just because they are visually strong or easy to source. Older card references may be used only as a small, clearly labelled `classic divergent clue`, and they must not replace the requested recent inspiration pool.

## Verification Checklist

For each formal or candidate case, check:

- project name;
- designer or institution;
- location;
- completion/design/publish year, with label if uncertain;
- project type;
- source link;
- image origin;
- source level;
- conflict between sources.

If facts conflict, state the conflict and prefer the higher-confidence source. Do not merge conflicts into a fake certainty.

## Candidate Record Fields

Use these fields internally or in link lists:

- candidate number;
- project name or visual direction;
- project type;
- designer / institution;
- location / year;
- source name and URL;
- source level;
- relationship to current project;
- initial value point;
- initial risk;
- handling decision: selected / backup / visual clue / pending verification / rejected.

## Formal Cases vs Visual Clues

Formal cases may include project name, designer, location, year, link, why relevant, usable strategy, non-copy points, and risk.

Visual clues may include mood, material, form, composition, color, lighting, detail, and possible strategy. They must not be counted as verified cases.

Pending references can be shown when a clue is useful but project facts are incomplete. Mark them clearly.

## When Verified Cases Are Scarce

If enough formal cases cannot be found:

1. Explain the limitation.
2. Change from style keywords to problem, behavior, strategy, material, or operation keywords.
3. Expand adjacent types. For example, a small cafe can expand to small retail, community shop, or corner commercial space.
4. Switch language or add local terms.
5. Add visual clues in a separate section.
6. Ask for one or two missing constraints only if they strongly affect the next search.

## Anti-Fabrication Rules

- Do not write a project name without source support.
- Do not write designer, location, year, or link without source support.
- Do not call an image a built project when it may be an effect image, student work, concept, or AI image.
- Do not treat reporting year as completion year.
- Do not say “looks like X office, so it is X office”.
- Mark broken links or insufficient information as pending verification.
- If the user wants no internet search, do conceptual advice only and state that cases are not verified.

## Source-Link Text Output

When project-search outputs include a report, also provide a simple `链接.txt` at the same delivery level.

Use this user-facing format:

```text
用户问题：用户原始问题
输出模式：项目搜索-深度模式 / 项目搜索-中度模式 / 项目搜索-浅度模式
说明：深度/中度模式默认输出 5 张候选参考卡片；浅度模式默认不输出卡片。卡片为差一点入选 Word 文档的候选参考，不代表价值排序。

NO1. Project Name / Designer
链接：https://...

NO2. Project Name / Designer
链接：https://...
```

Do not default to source-level rows, link-check dates, or process notes in the user-facing `链接.txt`; keep those inside the research report or internal reasoning when needed. Cards may show only a short source label to preserve visual quality. The text link list carries full URLs.
