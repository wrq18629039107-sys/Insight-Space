$ErrorActionPreference = "Stop"

$root = Split-Path -Parent $PSScriptRoot
$skill = Get-Content -LiteralPath (Join-Path $root "SKILL.md") -Raw -Encoding UTF8
$outputRules = Get-Content -LiteralPath (Join-Path $root "references\output_document_rules.md") -Raw -Encoding UTF8
$cardRules = Get-Content -LiteralPath (Join-Path $root "references\project_reference_card_rules.md") -Raw -Encoding UTF8

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

function Assert-NotContains {
  param(
    [string]$Text,
    [string]$Needle,
    [string]$Message
  )
  if ($Text -like "*$Needle*") {
    throw $Message
  }
}

Assert-Contains -Text $skill -Needle "Expert Mode is document-first and cannot be card-only" -Message "SKILL.md must state Expert Mode always has a Word document."
Assert-Contains -Text $skill -Needle "one Word-style report is mandatory" -Message "SKILL.md must mark Expert Mode Word output as mandatory."
Assert-Contains -Text $skill -Needle "eight divergent inspiration cards" -Message "SKILL.md must set default Expert Mode cards as divergent inspiration cards."
Assert-NotContains -Text $skill -Needle "no candidate cards unless the user asks" -Message "SKILL.md still contains the old optional-card Expert Mode rule."
Assert-NotContains -Text $skill -Needle "use visual cards or lightweight references when that is more useful than a full project report" -Message "SKILL.md still allows replacing Expert Word with cards."

Assert-Contains -Text $outputRules -Needle "Expert Mode Word report is mandatory" -Message "Output rules must state Expert Mode Word is mandatory."
Assert-Contains -Text $outputRules -Needle "Visual Search is the only default card-only mode" -Message "Output rules must clarify the only card-only default mode."
Assert-Contains -Text $outputRules -Needle "Do not remove the Word document from the Expert Mode output structure" -Message "Output rules must prevent removing Expert Word from the confirmation template."
Assert-NotContains -Text $outputRules -Needle "If the user does not request cards, remove the card phrase" -Message "Output rules still contain old optional-card Expert wording."
Assert-NotContains -Text $outputRules -Needle "choose visual cards/lightweight references instead of forcing a Word report" -Message "Output rules still allow replacing Expert Word with visual-only output."

Assert-Contains -Text $cardRules -Needle "divergent-thinking layer" -Message "Card rules must define Expert cards as divergent thinking."
Assert-Contains -Text $cardRules -Needle "adjacent inspiration" -Message "Card rules must allow adjacent inspiration cards."
Assert-Contains -Text $cardRules -Needle "not a verified project source" -Message "Card rules must mark inspiration cards as non-verified when sourced from visual platforms."
Assert-Contains -Text $cardRules -Needle "Word cases remain precise" -Message "Card rules must keep Word precision separate from card divergence."
Assert-NotContains -Text $cardRules -Needle "must stay in the same requested object category unless the user explicitly asks for adjacent categories" -Message "Card rules still contain old too-strict category rule."

Write-Output "Expert mandatory Word and divergent-card rules verified."
