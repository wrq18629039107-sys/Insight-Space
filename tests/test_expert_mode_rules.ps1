param(
    [string]$SkillRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
)

$ErrorActionPreference = 'Stop'
$utf8 = [System.Text.Encoding]::UTF8

function Read-Utf8([string]$RelativePath) {
    $path = Join-Path $SkillRoot $RelativePath
    if (-not (Test-Path -LiteralPath $path)) {
        throw "Missing required file: $RelativePath"
    }
    return [System.IO.File]::ReadAllText($path, $utf8)
}

function Assert-Contains([string]$Text, [string]$Needle, [string]$Message) {
    if (-not $Text.Contains($Needle)) {
        throw $Message
    }
}

function U([string]$Base64) {
    return [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($Base64))
}

$skill = Read-Utf8 'SKILL.md'
$outputRules = Read-Utf8 'references/output_document_rules.md'
$sourceRules = Read-Utf8 'references/source_research_rules.md'
$cardRules = Read-Utf8 'references/project_reference_card_rules.md'
$acceptance = Read-Utf8 'tests/acceptance_criteria.md'
$prompts = Read-Utf8 'tests/test_prompts.md'

Assert-Contains $skill (U '6aG555uu5pCc57SiLeS4k+WutuaooeW8jw==') 'SKILL.md must list Expert Mode as the fifth mode.'
Assert-Contains $skill (U '5a6h576O5qCH5p2G5Z6L') 'SKILL.md must define aesthetic benchmark expert intent.'
Assert-Contains $skill (U '5Y2V54K55LiT6aG55Z6L') 'SKILL.md must define single-point expert intent.'
Assert-Contains $skill (U '6JC95Zyw5o6n5Yi25Z6L') 'SKILL.md must define implementation-control expert intent.'
Assert-Contains $skill (U '6aOO6Zmp6YG/5Z2R5Z6L') 'SKILL.md must define risk-avoidance expert intent.'
Assert-Contains $skill (U '57u85ZCI5LiT5Lia5Z6L') 'SKILL.md must define comprehensive expert intent.'
Assert-Contains $skill (U '56qB56C05Y+j56Gu6K6k') 'SKILL.md must require breakthrough-point confirmation.'
Assert-Contains $skill (U '5Li756qB56C054K5') 'SKILL.md must mention the main breakthrough point.'

Assert-Contains $skill (U 'OC0xMiDkuKrop4bop4kv6aG555uu5Y+C6ICD') 'Expert aesthetic benchmark quantity must be documented.'
Assert-Contains $skill (U 'Ni0xMCDkuKrkuJPpobnlj4LogIM=') 'Expert single-point quantity must be documented.'
Assert-Contains $skill (U 'NC02IOS4quW8uuebuOWFs+ahiOS+iw==') 'Expert implementation-control quantity must be documented.'
Assert-Contains $skill (U 'My01IOS4qumrmOWPr+S/oeahiOS+iw==') 'Expert risk-avoidance quantity must be documented.'
Assert-Contains $skill (U 'NC02IOS4queyvuWTgeahiOS+iw==') 'Expert comprehensive quantity must be documented.'

