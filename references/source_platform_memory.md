# Source Platform Memory / 网站问题记忆规则

This file records reusable source-platform problems and handling methods discovered during Insight-Space research. Use it before repeating known slow or fragile website operations.

Core rule: platform memory saves time, but it does not replace live source verification. A final client-facing link still needs a quick open/title/content check.

Image fallback rule: Do not create generic placeholder images when a source page, visible webpage image, screenshot or cropped preview fallback can represent the selected reference. If direct image download fails, use a source-page image, browser screenshot, or cropped preview fallback of the actual reference before considering any text-only placeholder.

## When To Read This File

Read this file when:

- a search result comes from a known platform below;
- a page opens but image download fails;
- a source requires login, has anti-hotlink protection, captcha, lazy-loaded images, or format problems;
- a Word report needs an embedded image and the source image cannot be downloaded cleanly;
- the same platform repeatedly wastes search time.

## Local Runtime Issue Record / 本地运行问题记录

When a new website problem appears during a real run, record it if the environment allows safe local file writes.

Default local record path:

```text
Desktop/Insight-Space输出/source_issue_memory.md
```

If that folder is unavailable, write the note in the current task output folder. If no filesystem is available, mention the issue in the final response and keep going.

Record only reusable technical/source behavior. Do not store passwords, cookies, private screenshots, paid content, or user-sensitive data.

Suggested entry format:

```text
## domain.com - YYYY-MM-DD
- Problem:
- Seen when:
- With tools:
- Without tools:
- Next time:
- Source use: formal case / visual clue / avoid
```

## Platform Memory Table

| Platform / problem | Known issue | 有工具时 | 无工具时 | Source use |
|---|---|---|---|---|
| Archilovers | User testing found wrong or unreliable project links. | Open exact URL and cross-check title/content. If anything mismatches, replace with official office, ArchDaily, gooood, Landezine, or another reliable page. | Do not use as final source unless the user supplied the URL and it was already verified. | Default avoid as final source. |
| Landezine | Professional source is useful, but direct image download can trigger protection/captcha. | Use Landezine for facts and link; try design-office/official page for image, or use a cropped screenshot of the actual project photo if necessary. Do not chase high-res image for too long. | Use the Landezine page as a B-level source link; mark image pending or use another verified source with usable image. | B-level professional media. |
| Landscape Forms | Official product pages often have stable transformed image URLs. | Prefer official product page and its image URLs for product/light/furniture references. | Use product page as official source; do not invent project context. | A-level product source, not a built project unless project page supports it. |
| Streetlife | Pages can expose responsive webp images; old Word environments may not handle webp well. Original jpg may be available by removing the style path when clear. | Prefer original jpg or screenshot fallback. Verify project page title and keep full URL in link file. | Use the project page as official/product source; avoid forcing images into Word if format cannot be handled. | A/B depending on whether it is official project/product page. |
| ArchDaily / ArchDaily CN | Usually reliable as professional media; product catalog pages are often brand-provided product information. | Verify title/content, use article/catalog images when accessible, and distinguish article year from completion year. | Use as B-level source; do not over-read every page just to validate a final link. | B-level media/catalog source. |
| MOOOOL / mooool (`https://mooool.com/`) | Professional landscape/environment design media; strong for landscape design, public space, parks, waterfronts, landscape structures, installations, paving, planting, sales-center landscape, community outdoor nodes, and high-aesthetic landscape references. Some pages may expose membership/login prompts or image-access friction. | Use as the first-priority source for 环境设计 / landscape-oriented research. Verify title/content, use accessible project images, and trace to design-office/official pages when deep verification needs higher confidence. If image download fails, use source-page image or screenshot/cropped preview fallback. | Use as B-level professional media for landscape/environment discovery; do not invent facts not visible on the page. | B-level professional media; first-priority for environment/landscape. |
| gooood / ArchCollege / Chinese design media | Useful for Chinese/local context, but repost chains may blur original facts. | Use as professional source, then trace to office/official page when deep mode needs high confidence. | Use as B-level source and clearly mark source level if original office page is not found. | B-level professional media. |
| YinjiSPACE (`https://www.yinjispace.com/`) | high-end interior and spatial design media, strong for interior, commercial, hospitality, residential, material, lighting, and atmosphere references. | Use early for high-aesthetic interior/commercial/spatial searches. Verify title/content and use images when accessible. Trace to office, official project page, award page, or another reliable source when deep verification is needed. | Use as B-level professional media for spatial/aesthetic discovery; do not treat it as an architecture-code or technical-verification authority. | B-level professional media. |
| Behance | Strong for portfolios, exhibition, brand, concept, and visual systems; may include unbuilt/student/concept work. For flat graphic/brand tasks across all five modes, it is the only default first-pass source platform. | Check whether the work is built, concept, competition, or portfolio only. For graphic/brand tasks, treat as portfolio/visual-system reference unless proven otherwise. | Use as portfolio/visual source unless built status is clear. Use Behance-only by default for menu layout, brand identity, poster/layout, packaging system, typography hierarchy, information hierarchy, and visual identity tasks. | B/C depending on completeness. |
| Pinterest | Login/search friction; images often lack project facts. Quality is uneven for flat graphic/brand tasks and can slow screening. | Use logged browser or search-result thumbnails as visual clue and reverse-search direction. Do not treat as verified project. Do not default to Pinterest for flat graphic/brand tasks unless the user explicitly asks or approves expansion beyond Behance. | Use only as keyword/visual direction clue; do not write project name/designer/year from it. | C-level visual clue. |
| Instagram / visual social platforms | Useful for trend, usage, photo spots, and small-point inspiration; weak for formal facts. | Use as visual/site clue when it answers aesthetics, atmosphere, material, furniture, lighting, or local behavior. | Do not rely on it for formal project facts. | C-level visual clue. |
| ZCOOL / 站酷 | User testing found average visual/professional quality too low for Insight-Space outputs. Search results often include concept renderings, vendor-like标识方案, and weak project context. | Do not use as a default search, Word-case, or Expert Mode card source. If the user explicitly provides a ZCOOL link, treat it only as a user-provided visual clue and run the quality gate. | Avoid by default; do not use it to fill missing card counts. | Default avoid / blacklisted. |
| Alamy | C-level visual clue / stock-image source. Useful for licensing-quality images, objects, materials, street furniture, atmosphere, and visual search; not usually a project-fact source. | Use for image clues or material/object references, then trace original source if a formal case is needed. | Treat as visual source only. | C-level visual clue unless original source is traced. |

