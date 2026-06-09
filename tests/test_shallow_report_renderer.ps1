$ErrorActionPreference = "Stop"

function U([string]$base64) {
  return [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($base64))
}

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$renderer = Join-Path $root "scripts\render_shallow_report.ps1"
$sample = Join-Path $root "examples\shallow_report_input_sample.json"

if (!(Test-Path -LiteralPath $renderer)) {
  throw "Missing shallow report renderer: $renderer"
}

$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) ("insight-space-shallow-test-" + [System.Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

try {
  & $renderer -InputJson $sample -OutputDir $tempDir | Out-Null

  $docx = Join-Path $tempDir ((U "5rWF5bqm5qih5byPXw==") + "retail-shallow-test.docx")
  $links = Join-Path $tempDir ((U "6ZO+5o6l") + ".txt")
  $images = Join-Path $tempDir "images"

  if (!(Test-Path -LiteralPath $docx)) {
    throw "Expected shallow Word output was not created: $docx"
  }
  if (!(Test-Path -LiteralPath $links)) {
    throw "Expected link output was not created: $links"
  }
  if (Test-Path -LiteralPath $images) {
    throw "Shallow renderer should not create an images output folder."
  }

  $linkText = Get-Content -LiteralPath $links -Raw -Encoding UTF8
  if (!$linkText.Contains("https://example.com/sample-shallow-shop-one") -or !$linkText.Contains("https://example.com/sample-shallow-shop-two")) {
    throw "Link output does not contain the sample shallow source URLs."
  }
  if (!$linkText.Contains((U "6L6T5Ye65qih5byP77ya6aG555uu5pCc57SiLea1heW6puaooeW8jw=="))) {
    throw "Link output does not contain the correct shallow output mode label."
  }

  $word = $null
  $doc = $null
  try {
    $word = New-Object -ComObject Word.Application
    $word.Visible = $false
    $word.DisplayAlerts = 0
    $doc = $word.Documents.Open($docx, $false, $true, $false)

    $text = $doc.Content.Text
    if ($doc.Tables.Count -ne 2) {
      throw "Expected exactly one shallow table per project; got $($doc.Tables.Count)."
    }
    if ($doc.InlineShapes.Count -ne 2) {
      throw "Expected exactly one embedded image per project; got $($doc.InlineShapes.Count)."
    }
    if (!$text.Contains("NO1. Sample Shallow Shop One") -or !$text.Contains("NO2. Sample Shallow Shop Two")) {
      throw "Rendered shallow document does not contain both sample project titles."
    }

    $firstParagraph = ""
    $pagesByTitle = @{}
    foreach ($paragraph in $doc.Paragraphs) {
      $candidate = (($paragraph.Range.Text -replace "[`r`a]", " ").Trim())
      if ($candidate.Length -gt 0 -and $firstParagraph.Length -eq 0) {
        $firstParagraph = $candidate
      }
      if ($candidate.StartsWith("NO1.") -or $candidate.StartsWith("NO2.")) {
        $pagesByTitle[$candidate.Substring(0, 4)] = $paragraph.Range.Information(3)
      }
    }
    if (!$firstParagraph.StartsWith("NO1.")) {
      throw "Rendered shallow document should start directly with NO1; first paragraph was: $firstParagraph"
    }
    if ($pagesByTitle["NO1."] -eq $pagesByTitle["NO2."]) {
      throw "Shallow projects should start on separate pages."
    }
  } finally {
    try { if ($doc) { $doc.Close($false) | Out-Null } } catch {}
    try { if ($word) { $word.Quit() | Out-Null } } catch {}
  }

  "PASS: shallow report renderer produced Word and link outputs from sample JSON."
} finally {
  if (Test-Path -LiteralPath $tempDir) {
    Remove-Item -LiteralPath $tempDir -Recurse -Force
  }
}
