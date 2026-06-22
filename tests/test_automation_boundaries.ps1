$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$skill = Get-Content -LiteralPath (Join-Path $root "SKILL.md") -Raw -Encoding UTF8
$outputRules = Get-Content -LiteralPath (Join-Path $root "references\output_document_rules.md") -Raw -Encoding UTF8
$cardRules = Get-Content -LiteralPath (Join-Path $root "references\project_reference_card_rules.md") -Raw -Encoding UTF8
$readme = Get-Content -LiteralPath (Join-Path $root "README.md") -Raw -Encoding UTF8

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

Assert-Contains -Text $skill -Needle "Expert Mode default eight inspiration cards" -Message "SKILL.md must explicitly bind Expert Mode's default 8 inspiration cards to card automation."
Assert-Contains -Text $skill -Needle "render_project_card.ps1" -Message "SKILL.md must mention render_project_card.ps1 as the deterministic card renderer."
Assert-Contains -Text $skill -Needle "does not search, select, download, screenshot, verify, or write the card copy" -Message "SKILL.md must state card automation boundaries."

Assert-Contains -Text $outputRules -Needle "Automation coverage and boundaries" -Message "Output rules must include an automation coverage section."
Assert-Contains -Text $outputRules -Needle "Expert Mode default eight inspiration cards" -Message "Output rules must define Expert Mode card automation."
Assert-Contains -Text $outputRules -Needle "Deep and Medium candidate cards" -Message "Output rules must distinguish Deep/Medium candidate-card automation from Expert inspiration-card automation."

Assert-Contains -Text $cardRules -Needle "Card renderer automation boundary" -Message "Card rules must include card renderer automation boundaries."
Assert-Contains -Text $cardRules -Needle "C01-C08" -Message "Card rules must define Expert Mode default card numbering."
Assert-Contains -Text $cardRules -Needle "The script only renders the approved bitmap layout" -Message "Card rules must clarify render_project_card.ps1 does not choose images or sources."

Assert-Contains -Text $readme -Needle "Claude Code" -Message "README must include a simple other-platform note."
Assert-Contains -Text $readme -Needle "Grok" -Message "README must include a simple other-platform note."
Assert-Contains -Text $readme -Needle "Codex" -Message "README must state Codex is the tested environment."

Write-Output "Automation boundary rules verified."
