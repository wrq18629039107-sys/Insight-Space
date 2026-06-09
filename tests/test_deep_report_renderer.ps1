$ErrorActionPreference = "Stop"

function U([string]$base64) {
  return [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($base64))
}

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$renderer = Join-Path $root "scripts\render_deep_report.ps1"
$sample = Join-Path $root "examples\deep_report_input_sample.json"

if (!(Test-Path -LiteralPath $renderer)) {
  throw "Missing deep report renderer: $renderer"
}

if (!(Test-Path -LiteralPath $sample)) {
  throw "Missing sample input: $sample"
}

$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) ("insight-space-deep-test-" + [System.Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

try {
  & $renderer -InputJson $sample -OutputDir $tempDir | Out-Null

  $docx = Join-Path $tempDir ((U "5rex5bqm5qih5byPXw==") + "office-young-test.docx")
  $links = Join-Path $tempDir ((U "6ZO+5o6l") + ".txt")

  if (!(Test-Path -LiteralPath $docx)) {
    throw "Expected Word output was not created: $docx"
  }
  if (!(Test-Path -LiteralPath $links)) {
    throw "Expected link output was not created: $links"
  }

  $linkText = Get-Content -LiteralPath $links -Raw -Encoding UTF8
  if (!$linkText.Contains("https://example.com/sample-young-office")) {
    throw "Link output does not contain the sample source URL."
  }

  $word = $null
  $doc = $null
  try {
    $word = New-Object -ComObject Word.Application
    $word.Visible = $false
    $word.DisplayAlerts = 0
    $doc = $word.Documents.Open($docx, $false, $true, $false)

    $text = $doc.Content.Text
    if (!$text.Contains("NO1. Sample Young Office")) {
      throw "Rendered document does not contain the project title."
    }
    if ($doc.Tables.Count -ne 5) {
      throw "Expected five deep-template tables and no cover table; got $($doc.Tables.Count)."
    }
    if ($doc.InlineShapes.Count -lt 1) {
      throw "Expected at least one inline project image."
    }
    if (!$text.Contains((U "Ny7nu5Porro="))) {
      throw "Rendered document does not contain the template conclusion section."
    }
    if (!$text.Contains((U "Mi7mnIDlgLzlvpflj4LogIM="))) {
      throw "Rendered document does not preserve the section 2 heading."
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
      throw "Rendered document should start directly with NO1; first paragraph was: $firstParagraph"
    }
  } finally {
    try { if ($doc) { $doc.Close($false) | Out-Null } } catch {}
    try { if ($word) { $word.Quit() | Out-Null } } catch {}
  }

  "PASS: deep report renderer produced Word and link outputs from sample JSON."
} finally {
  if (Test-Path -LiteralPath $tempDir) {
    Remove-Item -LiteralPath $tempDir -Recurse -Force
  }
}
