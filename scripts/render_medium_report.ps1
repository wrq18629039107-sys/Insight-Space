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

function SetCell($table, [int]$row, [int]$col, [string]$text) {
  $table.Cell($row, $col).Range.Text = $text
}

function NonEmptyParagraphs($range) {
  $list = @()
  foreach ($p in $range.Paragraphs) {
    $text = CleanText $p.Range.Text
    if ($text.Length -gt 0) {
      $list += $p
    }
  }
  return ,$list
}

function ReplaceParagraph($paragraph, [string]$text) {
  $paragraph.Range.Text = $text + "`r"
}

function ReplaceBetweenRanges($doc, [int]$start, [int]$end, [string[]]$paragraphs) {
  if ($end -le $start) {
    throw "Invalid replace range."
  }
  $range = $doc.Range($start, $end)
  $range.Text = ($paragraphs -join "`r") + "`r"
}

function FindParagraphStartingWith($paragraphs, [string]$prefix) {
  for ($i = 0; $i -lt $paragraphs.Count; $i++) {
    $text = CleanText $paragraphs[$i].Range.Text
    if ($text.StartsWith($prefix)) {
      return $paragraphs[$i]
    }
  }
  return $null
}

function SetProjectImage($blockRange, [string]$imagePath) {
  if (!(Test-Path -LiteralPath $imagePath)) {
    throw "Project image does not exist: $imagePath"
  }
  if ($blockRange.InlineShapes.Count -lt 1) {
    throw "The medium template block does not contain an image placeholder."
  }

  $shape = $blockRange.InlineShapes[1]
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
}

function ValidateProject($project) {
  [void](Required $project "no")
  [void](Required $project "title")
  [void](Required $project "search_line")
  [void](Required $project "project_type")
  [void](Required $project "designer")
  [void](Required $project "location_year")
  [void](Required $project "url")
  [void](Required $project "image_path")
  [void](RequiredArray $project "core_judgment" 3)
  [void](RequiredArray $project "reference_points" 3)
  [void](RequiredArray $project "direction_suggestions" 4)
  [void](RequiredArray $project "risks" 2)
  [void](RequiredArray $project "conclusion" 3)
}

function FillRows3($table, $rows, [int]$count, [string]$fieldName) {
  for ($i = 0; $i -lt $count; $i++) {
    $row = @($rows[$i])
    if ($row.Count -lt 3) {
      throw "$fieldName[$i] must contain 3 values."
    }
    SetCell $table ($i + 2) 1 ([string]$row[0])
    SetCell $table ($i + 2) 2 ([string]$row[1])
    SetCell $table ($i + 2) 3 ([string]$row[2])
  }
}

function FillProjectBlock($doc, $block, $project, [string]$imagePath) {
  $tables = $block.Tables
  if ($tables.Count -lt 3) {
    throw "Medium template block should contain 3 tables; got $($tables.Count)."
  }

  $nonEmpty = NonEmptyParagraphs $block
  if ($nonEmpty.Count -lt 2) {
    throw "Medium template block does not contain title/search paragraphs."
  }

  ReplaceParagraph $nonEmpty[0] ((Required $project "no") + ". " + (Required $project "title"))
  ReplaceParagraph $nonEmpty[1] (Required $project "search_line")
  SetProjectImage $block $imagePath

  SetCell $tables.Item(1) 1 2 (Required $project "project_type")
  SetCell $tables.Item(1) 2 2 (Required $project "designer")
  SetCell $tables.Item(1) 3 2 (Required $project "location_year")
  SetCell $tables.Item(1) 4 2 (Required $project "url")

  $afterInfo = $doc.Range($tables.Item(1).Range.End, $tables.Item(2).Range.Start)
  $coreParas = NonEmptyParagraphs $afterInfo
  if ($coreParas.Count -lt 1) {
    throw "Cannot find core judgment heading between table 1 and table 2."
  }
  $nextSection = FindParagraphStartingWith $coreParas "2."
  if ($null -eq $nextSection) {
    throw "Cannot find section 2 heading between core judgment and reference table."
  }
  ReplaceBetweenRanges $doc $coreParas[0].Range.End $nextSection.Range.Start ([string[]](RequiredArray $project "core_judgment" 3))

  FillRows3 $tables.Item(2) (RequiredArray $project "reference_points" 3) 3 "reference_points"
  FillRows3 $tables.Item(3) (RequiredArray $project "direction_suggestions" 4) 4 "direction_suggestions"

  $afterDirection = $doc.Range($tables.Item(3).Range.End, $block.End)
  $tailParas = NonEmptyParagraphs $afterDirection
  if ($tailParas.Count -lt 2) {
    throw "Cannot find risk and conclusion sections after table 3."
  }

  $riskHeading = FindParagraphStartingWith $tailParas "4."
  $conclusionHeading = FindParagraphStartingWith $tailParas "5."
  if ($null -eq $riskHeading -or $null -eq $conclusionHeading) {
    throw "Cannot find medium risk or conclusion headings."
  }

  $risks = RequiredArray $project "risks" 2
  $riskText = @($risks | ForEach-Object { [char]0x2022 + " " + [string]$_ })
  ReplaceBetweenRanges $doc $riskHeading.Range.End $conclusionHeading.Range.Start ([string[]]$riskText)
  ReplaceBetweenRanges $doc $conclusionHeading.Range.End $block.End ([string[]](RequiredArray $project "conclusion" 3))
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

$templatePath = Join-Path $root "assets\templates\medium_project_template.docx"
if (!(Test-Path -LiteralPath $templatePath)) {
  throw "Medium template not found: $templatePath"
}

$safeTopic = SanitizeFilePart $topic
$docxPath = Join-Path $OutputDir ((U "5Lit5bqm5qih5byPXw==") + $safeTopic + ".docx")
$linkPath = Join-Path $OutputDir ((U "6ZO+5o6l") + ".txt")

$word = $null
$doc = $null

try {
  $word = New-Object -ComObject Word.Application
  $word.Visible = $false
  $word.DisplayAlerts = 0

  $doc = $word.Documents.Add()
  $doc.PageSetup.TopMargin = $word.CentimetersToPoints(1.8)
  $doc.PageSetup.BottomMargin = $word.CentimetersToPoints(1.8)
  $doc.PageSetup.LeftMargin = $word.CentimetersToPoints(1.8)
  $doc.PageSetup.RightMargin = $word.CentimetersToPoints(1.8)

  for ($projectIndex = 0; $projectIndex -lt $projects.Count; $projectIndex++) {
    $project = $projects[$projectIndex]
    $insert = $doc.Range($doc.Content.End - 1, $doc.Content.End - 1)
    $start = $insert.Start
    $insert.InsertFile($templatePath)
    $after = $doc.Content.End
    $block = $doc.Range($start, $after)
    $imagePath = ResolvePath $root (Required $project "image_path")

    FillProjectBlock $doc $block $project $imagePath

    if ($projectIndex -lt ($projects.Count - 1)) {
      $end = $doc.Content
      $end.Collapse(0)
      $end.InsertBreak(7)
    }
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
$lines.Add((U "6L6T5Ye65qih5byP77ya6aG555uu5pCc57SiLeS4reW6puaooeW8jw=="))
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
