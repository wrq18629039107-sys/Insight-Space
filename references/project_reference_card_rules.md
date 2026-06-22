# Project Reference Card Rules

This file defines project reference cards, visual search cards, layout selection, image quality, and card quality checks.

Cards are not miniature research reports. They are image-led, text-light, and built for fast design screening.

Cards are functional search-memory tools. They help avoid wasting useful search results and give the user more reference directions. They are not the final purpose of the skill and should not become decorative performance pieces.

Card visuals are separate from research documents. A research document may contain project images for analysis, but those images are not card visuals. Deep and Medium modes must output five candidate cards by default. These cards are near-miss candidates from the same research round, not selected Word cases repackaged as cards. This Deep/Medium default does not apply to Shallow Mode. A card output should be delivered as its own card document, image set, or visual folder, not embedded inside numbered case reports.

Card source logic differs by mode. For Deep and Medium outputs, the default five candidate cards must come from the current search candidate pool: projects that were found, screened, and not finally selected, but still have reference value. If 20 cases were screened and 5 entered the Word report, the card set should preserve useful near-miss or backup candidates from the remaining pool. For Shallow and normal Visual Search outputs, cards are still produced only when the mode or user request calls for them. For Expert Mode inspiration cards, the card source logic is different: use an external visual inspiration pool. Expert Mode inspiration cards are an inspiration-first visual pool, not a near-miss candidate pool and not a second Word-case list. For spatial/object/form/material topics, prioritize Pinterest first, then Behance and similar visual/image platforms, unless the user states another priority. 中文执行顺序写死为：Pinterest -> Behance -> 其他高质量视觉平台。For flat graphic/brand topics across all five modes, use Behance only by default for the first pass: menu layout, poster layout, brand identity, packaging system, typography hierarchy, information hierarchy, visual identity, and similar graphic-design points should not default to Pinterest because quality varies too much and screening slows the output.

Expert Mode recency applies to inspiration cards when requested. If the user says recent, recent years, 近几年, 最近几年, 近三年, or similar, recent-years wording binds both Word cases and inspiration cards. Do not use old iconic projects to fill Expert Mode cards when the user asked for recent inspiration. If an older reference is genuinely useful, use it only as a clearly labelled `classic divergent clue`, keep it limited, and do not let it replace the requested recent visual pool.

## Universal no-repeat rule

This rule applies to Deep, Medium, Shallow, Visual Search, and Expert Mode.

Repeat-search requests must not produce the same project, same source page, same project name, or same representative image in card outputs. This applies to project-search candidate cards, visual-search cards, and Expert Mode `更多单点可能性` cards. Before rendering cards, compare card candidates with the current Word shortlist and with any prior output visible in the conversation or previous `链接.txt` files. Remove repeated projects, repeated pages, repeated names, repeated images, and obvious reposts of the same visual/project unless the user explicitly asks to turn selected Word cases into cards.

## Universal low-quality or blurry image note

This rule applies to Deep, Medium, Shallow, Visual Search, and Expert Mode.

If a card uses a low-resolution, blurry, cropped, watermarked, or screenshot-based image because the source does not allow direct download, keep the card only when the visual clue is still strong enough. Add a low-quality or blurry image note in the card folder's `链接.txt` or the task-level `链接.txt`:

`图片说明：不让下载，截图示意。建议结合文字分析去源网站查看。`

Do not create generic placeholder images when a source page, visible webpage image, screenshot or cropped preview fallback can represent the selected reference. If direct image download fails, first try a source-page image, then a screenshot or cropped preview fallback of the actual reference image/page. Use a text placeholder only when no source image, screenshot, or preview can be captured, and mark it as a failure state rather than normal delivery.

Do not silently package a bad screenshot as a normal clean card image. Do not use weak but easy-to-download images to fill card counts.

Card image acquisition should stay time-bounded. For each final card, try one main image and one backup image; if both fail, use a cropped screenshot/preview that still shows the relevant point and write the mandatory image note in `链接.txt`. Do not bulk-download galleries, build image contact sheets, or keep downloaded process folders in normal user-facing runs unless the user explicitly asks for image-material collection.

## Fixed Card Template Contract

There is currently only one approved card template. Use it exactly:

- template asset: `assets/templates/project_card_template.jpg`;
- canvas size: `1600 x 2200`;
- do not change the template ratio, spacing logic, field order, or visual hierarchy;
- do not introduce alternative card templates unless the user explicitly provides and approves another template;
- do not switch layouts based on image ratio;
- do not place long URLs on the card; full URLs belong in `链接.txt`.

The fixed card structure is:

1. large project image at the top;
2. dark rounded `C01`, `C02`, `C03` label in the image area;
3. project title below the image;
4. short project type tag below the title;
5. thin divider line;
6. three bullet reference points;
7. one short retained-value sentence near the bottom;
8. short source label at the bottom, such as `Source: ArchDaily + gooood`.

