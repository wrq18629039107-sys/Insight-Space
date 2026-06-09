param(
  [Parameter(Mandatory = $true)]
  [string]$InputJson,

  [string]$OutputDir = ""
)

$ErrorActionPreference = "Stop"
$ScriptDir = Split-Path -Parent $PSCommandPath

function SkillRoot {
  return Split-Path -Parent $script:ScriptDir
}

function U([string]$base64) {
  return [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($base64))
}

function ResolvePath([string]$root, [string]$path) {
  if ([string]::IsNullOrWhiteSpace($path)) {
    throw "Path is empty."
  }
  if ([System.IO.Path]::IsPathRooted($path)) {
    return $path
  }
  return Join-Path $root $path
}

function Required($object, [string]$name) {
  if ($null -eq $object.PSObject.Properties[$name]) {
    throw "Missing required field: $name"
  }
  $value = $object.$name
  if ($null -eq $value -or ([string]$value).Trim().Length -eq 0) {
    throw "Required field is empty: $name"
  }
  return $value
}

function RequiredArray($object, [string]$name, [int]$minCount) {
  if ($null -eq $object.PSObject.Properties[$name]) {
    throw "Missing required array field: $name"
  }
  $items = @($object.$name)
  if ($items.Count -lt $minCount) {
    throw "Field '$name' must contain at least $minCount item(s)."
  }
  return ,$items
}

function CleanText($text) {
  return (($text -replace "[`r`a]+", " ").Trim())
}

function SanitizeFilePart([string]$name) {
  $clean = $name -replace '[\\/:*?"<>|]', ''
  $clean = $clean -replace '\s+', ''
  if ($clean.Length -eq 0) {
    return "untitled"
  }
  return $clean
}

function SetCell($table, [int]$row, [string]$text) {
  $table.Cell($row, 2).Range.Text = $text
}

function ValidateProject($project) {
  [void](Required $project "no")
  [void](Required $project "title")
  [void](Required $project "project_type")
  [void](Required $project "designer")
  [void](Required $project "location_year")
  [void](Required $project "feature")
  [void](Required $project "value")
  [void](Required $project "warning")
  [void](Required $project "url")
  [void](Required $project "image_path")
}

function FillProjectBlock($doc, $block, $project, [string]$imagePath) {
  if (!(Test-Path -LiteralPath $imagePath)) {
    throw "Project image does not exist: $imagePath"
  }
  if ($block.InlineShapes.Count -lt 1) {
    throw "The shallow template block does not contain an image placeholder."
  }
  if ($block.Tables.Count -lt 1) {
    throw "The shallow template block does not contain a project table."
  }

  $shape = $block.InlineShapes[1]
  $titleRange = $doc.Range($block.Paragraphs.Item(1).Range.Start, $shape.Range.Start)
  $titleRange.Text = (Required $project "no") + ". " + (Required $project "title") + "`r"

  $shape = $block.InlineShapes[1]
  $oldWidth = $shape.Width
  $oldHeight = $shape.Height
  $shapeRange = $shape.Range
  $shape.Delete() | Out-Null
  $newShape = $shapeRange.InlineShapes.AddPicture($imagePath, $false, $true)
  $newShape.LockAspectRatio = -1
  $newShape.Width = $oldWidth
  if ($newShape.Height -gt $oldHeight) {
    $newShape.Height = $oldHeight
  }

  $table = $block.Tables.Item(1)
  SetCell $table 1 (Required $project "project_type")
  SetCell $table 2 (Required $project "designer")
  SetCell $table 3 (Required $project "location_year")
  SetCell $table 4 (Required $project "feature")
  SetCell $table 5 (Required $project "value")
  SetCell $table 6 (Required $project "warning")
  SetCell $table 7 (Required $project "url")
  try { $table.Rows.HeightRule = 0 } catch {}
}

$root = SkillRoot
$inputPath = ResolvePath $root $InputJson
if (!(Test-Path -LiteralPath $inputPath)) {
  throw "Input JSON does not exist: $inputPath"
}

