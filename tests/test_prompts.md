# Insight-Space Test Prompts

Use these prompts after editing the skill. The goal is to check behavior, not to produce perfect design research in one run.

## Trigger And Clarification

1. `我想找一些异形构筑物参考。`
   - Expected: recommends likely mode and first-round quantity, states assumptions, and asks for confirmation before any search; does not blindly list images.

2. `商业街区入口想做一个打卡和导视装置，帮我找参考。`
   - Expected: triggers Insight-Space, recommends medium mode and first-round quantity, names screening priorities, and asks for confirmation before generating keywords or searching.

3. `不要问了，先快速找。`
   - Expected: proposes shallow mode with assumptions and asks for one-word confirmation before searching; does not keep asking a long questionnaire.

4. `咖啡厅怎么设计会比较舒服？`
   - Expected: weak trigger; gives concise design advice and offers/infers case research only if needed.

5. `帮我画一张赛博朋克咖啡店效果图。`
   - Expected: does not run full Insight-Space; may suggest case research before image generation.

## Front Conversation Simulation

Use these prompts to test only the early dialogue and mode guidance. Do not run real web search for this section.

22. `先帮我随便搜几个咖啡店看看。`
    - Expected: infers shallow project search; explains that this is a quick direction check; proposes first-round quantity and output location; waits for confirmation before web search.

23. `找一点面包店视觉参考。`
    - Expected: infers visual search mode; says cards are for visual direction, not full verified project reports; proposes card quantity and waits for confirmation.

24. `帮我找几个办公空间精品案例，做深度研究。`
    - Expected: infers deep mode; says it will prioritize real cases, source verification, and template-based report output; asks user to confirm before searching.

25. `我也不知道要什么，你先给我点灵感。`
    - Expected: expands the likely direction, proposes shallow exploration with stated assumptions, and asks for confirmation before searching.

26. `我只想先看看图片，不要分析那么多。`
    - Expected: infers visual search mode; proposes image/card-led output and quantity; avoids formal case facts unless verified; waits for confirmation.

27. `商业街区入口想做一个能打卡、也有导视功能的装置。`
    - Expected: responds like a design partner; identifies that this is not just a shape but a memory point plus guidance problem; recommends medium mode; suggests first-round 4 cases; mentions the default numbered folder under `Insight-Space输出`.

28. `我一次给你三个不同项目：一个口袋公园，一个展厅入口，一个景观塔。`
    - Expected: treats the three requests as independent tasks unless the user says they belong together; each gets its own mode recommendation, first-round quantity, and output folder.

29. `先找 6 个，不用你建议数量。`
    - Expected: follows the user-specified quantity in the confirmation block and does not insist on the default calibration number; still waits for confirmation before searching.

## Expert Mode Simulation

Use these prompts to test Expert Mode classification and first-response confirmation. Do not run real web search for this section unless the user confirms.

30. `我想看世界范围内最好看的咖啡店柜台表达。`
    - Expected: recommends 项目搜索-专家模式; infers 审美标杆型 or 单点专项型 with aesthetic priority; proposes 8-12 visual/project references or 6-10 single-point references depending on wording; says cost is not the default focus; waits for confirmation.

31. `帮我找消防坡道做得比较自然、不像消防坡道的参考。`
    - Expected: recommends 项目搜索-专家模式; infers 风险避坑型 plus 单点专项型; clarifies that results are design reference only, not fire-code review; proposes 3-5 high-confidence cases plus necessary 专项线索; waits for confirmation.

32. `社区商业休息区预算紧，但客户要高级感。`
    - Expected: recommends 项目搜索-专家模式; infers 落地控制型; prioritizes low-cost transfer, material substitution, lighting, furniture, maintenance, and what not to copy; proposes 4-6 strong cases; waits for confirmation.

33. `我只想看一些现在真实在用的商业节点，不要太概念化。`
    - Expected: recommends 项目搜索-专家模式 or visual search depending on output preference; treats visual/social sources as 现场线索/视觉线索, not verified formal projects; asks whether to output cards or a lightweight expert report; waits for confirmation.

34. `景观塔项目，想看形式、结构、动线、功能和维护。`
    - Expected: recommends 项目搜索-专家模式; infers 综合专业型; proposes 4-6 strong cases; screens by form, structure idea, circulation, function mix, maintenance, and non-copy risks; waits for confirmation.

35. `帮我找一些售楼部室内柜体的意向参考。`
    - Expected: recommends 项目搜索-专家模式; infers 单点专项型 plus 审美标杆型; performs 突破口确认 before search by offering possible directions such as 书墙/展示墙,水吧柜/服务柜,洽谈区背景柜,材料展示墙/模型展示柜,生活方式陈列; recommends 1-2 first-round breakthrough points; expands "柜体" into functional keywords only after confirmation; treats adjacent retail/showroom/display-cabinet examples as 专项参考 or 视觉线索 rather than formal sales-office projects; does not mix all directions into one result pool; waits for confirmation.

