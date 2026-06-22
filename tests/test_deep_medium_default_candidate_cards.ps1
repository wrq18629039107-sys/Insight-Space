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
$outputRules = Read-Utf8 'references/output_document_rules.md'
$cardRules = Read-Utf8 'references/project_reference_card_rules.md'

foreach ($text in @($skill, $outputRules, $cardRules)) {
    Assert-Contains $text 'Deep and Medium modes must output five candidate cards by default' 'Deep/Medium default card rule must be present in all core rule files.'
    Assert-Contains $text 'near-miss candidates from the same research round' 'Deep/Medium cards must come from almost-selected current-round candidates.'
    Assert-Contains $text 'not selected Word cases repackaged as cards' 'Deep/Medium cards must not repeat selected Word cases.'
}

Assert-Contains $outputRules 'Shallow mode still does not output cards by default' 'Shallow mode must remain no-card by default.'
Assert-Contains $cardRules 'This Deep/Medium default does not apply to Shallow Mode' 'Card rules must explicitly exclude Shallow Mode from the new default.'

Write-Host 'Deep/Medium default candidate-card rules are present.'