$data = Get-Content -LiteralPath $inputPath -Raw -Encoding UTF8 | ConvertFrom-Json
$topic = Required $data "topic"
$userRequest = Required $data "user_request"
$projects = RequiredArray $data "projects" 1

foreach ($project in $projects) {
  ValidateProject $project
}

if ([string]::IsNullOrWhiteSpace($OutputDir)) {
  if ($null -ne $data.PSObject.Properties["output_dir"] -and ![string]::IsNullOrWhiteSpace($data.output_dir)) {
    $OutputDir = [string]$data.output_dir
  } else {
    $OutputDir = Join-Path $root "outputs"
  }
}
if (!(Test-Path -LiteralPath $OutputDir)) {
  New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
}

$templatePath = Join-Path $root "assets\templates\shallow_project_template.docx"
if (!(Test-Path -LiteralPath $templatePath)) {
  throw "Shallow template not found: $templatePath"
}

$safeTopic = SanitizeFilePart $topic
$docxPath = Join-Path $OutputDir ((U "5rWF5bqm5qih5byPXw==") + $safeTopic + ".docx")
$linkPath = Join-Path $OutputDir ((U "6ZO+5o6l") + ".txt")

$word = $null
$doc = $null

try {
  $word = New-Object -ComObject Word.Application
  $word.Visible = $false
  $word.DisplayAlerts = 0

  $doc = $word.Documents.Add()
  $doc.PageSetup.TopMargin = $word.CentimetersToPoints(1.5)
  $doc.PageSetup.BottomMargin = $word.CentimetersToPoints(1.5)
  $doc.PageSetup.LeftMargin = $word.CentimetersToPoints(1.5)
  $doc.PageSetup.RightMargin = $word.CentimetersToPoints(1.5)

  for ($projectIndex = 0; $projectIndex -lt $projects.Count; $projectIndex++) {
    $project = $projects[$projectIndex]
    if ($projectIndex -gt 0) {
      $breakRange = $doc.Range($doc.Content.End - 1, $doc.Content.End - 1)
      $breakRange.InsertBreak(7) | Out-Null
    }

    $insert = $doc.Range($doc.Content.End - 1, $doc.Content.End - 1)
    $start = $insert.Start
    $insert.InsertFile($templatePath)
    $after = $doc.Content.End
    $block = $doc.Range($start, $after)
    $imagePath = ResolvePath $root (Required $project "image_path")

    FillProjectBlock $doc $block $project $imagePath
  }

  if (Test-Path -LiteralPath $docxPath) {
    Remove-Item -LiteralPath $docxPath -Force
  }
  $doc.SaveAs2($docxPath, 16)
} finally {
  try { if ($doc) { $doc.Close($true) | Out-Null } } catch {}
  try { if ($word) { $word.Quit() | Out-Null } } catch {}
}

$utf8Bom = New-Object System.Text.UTF8Encoding($true)
$lines = New-Object System.Collections.Generic.List[string]
$lines.Add((U "55So5oi36Zeu6aKY77ya") + $userRequest)
$lines.Add((U "6L6T5Ye65qih5byP77ya6aG555uu5pCc57SiLea1heW6puaooeW8jw=="))
$lines.Add((U "6K+05piO77yaTk8g57yW5Y+35Y+q5piv5paH5qGj57yW5Y+377yM5LiN5Luj6KGo5Lu35YC85o6S5bqP44CC"))
$lines.Add((U "5q2j5paH5paH5Lu277ya") + [System.IO.Path]::GetFileName($docxPath))
$lines.Add("")
foreach ($project in $projects) {
  $lines.Add((Required $project "no") + ". " + (Required $project "title"))
  $lines.Add((U "6ZO+5o6l77ya") + (Required $project "url"))
  $lines.Add("")
}
[System.IO.File]::WriteAllLines($linkPath, $lines, $utf8Bom)

[pscustomobject]@{
  Word = $docxPath
  Links = $linkPath
  Projects = $projects.Count
}
