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

function Decode([string]$base64) {
    return [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($base64))
}

$skill = Read-Utf8 'SKILL.md'
$sourceRules = Read-Utf8 'references/source_research_rules.md'

Assert-Contains $skill 'Professional Scope And Source Routing' 'SKILL.md must expose the professional scope and source-routing rule.'
Assert-Contains $sourceRules '## Professional Source Routing' 'Source rules must include a professional source-routing section.'
Assert-Contains $sourceRules (Decode '5YWI5Yik5pat5LiT5Lia77yM5YaN5Yik5pat5Y675ZOq6YeM5pCc') 'Source rules must state the professional routing principle in Chinese.'

$disciplines = @(
    (Decode '546v5aKD6K6+6K6h'),
    (Decode '5bu6562R5a2m'),
    (Decode '5YWs5YWx6Im65pyv'),
    (Decode '6ZuV5aGR'),
    (Decode '6KeG6KeJ5Lyg6L6+'),
    (Decode '5Lqn5ZOB6K6+6K6h'),
    (Decode '5bel6Im6576O5pyv'),
    (Decode '5pWw5a2X5aqS5L2T6Im65pyv')
)
foreach ($discipline in $disciplines) {
    Assert-Contains $sourceRules $discipline "Professional routing must include $discipline."
}

Assert-Contains $sourceRules (Decode '5Yqo55S7') 'Professional routing must explicitly discuss animation.'
Assert-Contains $sourceRules (Decode '5pGE5b2x') 'Professional routing must explicitly discuss photography.'
Assert-Contains $sourceRules (Decode '5pqC5LiN5L2c5Li6IEluc2lnaHQtU3BhY2UgVjIuMCDnmoTkuLvpgILphY3kuJPkuJo=') 'Animation and photography must be excluded from the main V2.0 scope.'

Assert-Contains $sourceRules 'Flat graphic/brand rule applies across all five modes' 'Flat graphic/brand Behance-only rule must apply across all modes, not only Expert Mode.'
Assert-Contains $sourceRules 'Behance only by default' 'Flat graphic/brand routing must default to Behance only.'
Assert-Contains $sourceRules 'Alamy is a C-level visual clue / stock-image source' 'Alamy must be classified as a C-level visual clue source.'
Assert-Contains $sourceRules 'MOOOOL / mooool / gooood' 'Environment design routing must put MOOOOL / mooool before gooood.'
Assert-Contains $sourceRules 'first-priority source' 'MOOOOL must be documented as first-priority for environment/landscape research.'
Assert-Contains $sourceRules 'landscape-oriented research' 'MOOOOL must be documented as first-priority for environment/landscape research.'

Write-Host 'Professional source-routing rules are present.'
