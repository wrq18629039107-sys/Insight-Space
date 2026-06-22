# Resource Library Guide

This file describes how to keep Insight-Space’s resource library useful. It is not final output content for users. It tells the agent what kinds of project experience, keywords, examples, and bad outputs matter.

## Purpose

The resource library gives Insight-Space a designer-like judgment base:

- real client language;
- project categories and aliases;
- minimal clarifying questions;
- keyword patterns;
- platform/source experience;
- good and bad reference examples;
- cost / construction / maintenance risk notes;
- tone examples.

Use this guide when a request needs domain examples or when expanding the skill later.

## Real Request Fragments

Real request fragments are the highest-value resource. Preserve how clients actually speak.

Suggested fields:

- project type;
- client/user quote;
- likely real intent;
- minimum start information present or missing;
- questions worth asking, maximum 1-3;
- Chinese search words;
- English search words;
- useful reference criteria;
- references to reject or downgrade;
- suitable output mode and tone.

Template:

```text
Project type:
User quote:
Likely real need:
Minimum info: enough / not enough; missing:
Questions to ask: 1) 2) 3)
Chinese keywords:
English keywords:
Useful reference means:
Reject/downgrade when:
Recommended mode and tone:
```

## Clarifying Questions

Ask only questions that change research direction.

| Project Type | Ask First | Ask Second | Ask Third | Usually Do Not Ask First |
|---|---|---|---|---|
| commercial street / entrance / outdoor seating | goal: traffic, photo, shade, stay, brand? | temporary or long-term? | budget/maintenance low, medium, high? | material brand or full construction details |
| community park / pocket park | who is served: children, elderly, pets, traffic, community? | hardscape or green dominant? | low-maintenance and safety priority? | full planting list or local code articles |
| exhibition / brand space | core narrative: brand history, product, immersive experience, conversion? | free browsing or linear path? | fixed exhibits or media needs? | all text copy or full exhibition outline |
| cafe / restaurant / retail interior | core audience and consumption scene? | turnover, stay, photo, or brand memory? | budget and schedule tight? | full MEP/fire/kitchen details |
| hotel / homestay / public area | check-in, social, photo, rest, or operation efficiency? | target customer and price band? | cleaning and maintenance capacity? | complete FF&E procurement list |

If the user wants to move fast, state assumptions and continue.

### One-Condition User Guidance

When the user provides only one condition, guide lightly instead of starting a long questionnaire.

The first response should feel like a design partner:

- first reflect what the user is really trying to solve;
- then recommend a mode;
- then name the screening priorities;
- then suggest a first-round sample size;
- then mention the default output folder if files will be produced.

Recommended first-round sizes:

| Mode | First round | Why |
|---|---:|---|
| Deep project search | 3精品案例 | enough to calibrate direction before a full 4-6 case study |
| Medium project search | 4 cases | enough variety without wasting tokens |
| Shallow project search | 5 directions/items | enough to open directions quickly |
| Visual search/card mode | 3-4 cards | enough to test visual taste before expanding |

Examples:

| User says | Infer | Suggested response before action |
|---|---|---|
| "帮我随便搜几个咖啡店看看" | Shallow project search | "这个阶段更像先找方向，不适合一上来做很重的报告。我建议先用浅度探索模式，第一轮找 5 个方向，帮你看看咖啡店的空间气质、动线和停留方式哪类更对。方向确认后再扩展。" |
| "找一点面包店视觉参考" | Visual search mode | "这个更像是在看视觉感觉和店铺气质。我建议先用视觉卡片模式，第一轮做 3-4 张卡片，重点看门头、陈列、材料和光感，不先把它写成完整项目研究。" |
| "帮我找几个办公空间精品案例，做深度研究" | Deep project search | "这个不是随便找灵感了，适合深度模式。我建议第一轮先做 3 个精品案例，先看年轻化、办公行为和空间识别是不是对路；如果方向对，再扩展到完整 4-6 个案例。" |
| "找一点商铺案例，帮我分析一下" | Medium project search | "这个需求需要有判断，但不用一开始写成完整深度档案。我建议用中度探索模式，第一轮先找 4 个案例，重点看业态、门头、动线、材料和可落地做法。" |

