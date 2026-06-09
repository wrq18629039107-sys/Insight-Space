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
| C | Visual clue source | Pinterest, Instagram, Xiaohongshu, Savee, image search, image collections, partial portfolio pages | form, material, mood, composition, detail, visual direction | cannot count as verified case; do not invent project facts |
| D | User-provided material | photos, drawings, concept images, task books, screenshots, sketches | understand current project, extract problems, generate keywords | do not infer project identity, designer, year, brand, or origin unless provided |
| X | Unusable or misleading | unverifiable collages, screenshots without source, suspected AI images presented as real cases, inconsistent source claims | negative examples only | do not include as formal research output |

Source level determines how the material can be used. It is not a decorative label.

## Project Research Workflow

1. Confirm minimum start information: project type, use scenario, core goal.
2. Decide output mode and tone.
3. Generate Chinese and English search keywords; add local-language or place keywords when useful.
4. Search broadly for the project type and problem.
5. Search narrowly for scale, strategy, material, operation, maintenance, or site constraints.
6. Grade every source as A/B/C/D/X.
7. Remove or downgrade sources that cannot support project facts.
8. Build a candidate pool.
9. Separate formal cases, visual clues, pending references, and rejected items.
10. Produce selected cases and source-link list. Produce card candidates only when the user asks for candidate cards or visual backup references.

## Layered Sampling Search

For broad searches, do not judge the whole field from only the first search-result page. Also do not browse every page one by one. Use a layered sampling strategy:

1. **Priority-source pass:** search the user-priority sites first, especially gooood, ArchDaily, ArchDaily CN, ArchCollege, Behance, Pinterest, and Alamy when relevant.
2. **Early-result pass:** review a small number of top results for high-relevance, high-source-confidence projects.
3. **Middle-band pass:** sample results from later pages or alternate site queries to catch good projects that are not ranked first.
4. **Difference pass:** search with strategy words, scale words, material words, operation words, or local-language terms to find cases with different reference value.
5. **Stop condition:** stop expanding when the candidate pool has enough diversity, not when every possible result has been read.

Do not use a mechanical "first five pages only" rule. For a large result set, sample several result bands and several keyword angles. For example, a broad "coffee shop" search may inspect a few top professional-media results, a few later-page results, and several targeted queries such as "small coffee kiosk", "community cafe renovation", "bakery cafe interior", or local-language equivalents.

Recommended candidate scale:

| Output mode | Rough candidate pool | Serious candidates to inspect | Final selected output |
|---|---:|---:|---:|
| Deep project search | 18-30 | 10-16 | 4-6, unless user asks otherwise |
| Medium project search | 12-20 | 6-10 | follow requested/default count |
| Shallow project search | 8-12 | 3-8 | follow requested/default count |
| Visual search cards | 8-14 visual clues | 3-8 | 3-6 cards, unless user asks otherwise |

Use source reliability, relevance, transferability, and difference between cases to reduce the pool. Do not fully summarize every rough candidate. Keep deeper reading for serious candidates and final selected cases.

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

## User-Priority Search Sites

For project research, run the first search pass through these user-priority sites before expanding to other sources:

1. Pinterest: `https://www.pinterest.com/`
2. Behance: `https://www.behance.net/`
3. gooood: `https://www.gooood.cn/`
4. 建筑学院: `https://www.archcollege.com/`
5. ArchDaily 中文: `https://www.archdaily.cn/cn`
6. Alamy: `https://www.alamy.com/` for visual-search image clues and object/material references when licensing-quality images are useful.

Use them differently:

- gooood, 建筑学院, and ArchDaily 中文 are preferred Chinese professional sources for formal or semi-formal project research.
- Behance is useful for portfolio, concept, pavilion, exhibition, brand, and visual-system references, but must be checked for built/unbuilt status.
- Pinterest is useful for visual clues and reverse-search direction. It should not be treated as a verified project source unless it leads to an original project page.
- Alamy is useful for high-quality image clues, objects, furniture, materials, small structures, and visual search. Treat it as an image/visual source, not a formal project-fact source unless the original project source is traced.

After this priority pass, expand to official project pages, design office websites, international media, awards pages, and other databases as needed.

When reporting search logic, mention whether the priority sources produced formal cases, visual clues, or no reliable match.

## Blocked Or Low-Trust Sites

Do not use `https://www.archilovers.com/` as a default reliable source. User testing found multiple Archilovers links opened to wrong or unreliable pages. If Archilovers appears in search results, treat it as low-trust and verify through an official project page, design office, ArchDaily, gooood, or another reliable source before using it. Do not put Archilovers links into client-facing source lists unless the exact URL has been opened and confirmed.

Always open and verify client-facing URLs before writing them into a document or `链接.txt`. A search-result title is not enough.

### Lightweight URL Check

For shallow and medium outputs, keep URL verification lightweight to reduce cost:

- verify only final selected links, not every search candidate;
- check that the URL opens successfully, follows normal redirects, and returns a plausible page title;
- do not read or summarize the full page just to validate a link;
- reject or replace links that return errors, wrong pages, login walls, unrelated titles, or obviously broken media pages;
- write verified final links into `链接.txt` with project name and URL;
- if a link cannot be verified quickly, downgrade the project or replace it with the next candidate rather than forcing it into the report.

## Platform Handling

| Platform Type | Typical Use | Watch Out |
|---|---|---|
| office/project official page | verify project facts and design intent | official pages may hide maintenance or operation problems |
| ArchDaily, Dezeen, designboom, Divisare, Landezine | formal cases and project description | distinguish project year, publish year, and award year |
| Chinese design media such as gooood / 有方 / Archiposition | local context, commercial and built references | repost chain may blur source and facts |
| Behance / portfolio platforms | concept, visual system, exhibition and brand space | may be concept, student work, or unbuilt |
| Pinterest / Savee / Alamy / image search | visual clues, object/material references, and reverse search | never treat as verified project unless traced to a reliable original source |
| Xiaohongshu / Instagram | user behavior, popularity, photo spots, local trend | usually not project-fact source |
| user uploads | current project analysis and search direction | do not infer facts not provided |

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
说明：项目搜索模式默认不输出卡片视觉。卡片视觉为候选参考；如果用户需要，可以再输出。

NO1. Project Name / Designer
链接：https://...

NO2. Project Name / Designer
链接：https://...
```

Do not default to source-level rows, link-check dates, or process notes in the user-facing `链接.txt`; keep those inside the research report or internal reasoning when needed. Cards may show only a short source label to preserve visual quality. The text link list carries full URLs.