This template is binding, not a loose visual reference. Only replace image and text content.

## When To Use Cards

Use cards for:

- Deep and Medium project-search candidate supplements by default;
- project-search candidate supplements when the user explicitly asks for cards;
- visual search requests;
- candidate supplements;
- quick browsing alongside a project report when requested.

Deep and Medium research still uses the Word report as the main output. The default five candidate cards are a supplement that preserves useful near-miss candidates from the same research round; they should not replace the Word report.

This Deep/Medium default does not apply to Shallow Mode. Shallow mode remains Word report plus `链接.txt` by default unless the user explicitly asks for cards.

For deep research, the default card document is a candidate-pool card set. It should usually contain other projects, backup references, near-miss candidates, or visual clues, not repeated detail cards from the selected NO1 case. Only create multiple cards from one selected project when the user explicitly asks for a teardown, detail-analysis, or visual-only card set for that project.

NO labels in case documents are sequence labels, not value ranking. Do not use candidate cards to prove that NO1 is "better" than NO2 or NO3; use them to preserve useful non-selected references and explain different angles.

## Required Card Fields

Project reference cards must keep only the most useful text:

| Field | Priority | Rule |
|---|---|---|
| card code | high | use `C01`, `C02`, `C03`... inside the fixed dark label |
| image | high | use one representative project/reference image in the fixed top image area |
| project name | high | strongest text; short; Chinese/English allowed |
| project type | high | short phrase such as 景观塔/旅游节点, 商业空间/咖啡店, 办公空间/品牌前场 |
| key reference points | high | exactly 1-3 specific bullet points; no empty style words |
| retained value sentence | medium | one short sentence at the bottom explaining the retained value |
| source label or source link reference | low | show platform/source label weakly; full URL goes to source-link text file |

Optional fields:

- source type: verified case / visual clue / pending verification;
- recommendation level: strong reference / usable reference / visual only / not recommended;
- why not selected, for candidate supplement cards.

Do not put long background, cost tables, detailed construction judgment, or long paragraphs inside a card.
Card layout should be compact enough for quick browsing. A card should help the user decide whether to open the source or request a deeper document, not show off layout complexity.

## Link Handling

Cards should not carry long URLs unless the user explicitly wants that.

Preferred handling:

- card shows short source label, such as `Source: gooood`;
- separate `链接.txt` lists full source URLs by card/project number.

This keeps the card visually clean while preserving source traceability.

Customer-facing source labels must not expose internal process language.

Use labels like:

- `Source: Pinterest`
- `Source: Alamy`
- `Source: ArchDaily`
- `Source: gooood`
- `Source: Behance`
- `Source: 用户提供图片` only when the user/client knowingly provided the image.

Do not write labels such as `用户样稿图`, `内部参考`, or raw `pending` on customer-facing cards. If tracing is incomplete, use `原项目待追溯`.

Platform logos are optional. Prefer text source labels for the first version because they are clearer, lower-risk, and visually consistent. If logos are used later, keep them small and do not rely on them as the only source indicator.

## Aspect Ratio And Image Cropping

The card layout is fixed. Image ratio differences are handled inside the fixed top image area, not by changing the card template.

Selection priority:

1. project/reference value;
2. source reliability;
3. image quality;
4. image fit inside the fixed template.

If a high-value project has an imperfect image, keep the project and use the best available representative image. Do not choose a weaker project only because its image fits the template better.

Cropping rules:

- never stretch or distort the image;
- preserve image ratio;
- crop to fill the fixed top image area;
- keep the main subject visible;
- prefer showing the complete building/object/space relationship when possible;
- for vertical images, crop carefully around the main subject instead of switching to a poster layout;
- for wide images, crop side areas only when the central subject remains clear.

Automatic cropping defaults:

- start with centered proportional cropping;
- for wide storefront, facade, or signage images, bias the crop slightly upward and toward the main sign/entrance;
- for interior space images, keep the crop centered unless the main activity zone is clearly off-center;
- for aerial, landscape, or destination-building images, bias slightly downward if the building sits in the lower half of the source image;
- use the renderer's focus controls only when the first card visibly cuts off the subject;
- do not spend time perfecting every crop when the card is only a quick screening tool.

## Image Area And Text Density

Image area should usually be 60-85 percent of the card.

Project name is the strongest text.

Key reference points are more important than background description.

Use short, concrete value points:

- “层叠平台形成登高体验”
- “导视与坐凳合并，降低设施堆叠”
- “耐候材料表达山地粗粝感”
- “灯光层次替代高成本造型”

Avoid:

- “高级”
- “现代”
- “有氛围”
- “很有设计感”
- “网红感强”

