# Acceptance Criteria

Insight-Space v0.1 is acceptable when it consistently meets these checks.

## Trigger

- It triggers on spatial, landscape, and interior design reference research.
- It recognizes manual trigger phrases such as “Insight-Space”, “像你一样看空间”, and “不要只找图”.
- It does not run full case research for pure image generation, UI, animation, graphic design, construction drawings, fire review, structural safety, or precise cost estimation.

## Interaction

- It does not ask a long questionnaire first.
- It never starts online search, source opening, image download, Word generation, or card generation before a short user confirmation.
- Its first response to every new Insight-Space task restates the user's need, recommends or confirms mode, proposes quantity, states screening priorities, states output format/location, and asks the user to confirm.
- It uses assumptions when the user wants speed, but still asks for one-word confirmation before research starts.
- It asks at most the necessary key questions inside the confirmation block.
- When the user gives a loose one-condition request such as "随便搜几个看看", it recommends or infers the lightest suitable mode before heavy research and waits for confirmation.
- It defaults loose project/case exploration to shallow mode, and loose picture/mood/object requests to visual search mode.
- It recognizes Expert Mode as a fifth mode when the user asks for precision, 专项,单点做法,审美标杆,最好看的,低成本但高级,消防坡道,无障碍,风险避坑, or specific implementation/risk judgment.
- Before Expert Mode search, it confirms the expert intent type: 审美标杆型,单点专项型,落地控制型,风险避坑型, or 综合专业型.
- Before small-point Expert Mode search, it performs 突破口确认: restates the small point, offers 3-5 possible breakthrough points, recommends 1-2 first-round directions, and waits for confirmation or states a speed default.
- Its first response feels like a design partner: it reflects the user's real design problem before naming the mode.
- It suggests a first-round calibration size by default: 3 deep cases, 4 medium cases, 5 shallow directions/items, or 3-4 visual cards.
- It tells the user they may directly specify the output quantity.
- If multiple unrelated requests appear in one message, it treats each as an independent task unless the user says they belong to one project.

## Search And Source

- It generates Chinese and English keywords.
- It searches for real cases when project research is requested.
- It uses layered sampling for broad searches instead of only reading the first few results or browsing every page linearly.
- It defaults to Fast Quality Search: small high-trust candidate pools, shortlist-first page opening, and final-link verification only.
- It expands into larger candidate pools only when the user asks for a fuller search or when the first pass cannot find enough usable references.
- It does not spend time chasing high-resolution images when a representative project image or screenshot preview is enough.
- It separates formal cases from visual clues.
- In Expert Mode, it can use 专项参考,单点参考,视觉线索, and 现场线索 without treating them as verified formal projects.
- In Expert Mode, Pinterest, Instagram, Alamy, image search, and similar platforms can be used as clue sources when appropriate, but not as verified project facts unless traced.
- In flat graphic/brand Expert Mode, such as menu layout, poster layout, brand identity, visual identity, packaging system, or typography hierarchy, Behance is the only default search/source platform. Pinterest or other visual platforms are used only when the user explicitly asks or approves expansion beyond Behance.
- In small-point Expert Mode, it expands literal object words into functional keywords and keeps 主突破点强相关,相邻专项参考,视觉线索/现场线索, and 淘汰 separate.
- It opens and verifies every final user-facing URL before writing it into `链接.txt`; mismatched, empty-title, broken, or generic links are removed or marked pending.
- It marks source levels A/B/C/D/X.
- It does not fabricate project name, designer, location, year, or link.
- It explains limitations when verified cases are scarce.

## Evaluation

- It explains why each selected case is relevant.
- It states what can be learned.
- It states what should not be copied.
- It includes cost, construction, maintenance, operation, site, or safety risks when relevant.
- It does not choose cases only because they look good.
- It downgrades visual-only material instead of pretending it is verified.

## Outputs

