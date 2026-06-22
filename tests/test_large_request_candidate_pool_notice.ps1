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
$sourceRules = Read-Utf8 'references/source_research_rules.md'

foreach ($text in @($skill, $outputRules, $sourceRules)) {
    Assert-Contains $text 'Large requested-count notice' 'Large requested-count notice must be documented in all core rule files.'
    Assert-Contains $text 'increase the rough candidate pool' 'Rules must tell the user when the rough candidate pool increases.'
    Assert-Contains $text 'about 5-8 extra minutes' 'Rules must include the extra-time notice for larger searches.'
    Assert-Contains $text 'before online search starts' 'Rules must require this notice before online search starts.'
}

Assert-Contains $skill 'from 16 to about 25 candidates' 'SKILL.md must include the user-facing candidate-pool example.'
Assert-Contains $outputRules 'large-count confirmation wording' 'Output rules must include a reusable large-count confirmation wording block.'
Assert-Contains $sourceRules 'large requested-count search' 'Source rules must define how to scale search for many requested cases.'

Write-Host 'Large requested-count candidate-pool notice rules are present.'