Do not ask all possible constraints at the beginning. Ask at most one question if the missing answer would change the search direction. Otherwise state assumptions and continue.

If the user sends several unrelated requests in one message, treat them as separate tasks unless the user says they belong to the same project. Do not connect them as one client conversation. Each independent request needs its own mode recommendation, first-round sample size, and numbered output folder.

## Project Type Taxonomy

Use these categories to map casual phrases to research types.

Spatial / public:

- commercial space;
- brand space;
- exhibition space;
- public space;
- complex space;
- immersive space;
- urban renewal;
- entrance/gateway;
- public art or spatial installation.

Landscape:

- park;
- pocket park;
- community public space;
- plaza;
- streetscape;
- waterfront;
- scenic area;
- campus;
- courtyard;
- commercial outdoor seating;
- viewing platform / tower / pavilion.

Interior:

- cafe;
- restaurant;
- retail;
- office;
- hotel lobby;
- homestay;
- showroom;
- atrium;
- soft furnishing;
- furniture and spatial props when tied to spatial use.

Out of v0.1 scope:

- UI;
- animation;
- graphic identity;
- posters;
- pure industrial product unrelated to spatial scale;
- final construction drawings or compliance certification.

## Keyword Pattern

Formula:

`project type + scene/user + design goal + strategy word + scale/constraint + place/climate`

Useful strategy words:

- gateway;
- landmark;
- wayfinding;
- seating;
- threshold;
- interface;
- circulation;
- modular;
- low maintenance;
- low budget;
- durable;
- adaptive reuse;
- placemaking;
- lighting layers;
- material substitution;
- inclusive design;
- flexible seating.

Avoid only using adjectives.

## Platform And Source Experience

Think in capability, not platform reputation only.

- office and official pages verify project facts;
- professional media helps understand design intent and context;
- Chinese media helps local implementation and commercial language;
- portfolio platforms may be useful but need built/unbuilt caution;
- Pinterest, Savee, Instagram, and image search are visual clues unless traced;
- user photos help current project analysis, not external project identity.

## Good Reference Judgment Example

Good references are not always the most visually dramatic.

Example judgment:

```text
This commercial entrance project is useful because it creates recognition with a light frame, lighting, and seating instead of heavy civil work. It can teach entrance framing, replaceable light modules, and wayfinding-seat integration. Do not copy the suspended lighting if wind, approval, or maintenance capacity is weak. Cost 2 / construction 2 / maintenance 2: useful as a medium-risk local strategy.
```

## Bad AI Output Examples

Bad outputs include:

- “This space is modern,高级, and atmospheric” without any strategy;
- 20 links with no selection;
- Pinterest images named as real projects;
- style similarity treated as project fit;
- high-customization projects recommended to low-budget tasks without simplification;
- every case marked worth referencing;
- no cost, construction, maintenance, operation, or safety risk;
- no source level.

Replace with:

- selected cases;
- source level;
- why kept or downgraded;
- usable strategy;
- non-copy point;
- risk note.

## Risk Notes

Cost risk:

- low: conventional materials, standard components, small accents;
- medium: partial custom furniture, special finish, non-standard pieces;
- high: large non-standard work, rare materials, complex structure/MEP.

Construction risk:

- low: common process and forgiving details;
- medium: clear detailing and coordination needed;
- high: complex structure, special craft, strong site constraints, approval coordination.

Maintenance risk:

- low: durable, easy cleaning, low operation burden;
- medium: periodic cleaning, lighting, furniture, or planting maintenance;
- high: frequent damage, hard cleaning, demanding planting, heavy operation management.

Always propose a simplification path when possible.

## Tone Examples

Internal professional judgment:

```text
Keep this case, but learn the path and interface only. Do not copy the material package; cost and maintenance are too high for a low-budget site.
```

Client-readable explanation:

```text
This case is useful because it creates a clear entrance memory with a light structure. For our project, the form can be simplified and the lighting system should be adjusted according to budget and maintenance capacity.
```

## Resource Expansion Priority

When adding more resources later:

1. add 5-10 real request fragments;
2. add 10-20 keyword groups for common project types;
3. add trusted / usable / visual-only / avoid platform notes;
4. add good and bad case judgment examples;
5. add cost, construction, maintenance examples;
6. add tone examples.