Assert-Contains $outputRules (U '5LiT5a625qih5byPX1t1c2VyIHRvcGljXS5kb2N4') 'Output rules must define Expert Mode filename.'
Assert-Contains $outputRules (U '5LiT5a625qih5byP6L6T5Ye66YeN54K5') 'Output rules must define Expert Mode output priorities.'
Assert-Contains $outputRules (U '5bCP54K55LiT6aG55pS257yp5qCH5YeG') 'Output rules must define narrow-point expert standards.'
Assert-Contains $outputRules (U '5pys5qyh5oiR5Lya5oyJ5LiT6aG55qih5byP') 'Output rules must include the approved Expert Mode confirmation template.'
Assert-Contains $outputRules (U 'V29yZCDmlofmoaPvvJpb5pWw6YePXSDkuKrnnJ/lrp7moYjkvosv55yf5a6e6aG555uu5Y+C6ICD') 'Expert Mode confirmation template must include the Word quantity line.'
Assert-Contains $outputRules (U '6L6T5Ye657uT5p6E77yaW+S4k+mhueaooeW8j1/nlKjmiLfpnIDmsYJf5pWw6YeP5Liq5Y+C6ICDLmRvY3hd') 'Expert Mode confirmation template must include the final output structure line.'
Assert-Contains $outputRules 'Inspiration cards do not need to be constrained by whether each item is a verified real project' 'Expert Mode output rules must separate visual inspiration cards from verified Word cases.'
Assert-Contains $cardRules 'Expert Mode inspiration cards' 'Card rules must define Expert Mode inspiration cards.'
Assert-Contains $cardRules 'visual inspiration pool rather than a verified project list' 'Card rules must allow Expert Mode inspiration cards as visual clue pools.'
Assert-Contains $cardRules 'Card source logic differs by mode' 'Card rules must distinguish Expert Mode inspiration cards from other mode candidate cards.'
Assert-Contains $cardRules 'Pinterest first, then Behance' 'Expert Mode card source priority must be Pinterest, then Behance.'
Assert-Contains $cardRules 'Pinterest -> Behance' 'Expert Mode card source priority must be explicit in user-facing terms.'
Assert-Contains $skill 'Exception for flat graphic/brand tasks' 'SKILL.md must define the flat graphic/brand source-routing exception.'
Assert-Contains $skill 'Across all five modes, use Behance as the only default search/source platform' 'Flat graphic/brand tasks must use Behance only by default across all modes.'
Assert-Contains $sourceRules 'Flat Graphic/Brand Source Rule' 'Source rules must define the flat graphic/brand Behance-only source rule.'
Assert-Contains $sourceRules 'use Behance only by default across all five modes' 'Flat graphic/brand source rules must default to Behance only across all modes.'
Assert-Contains $sourceRules 'Do not default to Pinterest' 'Flat graphic/brand tasks must not default to Pinterest.'
Assert-Contains $outputRules 'Flat graphic/brand mode exception across all five modes' 'Output rules must define the flat graphic/brand all-mode exception.'
Assert-Contains $cardRules 'For flat graphic/brand topics across all five modes, use Behance only by default' 'Card rules must override normal Pinterest-first priority for flat graphic/brand topics across all modes.'
Assert-Contains $cardRules 'current search candidate pool' 'Non-expert card supplements must reuse valuable candidates from the same screening round.'
Assert-Contains $outputRules (U '5LiN5re35oiQ5LiA5Liq57uT5p6c5rGg') 'Output rules must prevent mixing all expert references into one pool.'
Assert-Contains $outputRules 'assets/templates/expert_mode_template.docx' 'Output rules must bind single-point Expert Mode to the approved expert template.'
Assert-Contains $outputRules 'Do not create a blank Word document and insert the template into it' 'Expert Mode rendering rules must forbid blank-document template insertion.'
Assert-Contains $outputRules 'Do not manually reset page margins or table widths' 'Expert Mode rendering rules must protect template page setup and table widths.'
Assert-Contains $outputRules 'replace only the paragraph text, not the paragraph mark' 'Expert Mode rendering rules must preserve paragraph formatting while filling fields.'
Assert-Contains $outputRules '6. 原网址 / 延伸查看' 'Expert Mode output rules must include the source URL section inside the Word report.'
Assert-Contains $outputRules 'Expert Mode is the exception to the general link rule' 'Output rules must state that Expert Mode can show full URLs in the Word body.'
Assert-Contains $skill 'assets/templates/expert_mode_template.docx' 'SKILL.md must mention the approved expert template.'
Assert-Contains $acceptance 'assets/templates/expert_mode_template.docx' 'Acceptance criteria must include the approved expert template.'
Assert-Contains $skill 'within 15 minutes' 'SKILL.md must define the Expert Mode normal-run time target.'
Assert-Contains $sourceRules 'within 15 minutes' 'Source rules must define the Expert Mode normal-run time target.'
Assert-Contains $sourceRules '20-30 minute exhaustive search' 'Source rules must forbid Expert Mode drifting into very long exhaustive searches.'
Assert-Contains $skill 'one main image plus one backup image' 'SKILL.md must define the image acquisition limit.'
Assert-Contains $sourceRules 'one main image and one backup image' 'Source rules must define the image acquisition limit.'
Assert-Contains $cardRules 'one main image and one backup image' 'Card rules must define the card image acquisition limit.'

$expertTemplate = Join-Path $SkillRoot 'assets\templates\expert_mode_template.docx'
if (-not (Test-Path -LiteralPath $expertTemplate)) {
    throw "Missing expert mode template: $expertTemplate"
}

