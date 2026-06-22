$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$skill = Get-Content -LiteralPath (Join-Path $root "SKILL.md") -Raw -Encoding UTF8
$sourceRules = Get-Content -LiteralPath (Join-Path $root "references\source_research_rules.md") -Raw -Encoding UTF8
$cardRules = Get-Content -LiteralPath (Join-Path $root "references\project_reference_card_rules.md") -Raw -Encoding UTF8
$outputRules = Get-Content -LiteralPath (Join-Path $root "references\output_document_rules.md") -Raw -Encoding UTF8

function U([string]$base64) {
  return [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($base64))
}

function Assert-Contains {
  param(
    [string]$Text,
    [string]$Needle,
    [string]$Message
  )
  if ($Text -notlike "*$Needle*") {
    throw $Message
  }
}

foreach ($text in @($skill, $sourceRules, $cardRules, $outputRules)) {
  Assert-Contains -Text $text -Needle "Expert Mode recency applies to inspiration cards when requested" -Message "Expert card recency rule must be present in all core rule files."
  Assert-Contains -Text $text -Needle "recent-years wording binds both Word cases and inspiration cards" -Message "Recent-year user requirements must apply to both Expert Word and cards."
}

Assert-Contains -Text $cardRules -Needle "Expert Mode inspiration cards are an inspiration-first visual pool" -Message "Expert cards must be inspiration-first, not candidate supplements."
Assert-Contains -Text $cardRules -Needle "Do not use old iconic projects to fill Expert Mode cards" -Message "Expert cards must not use old icons just to fill card count."
Assert-Contains -Text $cardRules -Needle "classic divergent clue" -Message "Older Expert card references must be explicitly labelled when used."
Assert-Contains -Text $cardRules -Needle "Pinterest -> Behance -> other high-quality visual platforms" -Message "Expert card source priority must remain Pinterest first for spatial/object/form/material topics."
Assert-Contains -Text $sourceRules -Needle "When the user says recent, recent years" -Message "Source rules must define English recent wording triggers."
Assert-Contains -Text $sourceRules -Needle (U "6L+R5Yeg5bm0") -Message "Source rules must define Chinese recent wording triggers."

Write-Output "Expert card recency and inspiration-priority rules are present."