## Common Technical Problems

| Problem | 有工具时 | 无工具时 |
|---|---|---|
| Direct image URL returns captcha / small HTML file | Stop trying the same hotlink. Use official source, alternate image on same verified page, or screenshot or cropped preview fallback of the actual project photo. Do not create generic placeholder images if any source-page preview can be captured. | Keep source link and mark image pending; do not replace with AI-generated or unrelated image. |
| Image is webp and Word cannot embed it | Convert if a safe converter is available, use original jpg if obvious, or take a screenshot crop. | Choose another verified image source or omit image note; do not force incompatible image. |
| Lazy-loaded images hidden in page scripts | Inspect page HTML for `srcset`, `og:image`, or image CDN paths; try only 1-2 likely candidates. | Use the page as source and avoid spending time on image extraction. |
| Page requires login or blocks automation | Use logged browser screenshot only if the user is already logged in and the content is visible. | Treat as visual clue or skip; do not use as final formal source. |
| Final URL opens but content/title mismatches | Remove it and replace with the next reliable candidate. | Do not include the link in `链接.txt`. |
| Project is strong but image is low clarity | Keep the project if relevance is high. Use screenshot/preview fallback and let the user open the original URL for detail. | Mark image as pending/preview source if needed. |

## How To Use Memory During Search

1. Start with known high-value sources, but apply the platform table before opening many similar pages.
2. If a known platform issue appears, switch method once; do not repeat the same failed operation.
3. Separate formal cases from visual clues immediately.
4. Prefer project/source value over perfect image clarity.
5. Record new reusable issues in the local runtime issue record.
6. Keep user-facing output clean: full URLs usually live in `链接.txt`, not inside visual cards or compressed report tables. Expert Mode Word reports are the exception: each selected Word case should also show its original URL under `6. 原网址 / 延伸查看`.