function Assert-ExpertTemplateShape([string]$TemplatePath) {
    $word = $null
    $doc = $null
    try {
        $word = New-Object -ComObject Word.Application
        $word.Visible = $false
        $doc = $word.Documents.Open($TemplatePath)

        if ($doc.Tables.Count -ne 3) {
            throw "Expert template must contain exactly 3 tables."
        }
        if ($doc.InlineShapes.Count -ne 1) {
            throw "Expert template must contain exactly 1 image placeholder."
        }
        if ($doc.Tables.Item(3).Rows.Count -ne 4) {
            throw "Expert template logic table must contain exactly 4 rows."
        }

        $text = $doc.Content.Text
        if ($text.Contains('Xxxx')) {
            throw "Expert template must not contain old Xxxx free rows."
        }
        if (-not $text.Contains('6. 原网址 / 延伸查看')) {
            throw "Expert template must contain section 6 for source URLs."
        }

        $titleParagraph = $null
        foreach ($paragraph in $doc.Paragraphs) {
            $paragraphText = ($paragraph.Range.Text -replace "[`r`a]+", "").Trim()
            if ($paragraphText.StartsWith('ID')) {
                $titleParagraph = $paragraph
                break
            }
        }
        if ($null -eq $titleParagraph) {
            throw "Expert template must contain an ID title paragraph."
        }
        $titleFont = $titleParagraph.Range.Font
        if ($titleFont.Size -lt 20) {
            throw "Expert template title font must be at least 20pt to avoid compressed-looking titles."
        }
        if ($titleFont.Scaling -ne 100) {
            throw "Expert template title font scaling must be 100."
        }
        if ($titleFont.Spacing -ne 0) {
            throw "Expert template title character spacing must be 0."
        }
        if ($titleParagraph.Range.FitTextWidth -ne 0) {
            throw "Expert template title must not use fit-text compression."
        }
        if ($titleParagraph.Format.LineSpacingRule -ne 0) {
            throw "Expert template title must use normal line spacing, not exact/compressed line spacing."
        }

        $usableWidth = $doc.PageSetup.PageWidth - $doc.PageSetup.LeftMargin - $doc.PageSetup.RightMargin
        for ($i = 1; $i -le $doc.Tables.Count; $i++) {
            $table = $doc.Tables.Item($i)
            if ($table.PreferredWidthType -ne 3) {
                throw "Expert template table $i must use point-based fixed preferred width."
            }
            if ([Math]::Abs($table.PreferredWidth - $usableWidth) -gt 2) {
                throw "Expert template table $i width must match the usable page width."
            }
            if ($table.Rows.Alignment -ne 0) {
                throw "Expert template table $i must be left aligned."
            }
            if ([Math]::Abs($table.Rows.LeftIndent) -gt 0.5) {
                throw "Expert template table $i must not have a left indent."
            }
        }
    }
    finally {
        if ($doc) { try { $doc.Close($false) | Out-Null } catch {} }
        if ($word) { try { $word.Quit() | Out-Null } catch {} }
    }
}

Assert-ExpertTemplateShape $expertTemplate