36. `售楼部柜体你先随便搜一些。`
    - Expected: does not immediately search; says "随便搜" will make the result pool too mixed; recommends a default breakthrough point such as 展示墙/背景柜 + 水吧柜/服务柜 if the user wants speed; waits for confirmation.

## Source And Verification

6. `帮我找 5 个现代景观塔精品案例，要求来源真实。`
   - Expected: deep project search mode; uses Fast Quality Search first, then expands only if the first pass is too weak; one combined deep Word report using the deep template; NO labels are sequence labels; `链接.txt`; no overview document; no fabricated facts; no default card visuals.

7. `只要 Pinterest 风格图，先看感觉。`
   - Expected: visual search cards; uses a small visual candidate pool by default; marks as visual clues or 原项目待追溯; no invented project facts.

8. `我给你一张图，你判断它适合找什么参考。`
   - Expected: treats upload as D-level material; extracts project type and search direction; does not infer unknown designer/year.

## Evaluation

9. `客户想要高级感，但预算有限。`
   - Expected: avoids expensive references as default; explains low-cost transfer strategies.

10. `公园里想做一个预算不高但有传播性的休憩构筑物。`
    - Expected: considers low budget, durability, maintenance, rest behavior, and visual memory.

11. `室内中庭需要一个吸引人停留的装置。`
    - Expected: asks or assumes space type, height, budget, people; distinguishes installation, furniture, and atrium behavior.

12. `帮我找一些商业空间艺术装置参考，但不要只找好看的。`
    - Expected: every selected case explains relevance, usable points, non-copy points, and risk.

## Output Modes

13. `帮我找 5 个景观塔类似的精品案例，比较现代，有特点，做深度研究。`
    - Expected: project search deep mode; one combined deep Word report named by mode and topic; each NO block follows `assets/templates/deep_project_template.docx` exactly; cover/summary first, every NO block starts on a new page; selected project images are real project images, not browser/source-check screenshots; conclusion follows the expanded template pattern; NO labels are sequence labels not ranking; `链接.txt`; no overview document; no default card visuals.

14. `帮我做一个中度研究，找 6 个小型咖啡店参考。`
    - Expected: medium project search; first-pass rough pool stays small and high-trust, then selected links are verified; one combined medium Word report using the medium template exactly; 6 project items because the user specified a number; selected project images are real project images, not browser/source-check screenshots; conclusion follows the expanded template pattern; flat delivery with `链接.txt`; no default card visuals.

15. `浅度模式，快速找几个公园构筑物参考。`
    - Expected: shallow project search; small fast candidate pool, no exhaustive search; one combined lightweight Word report using the shallow template exactly; defaults to 8 project items unless user requests another number; no default card visual output; separate `链接.txt`; final links receive lightweight URL checks.

15b. `先快速找 10 个方向就行。`
    - Expected: shallow project search; one combined lightweight Word report with 10 items because the user specified a number; no default card visual output; separate `链接.txt`; tables do not hide text.

16. `只搜图片，不用完整案例。`
    - Expected: visual search mode; card visuals plus link txt; source labels; no fake project facts; default candidate pool remains small unless the user asks to expand; all cards use the single fixed `1600 x 2200` card template.

16b. `我想找一些户外座椅视觉参考，只要图片和简单建议。`
    - Expected: visual search mode; cards contain visual clue, retained value, brief advice, source label such as Source: Pinterest or Source: Alamy; no invented project facts; no alternate card layout is created.

## Card Quality

17. `生成项目参考卡片，链接不要影响画面。`
    - Expected: card uses the fixed card template; card uses short source label; full URLs go to source-link text output.

18. `这个项目图片一般，但很相关。`
    - Expected: keeps high-value project, looks for better image, or uses proportional cropping inside the fixed card image area rather than removing the project only because the image fit is imperfect.

19. `这张图很好看，但不知道项目名。`
    - Expected: visual clue or pending verification, not formal case.

20. `给客户看，别太专业，但要说清楚为什么能参考。`
    - Expected: client-readable tone; clear relevance, usable strategy, and limitations.

21. `这个图来自 Pinterest，但不知道原项目。`
    - Expected: card/source marks it as visual clue or 原项目待追溯; does not write designer, location, year, or project name without tracing.

22. `我想找一些咖啡品牌菜单版式参考，重点看信息层级和高级感。`
    - Expected: Expert Mode flat graphic/brand exception; confirmation proposes a Behance-only first pass; Word and inspiration cards do not default to Pinterest unless the user explicitly asks or approves expansion.
