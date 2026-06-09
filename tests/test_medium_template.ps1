$ErrorActionPreference = "Stop"

function U([string]$base64) {
  return [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($base64))
}

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$template = Join-Path $root "assets\templates\medium_project_template.docx"

if (!(Test-Path -LiteralPath $template)) {
  throw "Missing medium template: $template"
}

$word = $null
$doc = $null
try {
  $word = New-Object -ComObject Word.Application
  $word.Visible = $false
  $word.DisplayAlerts = 0
  $doc = $word.Documents.Open($template, $false, $true, $false)

  $text = $doc.Content.Text
  if ($doc.Tables.Count -ne 3) {
    throw "Medium template should contain exactly 3 tables; got $($doc.Tables.Count)."
  }
  if ($doc.InlineShapes.Count -lt 1) {
    throw "Medium template should contain one project image placeholder."
  }

  foreach ($heading in @(
    (U "MS7moLjlv4PliKTmlq0="),
    (U "Mi7mnIDlgLzlvpflj4LogIM="),
    (U "My7lgJ/pibTmlrnlkJHlu7rorq4="),
    (U "NC7po47pmanmj5DphpI="),
    (U "NS7nu5Porro=")
  )) {
    if (!$text.Contains($heading)) {
      throw "Medium template is missing heading: $heading"
    }
  }

  foreach ($wrongHeading in @(
    (U "Ni7po47pmanmj5DphpI="),
    (U "Ny7nu5Porro=")
  )) {
    if ($text.Contains($wrongHeading)) {
      throw "Medium template still contains wrong heading: $wrongHeading"
    }
  }

  "PASS: medium template keeps 1/2/3/4/5 numbering after reduction."
} finally {
  try { if ($doc) { $doc.Close($false) | Out-Null } } catch {}
  try { if ($word) { $word.Quit() | Out-Null } } catch {}
}