## Image Quality Policy

Prefer clear, high-resolution, complete images, but project reference value comes first.

If direct image download is blocked, use a screenshot/cropped preview of the actual source-page image before replacing a strong project. This is acceptable for quick visual screening. Do not replace a strong reference only because the first image is not high-resolution.

Priority order:

1. project reference value;
2. source reliability;
3. image quality;
4. layout fit.

### Preferred Image Qualities

Choose images with:

- clear subject edges;
- readable structure, material, and spatial relation;
- enough resolution for Word/PDF review;
- complete subject and reasonable blank area;
- natural color and limited compression artifacts.

Avoid main images that are:

- blurred;
- too low resolution;
- heavily watermarked;
- severely cropped;
- overexposed or underexposed;
- full of compression blocks;
- misleading or disconnected from source facts.

### Value Beats Image Beauty

| Project Value | Image Quality | Handling |
|---|---|---|
| high | high | use as main image/main card |
| high | low/medium | keep the project; look for better image; use current image smaller or mark high-resolution source pending |
| low/medium | high | do not select only because image is beautiful; visual clue only if useful |
| low | low | reject or avoid |

Do not reject a highly relevant project only because the current image is imperfect. Do not choose a low-value project only because its picture is beautiful.

## Visual Search Card Mode

When the user wants only images, object references, material clues, furniture, seats, lighting, small structures, interior details, or visual mood, generate visual search cards.

Fields:

- image;
- title or visual direction;
- type, such as 座椅, 构筑物, 材料, 灯光, 室内细节, 空间氛围;
- visual clue;
- retained value;
- brief reference advice;
- suitable scene;
- source label;
- whether formal tracing is recommended.

If project facts are unverified, mark as visual clue or 原项目待追溯. Do not invent designer, location, year, or project name.

For Expert Mode inspiration cards, especially when the user requests sources such as Pinterest, Behance, or image platforms, the card set is a divergent-thinking layer and is allowed to be a visual inspiration pool rather than a verified project list. These cards should prioritize image relevance, form, material, proportion, atmosphere, analogy value, and single-point usefulness. They do not need to be constrained by whether every image comes from a verified real project. However, do not invent factual project metadata; use short source labels such as `Source: Pinterest`, `Source: Behance`, or another visible source label, and keep uncertain items as visual clues. If the source is Pinterest, image search, or another loose visual platform, mark it as inspiration and not a verified project source. For flat graphic/brand topics, use `Source: Behance` only by default unless the user explicitly asks to expand beyond Behance.

Expert Mode recency applies to inspiration cards when requested. Recent-year requests are a binding design filter, not only a Word-case fact filter. When the request includes recent timing, first search recent Pinterest/Behance/visual-platform material, recent professional media, recent awards, recent studio posts, or recent image-indexed pages. Older famous cards can be useful as analogy, but must be labelled as `classic divergent clue` and should not be counted as the main answer when enough recent clues exist.

For 专项模式项目卡片 / Expert Mode inspiration cards, search priority is: Pinterest -> Behance -> other high-quality visual platforms for spatial/object/form/material topics. Use Pinterest for broader form/material/mood directions; use Behance for more complete visual systems, brand installations, exhibition systems, and concept-quality references. For flat graphic/brand topics, override this default and use Behance only by default; only expand beyond Behance when the user explicitly asks or when Behance cannot provide enough usable references and the user approves expansion. This flat graphic/brand override also applies when Deep, Medium, Shallow, or Visual Search modes are used for flat graphic/brand tasks: their candidate pools should come from Behance first, not Pinterest. Only expand beyond these sources when the first pool is weak, repetitive, inaccessible, or off-topic.

Do not use ZCOOL / 站酷 as a default inspiration card source. User testing found its average output quality too low for Expert Mode cards. Do not use it to fill card counts, and do not label ZCOOL material as a preferred visual clue. If the user explicitly provides a ZCOOL link, treat it only as a user-provided visual clue and apply the same quality gate before using it.

Expert Mode card inspiration still needs a quality gate. Cards may be looser than Word cases, but they should not become a low-quality image dump. Reject generic product photos, ordinary full-house customization images, unrelated whole-room atmosphere images, and images where the requested point is not visible. For small-point topics, each card should clearly show the object/detail and one borrowable clue: proportion, material, lighting, edge treatment, hidden/open relationship, display method, use behavior, or spatial placement.

Word cases remain precise: selected Expert Mode Word cases should directly answer the confirmed special point and carry the main professional judgment. Expert Mode cards are different. They may include adjacent inspiration, analogy references, plane references, material references, object references, or atmosphere references when those images can help the designer think through the confirmed point. For example, a ramp-related request may still use a ground-plane, paving, edge, lighting, or surface-treatment card if the card clearly explains the transferable clue. Do not use adjacency as an excuse for random filler: each card must explain how the adjacent clue helps the user's single-point problem.

