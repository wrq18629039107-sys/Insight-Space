# Acceptance Criteria

Insight-Space v0.1 is acceptable when it consistently meets these checks.

## Trigger

- It triggers on spatial, landscape, and interior design reference research.
- It recognizes manual trigger phrases such as “Insight-Space”, “像你一样看空间”, and “不要只找图”.
- It does not run full case research for pure image generation, UI, animation, graphic design, construction drawings, fire review, structural safety, or precise cost estimation.

## Interaction

- It does not ask a long questionnaire first.
- It starts when project type, use scenario, and core goal are clear enough.
- It uses assumptions when the user wants speed.
- It asks at most the necessary key questions.
- When the user gives a loose one-condition request such as "随便搜几个看看", it recommends or infers the lightest suitable mode before heavy research.
- It defaults loose project/case exploration to shallow mode, and loose picture/mood/object requests to visual search mode.
- Its first response feels like a design partner: it reflects the user's real design problem before naming the mode.
- It suggests a first-round calibration size by default: 3 deep cases, 4 medium cases, 5 shallow directions/items, or 3-4 visual cards.
- It tells the user they may directly specify the output quantity.
- If multiple unrelated requests appear in one message, it treats each as an independent task unless the user says they belong to one project.

## Search And Source

- It generates Chinese and English keywords.
- It searches for real cases when project research is requested.
- It uses layered sampling for broad searches instead of only reading the first few results or browsing every page linearly.
- It separates formal cases from visual clues.
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
- recommends every case equally;
- omits non-copy points;
- omits risk when risk is central;
- produces the wrong output mode for the user request.
