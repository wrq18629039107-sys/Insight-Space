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
$cardRules = Read-Utf8 'references/project_reference_card_rules.md'

foreach ($text in @($skill, $outputRules, $cardRules)) {
    Assert-Contains $text 'Universal no-repeat rule' 'All core rule files must define the universal no-repeat rule.'
    Assert-Contains $text 'Deep, Medium, Shallow, Visual Search, and Expert Mode' 'The no-repeat rule must explicitly apply to all five modes.'
    Assert-Contains $text 'Repeat-search requests' 'The no-repeat rule must handle repeated searches and reruns.'
    Assert-Contains $text 'same project, same source page, same project name, or same representative image' 'The no-repeat rule must forbid repeated projects/images.'
    Assert-Contains $text 'low-quality or blurry image note' 'All core rule files must require a note for low-quality or screenshot images.'
    Assert-Contains $text (U '5LiN6K6p5LiL6L2977yM5oiq5Zu+56S65oSP') 'The user-facing note must include the approved Chinese wording.'
    Assert-Contains $text (U '5bu66K6u57uT5ZCI5paH5a2X5YiG5p6Q5Y675rqQ572R56uZ5p+l55yL') 'The user-facing note must tell users to open the source website with the written analysis.'
}

Write-Host 'Universal no-repeat and image-note rules are present.'