- Deep project search creates one combined Word report using the deep template, defaults to 3-5 project items, and includes a separate `链接.txt`.
- Medium project search creates one combined Word report using the medium template, defaults to 5-8 project items, and includes a separate `链接.txt`.
- Shallow project search creates one combined lightweight Word report using the shallow template, defaults to 8 project items, and includes a separate `链接.txt`.
- Deep, medium, and shallow Word reports follow their bundled template section order exactly; the agent does not invent a new report structure.
- Medium template keeps the approved deep visual format, removes section `4. 不能照搬点` and section `5. 成本 / 施工 / 维护初判 (1-3)`, then renumbers risk and conclusion as `4.风险提醒` and `5.结论`.
- Shallow template uses the bundled asset updated from the user's approved desktop `浅度模式.docx`.
- Deep and medium conclusions follow the template's expanded conclusion pattern, not a one-sentence ending.
- Each selected project block uses an accurate representative project image from a verified project/professional media page; browser UI screenshots, search-result screenshots, and source-check screenshots are not acceptable project images.
- If direct image download is blocked, a cropped screenshot preview of the actual project photograph on the verified source page is acceptable.
- In combined project-search reports, the Word document starts directly with `NO1`; no cover page, title page, user-request paragraph, or opening explanation page appears before the first project.
- Each `NOx` project block starts on a new page.
- Shallow reports keep one project per page by default and keep the project block visually centered as much as the template allows.
- Shallow delivery contains only the Word report and `链接.txt` by default; no `images`, source-image, or process-material folder is output unless explicitly requested.
- Visual search creates card visuals and source-link text file.
- Expert Mode creates `专家模式_[user topic].docx`, `链接.txt`, and default `更多单点可能性` inspiration cards unless the user changes the output.
- Expert Mode output matches the confirmed intent: aesthetic benchmark outputs focus on why it looks good and how to translate it; single-point outputs treat the specific element as the main object; implementation/risk outputs include borrowable points, non-copy notes, and risk reminders.
- Single-point Expert Mode Word output uses `assets/templates/expert_mode_template.docx` exactly, with `专项命题`, `核心判断`, `1. 选用逻辑`, `2. 与本次重点的关系`, `3. 汇报表达口径`, `4. 适用场景判断`, `5. 照搬风险底线`, and `6. 原网址 / 延伸查看`.
- Expert Mode normal runs should be time-bounded around 15 minutes after confirmation; complex runs can stretch to about 15-18 minutes only with explanation, not silent 20-30 minute exhaustive browsing.
- Research documents and card visuals remain separate output systems.
- `NO1`, `NO2`, and `NO3` are sequence labels, not value ranking.
- No overview document is created by default.
- Project-search delivery is flat by default: one Word report and one `链接.txt`, no nested `01_...` / `02_...` folders.
- Project-search delivery does not include `images`, source-image, process-material, or downloaded-assets folders by default; report images are embedded in Word.
- When a desktop filesystem is available, outputs default to `Desktop/Insight-Space输出/[NN]_[mode]_[topic]`; inside that task folder, delivery stays flat.
- Each independent request gets its own numbered output folder unless the user asks to combine them.
- Project-search modes do not default to card visuals. Card visuals are candidate references; if the user needs them, they can be output separately.
- Source links can be separated into a text file rather than placed visibly on cards.
- Shallow report tables must not hide text; row heights expand automatically and full URLs stay in `链接.txt` when they would compress the document.
- The deep Word renderer `scripts/render_deep_report.ps1` can fill the approved deep template from structured project data and create both the Word report and `链接.txt`.
- `tests/test_deep_report_renderer.ps1` passes after any change to the deep renderer or deep Word template.
- The medium Word renderer `scripts/render_medium_report.ps1` can fill the approved medium template from structured project data and create both the Word report and `链接.txt`.
- `tests/test_medium_report_renderer.ps1` and `tests/test_medium_template.ps1` pass after any change to the medium renderer or medium Word template.
- The shallow Word renderer `scripts/render_shallow_report.ps1` can fill the approved shallow template from structured project data, create both the Word report and `链接.txt`, and avoid creating image/process folders by default.
- `tests/test_shallow_report_renderer.ps1` passes after any change to the shallow renderer or shallow Word template.

## Card Quality

- Cards use the single approved fixed template asset `assets/templates/project_card_template.jpg`.
- Card output size is `1600 x 2200`; no alternate card ratios or layouts are introduced unless the user provides a new approved template.
- Image ratio differences are handled by proportional cropping inside the fixed top image area; images are never stretched.
- Cards use automatic cropping defaults first; manual focus adjustment is used only when the first crop clearly cuts off the subject.
- Project/reference value is prioritized before image fit; a weaker project is not selected only because its image fits the template better.
- Cards are image-led and text-light.
- Cards include project name/type, 1-3 specific value points, and short source label.
- Full URLs are placed in the source-link text output.
- Customer-facing cards do not show internal labels such as `用户样稿图`, `内部参考`, or raw `pending`; use source labels such as `Source: Pinterest`, `Source: Alamy`, or `原项目待追溯`.
- Image ratio is respected; images are not stretched.
- High-value projects are not rejected only for imperfect images.
- High-value projects are not rejected only because direct image download fails; screenshot preview fallback is allowed.
- Beautiful but low-value images do not become selected formal cases.

## Failure Conditions

The skill fails if it:

- only lists links;
- only describes style;
- invents facts;
- ignores source level;
- treats visual clues as verified cases;
- opens and deeply reads too many rough candidates before shortlisting;
- spends excessive time finding better images when project value and a representative image are already sufficient;
- recommends every case equally;
- omits non-copy points;
- omits risk when risk is central;
- begins search or file generation before the user confirms the proposed mode, quantity, direction, and output;
- treats Expert Mode as only cost/construction/maintenance analysis when the user is actually asking for aesthetic benchmark or single-point inspiration;
- calls a single-point expert target "局部参考" when it is the main user need;
- starts searching a small-point expert request without confirming the main breakthrough point;
- mixes several small-point directions into one result pool without telling the user what the main direction is;
- writes unverified or mismatched links into `链接.txt`;
- produces the wrong output mode for the user request.
