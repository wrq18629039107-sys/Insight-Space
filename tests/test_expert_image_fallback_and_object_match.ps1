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

$skill = Read-Utf8 'SKILL.md'
$sourceRules = Read-Utf8 'references/source_research_rules.md'
$platformMemory = Read-Utf8 'references/source_platform_memory.md'
$outputRules = Read-Utf8 'references/output_document_rules.md'
$cardRules = Read-Utf8 'references/project_reference_card_rules.md'

foreach ($text in @($skill, $sourceRules, $platformMemory, $outputRules, $cardRules)) {
    Assert-Contains $text 'Do not create generic placeholder images' 'Image fallback rules must forbid generic placeholder images.'
    Assert-Contains $text 'screenshot or cropped preview fallback' 'Image fallback rules must require screenshot/cropped preview fallback when direct download fails.'
}

Assert-Contains $sourceRules 'For Expert Mode Word cases and formal single-point candidates, keep the same requested object category' 'Source rules must keep Expert Mode Word cases in the requested object category.'
Assert-Contains $outputRules 'For Expert Mode Word cases, stay in the same requested object category' 'Output rules must keep Expert Mode Word cases in the requested object category.'
Assert-Contains $cardRules 'adjacent inspiration' 'Expert Mode card rules must allow explained adjacent inspiration.'
Assert-Contains $cardRules 'Do not use adjacency as an excuse for random filler' 'Expert Mode card rules must prevent unrelated card filler.'
Assert-Contains $sourceRules 'Do not use adjacency as an excuse for random filler' 'Source rules must prevent unrelated Expert Mode card filler.'
Assert-Contains $outputRules 'adjacency cannot become random filler' 'Output rules must prevent unrelated Expert Mode card filler.'

Write-Host 'Expert image fallback and Word/card object-matching rules are present.'
