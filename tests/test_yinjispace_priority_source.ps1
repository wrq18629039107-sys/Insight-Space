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

foreach ($text in @($skill, $sourceRules, $platformMemory)) {
    Assert-Contains $text 'YinjiSPACE' 'YinjiSPACE must be named in core source rules.'
    Assert-Contains $text 'https://www.yinjispace.com/' 'YinjiSPACE URL must be documented.'
}

Assert-Contains $sourceRules 'high-priority source for interior, commercial, hospitality, residential, and high-aesthetic spatial references' 'Source rules must classify YinjiSPACE as a high-priority spatial source.'
Assert-Contains $sourceRules 'B-level professional media' 'Source rules must keep YinjiSPACE as professional media, not an official source.'
Assert-Contains $sourceRules 'not a primary architecture-code or technical-verification source' 'Source rules must prevent overusing YinjiSPACE as an architecture technical authority.'

Assert-Contains $platformMemory 'high-end interior and spatial design media' 'Platform memory must record YinjiSPACE positioning.'
Assert-Contains $platformMemory 'Trace to office, official project page, award page, or another reliable source when deep verification is needed.' 'Platform memory must require cross-checking when deeper verification is needed.'

Write-Host 'YinjiSPACE high-priority source rules are present.'
