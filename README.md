# Insight-Space

像你一样判断空间。

Insight-Space 是一个面向空间设计前期研究的 Codex Skill。它不是单纯帮设计师找图，而是把模糊的项目需求转成可检索、可判断、可交付的参考研究材料。

它会先理解用户真实想解决的问题，判断适合的研究模式，再进行案例搜索、来源验证、参考价值分析，并通过固定模板输出 Word 文档、链接文件或视觉参考卡片。

当前版本仅针对 **Codex** 平台进行开发和验证，其他平台暂不保证可直接使用。如需迁移到小龙虾、CloudCloud 或其他环境，

请先根据目标平台的语法、函数支持、数据源配置和执行规则进行适配。后续将陆续更新其他平台的兼容版本与使用说明。

## Quickstart

在 Codex 中使用时，可以这样开始：

```text
使用 Insight-Space，帮我找几个办公空间的精品案例，做深度研究，要求偏年轻化一点，个性化有特点。
```

也可以更轻量：

```text
使用 Insight-Space，快速找几个公园构筑物参考。
```

或者只看视觉方向：

```text
使用 Insight-Space，找一点面包店视觉参考，用卡片模式。
```

Insight-Space 会先判断这次更适合深度、中度、浅度还是视觉卡片模式，并建议第一轮输出数量，避免一开始生成大量跑偏内容。

## How It Works

Insight-Space 的第一步不是直接搜索，而是先像设计搭档一样理解需求。

它会判断：

- 用户到底是要完整案例研究，还是只想先看方向；
- 这个需求更适合深度、中度、浅度还是视觉卡片；
- 第一轮应该先做几个样本，才能既省 token 又方便校准方向；
- 参考案例是否真的和项目有关，而不是只看起来好看；
- 哪些做法能借鉴，哪些地方不能照搬；
- 成本、施工、维护、运营和使用行为上有没有风险。

核心工作流：

1. 理解用户需求
2. 判断输出模式
3. 生成中英文搜索关键词
4. 优先搜索高质量来源
5. 建立候选池
6. 验证最终来源链接
7. 判断参考价值和风险
8. 输出 Word 文档、链接文件或视觉卡片

### Download From GitHub

建议直接在codex对话框，输入解压后的文件夹路径发给 Codex，让 Codex 帮你确认安装位置，并直接安装。

1. 打开本仓库页面。
2. 点击右上角 `Code`。
3. 选择 `Download ZIP`。
4. 解压后得到完整的 Insight-Space Skill 文件夹。
5. 把解压出来的 Skill 文件夹放到本机 Codex 的 skills 目录
6. 重启 Codex 或新开线程


### Manual Install For Codex

如果你的 Codex 支持本地 Skills，可以将整个 Skill 文件夹复制到本机 Codex skills 目录。

可以使用中文外层文件夹保存，但建议 Skill 本体文件夹使用稳定英文名，例如：

```text
insight-space
```

复制后，重启 Codex 或新开一个线程，再尝试：

```text
使用 Insight-Space，帮我找一点商业街区入口装置参考。
```

### Codex App

如果你使用的是 Codex App：

1. 下载并解压本仓库。
2. 将 Skill 文件夹放入 Codex 可识别的 skills 目录。
3. 重新打开 Codex 或新建线程。
4. 用“使用 Insight-Space”开头测试触发。

## Output Modes

### Deep Mode

适合用户需要精品案例、系统研究、汇报级分析、成本难度和不能照搬点。

第一轮建议先做 3 个精品案例，方向确认后可扩展到 4-6 个。

默认输出：

- `深度模式_[用户需求].docx`
- `链接.txt`

### Medium Mode

适合用户需要若干案例和设计判断，但不需要完整深度档案。

第一轮建议先做 4 个案例，方向确认后可扩展到 5-8 个。

默认输出：

- `中度模式_[用户需求].docx`
- `链接.txt`

### Shallow Mode

适合用户说“先看看”“快速找几个”“没方向”“先找灵感”。

第一轮建议先做 5 个方向或项目，方向确认后可扩展到 8 个左右。

默认输出：

- `浅度模式_[用户需求].docx`
- `链接.txt`

### Visual Card Mode

适合用户只想看图片、形式、材料、氛围、家具、灯光、小构筑物等视觉方向。

第一轮建议先做 3-4 张卡片，确认视觉方向后再扩展。

默认输出：

- 视觉卡片 PNG
- `链接.txt`

## Example Prompts

```text
使用 Insight-Space，帮我找几个景观塔类似案例。
```

```text
使用 Insight-Space，帮我找几个景观塔类似案例。
```

```text
使用 Insight-Space，找一点咖啡店商业空间参考。
```

```text
使用 Insight-Space，浅度模式，快速找几个公园构筑物参考。
```

```text
使用 Insight-Space，找一些面包店视觉参考，用卡片模式。
```

```text
使用 Insight-Space，客户想要高级感，但预算比较紧，空间是社区商业休息区。
```

## Default Output Location

如果本地环境允许，结果默认输出到桌面：

```text
Insight-Space输出
```

每次任务新建一个编号文件夹，例如：

```text
01_中度模式_商业街区入口装置
02_视觉卡片_展陈材料氛围参考
03_深度模式_景观塔系统研究
```

单个任务文件夹内部保持扁平，默认只放 Word、卡片和 `链接.txt`，不输出过程素材文件夹。

## What's Inside

```text
insight-space/
├─ SKILL.md
├─ agents/
├─ assets/
│  └─ templates/
├─ references/
├─ scripts/
├─ tests/
├─ examples/
├─ docs/
```

主要内容：

- `SKILL.md`：Skill 主入口和核心规则
- `agents/openai.yaml`：Skill 展示信息
- `references`：来源验证、评估标准、输出规则、卡片规则、资源库规则
- `assets/templates`：深度、中度、浅度 Word 模板和视觉卡片模板
- `scripts`：Word 和卡片自动化脚本
- `tests`：测试提示和验收规则
- `examples`：自动化脚本示例输入

## Automation

当前包含四个自动化脚本：

- `scripts/render_deep_report.ps1`
- `scripts/render_medium_report.ps1`
- `scripts/render_shallow_report.ps1`
- `scripts/render_project_card.ps1`

这些脚本只负责稳定排版和生成文件，不负责联网搜索、案例判断或来源核验。搜索、筛选和判断仍由 Insight-Space 的研究流程完成。

## Current Status

当前版本为发布测试版。

已经完成：

- 深度 / 中度 / 浅度 / 视觉卡片四种模式
- Word 模板固定
- 视觉卡片模板固定
- 输出自动化脚本
- 来源验证规则
- 分层抽样搜索规则
- 图片下载失败降级规则
- 前期对话引导规则

## Updating

- 修改主流程时，更新 `SKILL.md`
- 修改搜索、来源、评估、输出、卡片等细则时，更新 `references`
- 修改 Word 模板后，同步检查对应自动化脚本
- 修改卡片模板前，需要先确认新模板
- 每次重要修改后，更新 `tests`

## Notes

Insight-Space 的价值不在于找到多少张图，而在于它能不能先判断这些参考对当前项目是否真的有用，并把可借鉴的部分整理成设计师能继续推进的前期研究材料。

## Version

当前说明对应：

- Skill 包：`insightspaceskill V0.1`
- 建议仓库名：`insight-space`
- 说明文档：`Insight-Space V1.0正式版_说明与维护文档.docx`
- 日期：2026-06-10