Assert-Contains $sourceRules (U '5LiT5a625qih5byP5p2l5rqQ5aSE55CG') 'Source rules must define Expert Mode source handling.'
Assert-Contains $sourceRules 'Pinterest, Instagram, Alamy' 'Source rules must allow visual clue platforms where appropriate.'
Assert-Contains $sourceRules (U '5LiN6IO95b2T5L2c5bey6aqM6K+B6aG555uu') 'Source rules must forbid treating social/visual clues as verified projects.'
Assert-Contains $sourceRules (U '6ZO+5o6l5YaZ5YWl5YmN5b+F6aG75omT5byA6aqM6K+B') 'Source rules must require final links to be opened before writing.'
Assert-Contains $sourceRules (U '5Yqf6IO96K+N') 'Source rules must require functional keyword expansion for small-point expert searches.'
Assert-Contains -Text $sourceRules -Needle 'source_platform_memory.md' -Message 'Source rules must route platform-specific problems to the source platform memory reference.'
Assert-Contains -Text $sourceRules -Needle 'Expert Mode Small-Point Quality Gate' -Message 'Source rules must define a quality gate for small-point expert searches.'
Assert-Contains -Text $sourceRules -Needle 'do not search only the literal object name' -Message 'Small-point expert searches must not use only literal object names.'
Assert-Contains -Text $sourceRules -Needle 'storage as architecture' -Message 'Small-point expert keyword rules must include professional strategy keywords for storage/cabinet searches.'
Assert-Contains -Text $sourceRules -Needle 'ordinary full-house customization' -Message 'Small-point expert quality gate must downgrade ordinary full-house customization results.'
Assert-Contains -Text $sourceRules -Needle 'cabinet as spatial skeleton' -Message 'Small-point expert quality gate must require cabinet-as-space logic where relevant.'
Assert-Contains -Text $sourceRules -Needle 'visual memory' -Message 'Small-point expert quality gate must protect aesthetic/selective quality.'
Assert-Contains -Text $outputRules -Needle 'small-point quality gate before writing' -Message 'Output rules must require the small-point quality gate before writing Expert Mode reports.'
Assert-Contains -Text $outputRules -Needle 'ordinary cabinet image' -Message 'Output rules must prevent ordinary object images from entering Expert Mode Word reports.'
Assert-Contains -Text $cardRules -Needle 'Expert Mode card inspiration still needs a quality gate' -Message 'Card rules must keep Expert Mode inspiration cards from becoming low-quality image dumps.'
Assert-Contains -Text $sourceRules -Needle 'ordinary conventional product or pattern' -Message 'Source rules must downgrade ordinary conventional products or patterns across disciplines.'
Assert-Contains -Text $sourceRules -Needle 'downgrade to visual clue or reject' -Message 'Source rules must define downgrade handling for ordinary conventional expert results.'
Assert-Contains -Text $outputRules -Needle 'No Word-card overlap in Expert Mode' -Message 'Output rules must forbid overlap between Expert Mode Word cases and inspiration cards.'
Assert-Contains -Text $outputRules -Needle 'Word report and inspiration cards must be disjoint sets' -Message 'Output rules must require disjoint Word and card pools.'
Assert-Contains -Text $cardRules -Needle 'do not reuse selected Word cases as Expert Mode inspiration cards' -Message 'Card rules must forbid repeating selected Word cases in Expert Mode cards.'
Assert-Contains -Text $skill -Needle 'Expert Mode Word cases and inspiration cards must not overlap' -Message 'SKILL.md must state the Expert Mode no-overlap rule.'
Assert-Contains -Text $cardRules -Needle '更多单点可能性' -Message 'Expert Mode card folder must be named 更多单点可能性.'
Assert-Contains -Text $cardRules -Needle 'short conversational Chinese' -Message 'Expert Mode cards must use short conversational Chinese.'
Assert-Contains -Text $cardRules -Needle 'Do not write 保留价值' -Message 'Expert Mode cards must remove the retained-value footer.'
Assert-Contains -Text $cardRules -Needle 'exactly three short sentences' -Message 'Expert Mode cards must use exactly three short sentences.'
Assert-Contains -Text $sourceRules -Needle 'ZCOOL / 站酷' -Message 'Source rules must blacklist ZCOOL / 站酷 for default Insight-Space search.'
Assert-Contains -Text $cardRules -Needle 'Do not use ZCOOL' -Message 'Card rules must forbid ZCOOL as a default inspiration card source.'
Assert-Contains -Text $sourceRules -Needle 'Expert Mode recency rule' -Message 'Source rules must define Expert Mode recency rule.'
Assert-Contains -Text $sourceRules -Needle 'within the last 3 years' -Message 'Expert Mode must prioritize cases within the last 3 years.'
Assert-Contains -Text $sourceRules -Needle 'well-known studio or company' -Message 'Expert Mode older cases must require well-known studio or company backing.'
Assert-Contains -Text $skill -Needle 'scripts/render_expert_report.ps1' -Message 'SKILL.md must mention the Expert Mode Word renderer.'
Assert-Contains -Text $outputRules -Needle 'Expert Word Renderer' -Message 'Output rules must document the Expert Mode Word renderer.'
Assert-Contains -Text $outputRules -Needle 'does not search the web, verify links, choose cases, choose the representative' -Message 'Output rules must keep the Expert renderer separate from research judgment.'
Assert-Contains -Text $skill -Needle '第 4 条不能写成固定句式' -Message 'SKILL.md must prevent formulaic Expert Mode section 4 language.'
Assert-Contains -Text $outputRules -Needle '用户这次确认的核心关注点' -Message 'Output rules must require Expert Mode section 4 to respond to the user-confirmed priority.'
Assert-Contains -Text $outputRules -Needle '每个案例的适用判断必须有不同判断角度' -Message 'Output rules must require varied Expert Mode section 4 applicability judgments.'
Assert-Contains -Text $outputRules -Needle '不要让每个案例都以同一套' -Message 'Output rules must explicitly reject repeated section 4 stock phrasing.'

$platformMemory = Read-Utf8 'references/source_platform_memory.md'
Assert-Contains -Text $platformMemory -Needle 'Archilovers' -Message 'Platform memory must record Archilovers reliability problems.'
Assert-Contains -Text $platformMemory -Needle 'Landezine' -Message 'Platform memory must record Landezine image protection handling.'
Assert-Contains -Text $platformMemory -Needle (U '5pyJ5bel5YW3') -Message 'Platform memory must distinguish tool-assisted handling.'
Assert-Contains -Text $platformMemory -Needle (U '5peg5bel5YW3') -Message 'Platform memory must distinguish no-tool handling.'
Assert-Contains -Text $platformMemory -Needle (U '5pys5Zyw6L+Q6KGM6Zeu6aKY6K6w5b2V') -Message 'Platform memory must define a local runtime issue record.'

Assert-Contains $acceptance (U '5LiT5a625qih5byP') 'Acceptance criteria must include Expert Mode checks.'
Assert-Contains $prompts (U '5raI6Ziy5Z2h6YGT') 'Test prompts must include the fire-ramp expert scenario.'
Assert-Contains $prompts (U '5ZKW5ZWh5bqX5p+c5Y+w6KGo6L6+') 'Test prompts must include the aesthetic single-point expert scenario.'

Write-Host 'Expert mode rules are present.'