For Expert Mode, do not reuse selected Word cases as Expert Mode inspiration cards. Before rendering cards, compare card candidates against the Word-case pool by project name, source URL, source page, and representative image. If the same item appears in the Word report, remove it from the card set and choose a different inspiration image or adjacent visual clue. This no-overlap rule is stricter than the normal project-search candidate-card rule because Expert Mode cards should expand options, not repeat the evidence already analyzed in the Word report.

### Expert Mode Cards: 更多单点可能性

When Expert Mode outputs inspiration cards, name the card folder `更多单点可能性`.

Expert Mode cards are not project cards and not mini research reports. Their job is to help designers quickly see more single-point possibilities beyond the Word cases. Use short conversational Chinese, not formal report language.

For each Expert Mode card:

- title should describe the visual action or single-point direction, not default to the project name;
- type tag should name the object and strategy, such as `入口雕塑 / 阵列导入`;
- write exactly three short sentences:
  1. what single-point possibility the image provides;
  2. what scenario or design problem it fits;
  3. what to control when translating it into a real project, or why this adjacent/analogy clue helps the confirmed point;
- Do not write 保留价值 or a retained-value footer in Expert Mode cards;
- keep only a weak source label at the bottom, such as `Source: Pinterest`, `Source: Behance`, `Source: UAP`, or another visible platform/source label;
- keep full URLs in `链接.txt` when they are available.

This exception applies only to Expert Mode inspiration cards. Deep, Medium, Shallow, and normal Visual Search cards may still use the standard retained-value sentence when appropriate.

Do not apply this Expert Mode visual-pool priority to Deep, Medium, Shallow, or normal Visual Search card supplements. In those modes, card supplements should mainly reuse valuable candidates from the same research/screening round, not start a new external visual hunt.

### Card renderer automation boundary

Use `scripts/render_project_card.ps1` as the deterministic bitmap renderer for card outputs when local image files and card text are ready.

Deep and Medium modes use this renderer for the default five `项目参考卡片`, normally numbered `C01-C05`.

Expert Mode uses this renderer for the default eight `更多单点可能性` inspiration cards, normally numbered `C01-C08`.

The script only renders the approved bitmap layout: it crops the provided image, places the code, title, type tag, three points, footer/source label, and saves a 1600 x 2200 PNG. It does not search, select, download, screenshot, verify, or write the card copy. Do not treat a successfully rendered card as proof that the source, image, or card idea is good.

Before calling the renderer, prepare:

- a local image or screenshot/cropped preview that visibly answers the user's object or single-point request;
- a card title and type tag;
- exactly three short sentences for Expert Mode cards, or the standard project-card points for Deep/Medium candidate cards;
- a short source label for the card face;
- full URLs in `链接.txt` when available;
- no-repeat checks against Word cases and previous outputs.

For small objects such as seats, lamps, handrails, furniture, materials, paving, wall details, or small structures, the card should focus on what can be borrowed:

- form or proportion;
- material or finish;
- construction/detail clue;
- suitable spatial scene;
- maintenance or durability warning when obvious.

## Candidate Supplement Card

Use for projects not selected as deep/medium cases but still worth seeing.

When a deep case has already been selected, candidate cards should help the user see the selection logic:

- why this candidate is still worth seeing;
- why it did not become the main deep case, if applicable;
- what angle it adds compared with the selected case;
- whether it should become NO2/NO3 in a fuller deep research run.

Fields:

- image;
- name or visual direction;
- source level;
- one-sentence feature;
- why not selected;
- remaining value;
- source number matching source-link text file.

## Card Prompt Template

When generating a project reference card:

1. use only `assets/templates/project_card_template.jpg` as the visual contract;
2. render a `1600 x 2200` card;
3. place the best representative image into the fixed top image area without stretching;
4. crop proportionally only when needed to keep the subject visible;
5. use the fixed fields: code, title, type tag, 1-3 bullets, retained-value sentence, short source label;
6. move full URL to `链接.txt`;
7. avoid long project description;
8. keep the card useful for fast designer judgment.

If bitmap card rendering is requested, prefer deterministic rendering with `scripts/render_project_card.ps1` so the template remains stable. Use image-generation tools only for generating or editing the underlying image when the user explicitly asks; do not use image generation to redesign the card template.

## Card Quality Red Lines

Reject or revise cards when:

- image is stretched or distorted;
- text looks like a report page;
- value points are empty adjectives;
- link dominates the visual hierarchy;
- a layout other than the fixed `project_card_template.jpg` structure is used without user approval;
- visual clue is packaged as verified project;
- project value is unclear;
- card cannot tell the user why the reference is worth continuing.
