$ErrorActionPreference = "Stop"

function U([string]$base64) {
  return [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($base64))
}

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$renderer = Join-Path $root "scripts\render_medium_report.ps1"
$sample = Join-Path $root "examples\medium_report_input_sample.json"

if (!(Test-Path -LiteralPath $renderer)) {
  throw "Missing medium report renderer: $renderer"
}

$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) ("insight-space-medium-test-" + [System.Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

try {
  & $renderer -InputJson $sample -OutputDir $tempDir | Out-Null

  $docx = Join-Path $tempDir ((U "5Lit5bqm5qih5byPXw==") + "retail-medium-test.docx")
  $links = Join-Path $tempDir ((U "6ZO+5o6l") + ".txt")

  if (!(Test-Path -LiteralPath $docx)) {
    throw "Expected medium Word output was not created: $docx"
  }
  if (!(Test-Path -LiteralPath $links)) {
    throw "Expected link output was not created: $links"
  }

  $linkText = Get-Content -LiteralPath $links -Raw -Encoding UTF8
  if (!$linkText.Contains("https://example.com/sample-medium-shop")) {
    throw "Link output does not contain the sample medium source URL."
  }

  $word = $null
  $doc = $null
  try {
    $word = New-Object -ComObject Word.Application
    $word.Visible = $false
    $word.DisplayAlerts = 0
    $doc = $word.Documents.Open($docx, $false, $true, $false)

    $text = $doc.Content.Text
    if ($doc.Tables.Count -ne 3) {
      throw "Expected exactly three medium-template tables; got $($doc.Tables.Count)."
    }
    if ($doc.InlineShapes.Count -lt 1) {
      throw "Expected at least one inline project image."
    }
    foreach ($heading in @(
      (U "MS7moLjlv4PliKTmlq0="),
      (U "Mi7mnIDlgLzlvpflj4LogIM="),
      (U "My7lgJ/pibTmlrnlkJHlu7rorq4="),
      (U "NC7po47pmanmj5DphpI="),
      (U "NS7nu5Porro=")
    )) {
      if (!$text.Contains($heading)) {
        throw "Rendered medium document is missing heading: $heading"
      }
    }
    foreach ($wrongHeading in @(
      (U "Ni7po47pmanmj5DphpI="),
      (U "Ny7nu5Porro=")
    )) {
      if ($text.Contains($wrongHeading)) {
        throw "Rendered medium document still contains wrong heading: $wrongHeading"
      }
    }

    $firstParagraph = ""
    foreach ($paragraph in $doc.Paragraphs) {
      $candidate = (($paragraph.Range.Text -replace "[`r`a]", " ").Trim())
      if ($candidate.Length -gt 0) {
        $firstParagraph = $candidate
        break
      }
    }
    if (!$firstParagraph.StartsWith("NO1.")) {
      throw "Rendered medium document should start directly with NO1; first paragraph was: $firstParagraph"
    }
  } finally {
    try { if ($doc) { $doc.Close($false) | Out-Null } } catch {}
    try { if ($word) { $word.Quit() | Out-Null } } catch {}
  }

  "PASS: medium report renderer produced Word and link outputs from sample JSON."
} finally {
  if (Test-Path -LiteralPath $tempDir) {
    Remove-Item -LiteralPath $tempDir -Recurse -Force
  }
}
