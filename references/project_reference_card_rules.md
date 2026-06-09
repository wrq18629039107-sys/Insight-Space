# Project Reference Card Rules

This file defines project reference cards, visual search cards, layout selection, image quality, and card quality checks.

Cards are not miniature research reports. They are image-led, text-light, and built for fast design screening.

Cards are functional search-memory tools. They help avoid wasting useful search results and give the user more reference directions. They are not the final purpose of the skill and should not become decorative performance pieces.

Card visuals are separate from research documents. A research document may contain project images for analysis, but those images are not card visuals. Project-search modes do not output card visuals by default. When requested, card visuals are candidate references: almost-selected backup projects or supplementary visual clues. A card output should be delivered as its own card document, image set, or visual folder, not embedded inside numbered case reports.

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

- project-search candidate supplements when the user explicitly asks for cards;
- visual search requests;
- candidate supplements;
- quick browsing alongside a project report when requested.

Deep research still uses one case document per selected case. Cards can supplement deep research but should not replace deep documents.

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
