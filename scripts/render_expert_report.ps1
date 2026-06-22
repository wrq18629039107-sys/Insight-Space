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

function OptionalValue($object, [string]$name, [string]$default) {
  if ($null -eq $object.PSObject.Properties[$name]) {
    return $default
  }
  $value = $object.$name
  if ($null -eq $value -or ([string]$value).Trim().Length -eq 0) {
    return $default
  }
  return $value
}

function RequiredCaseArray($data) {
  if ($null -ne $data.PSObject.Properties["cases"]) {
    $items = @($data.cases)
  } elseif ($null -ne $data.PSObject.Properties["items"]) {
    $items = @($data.items)
  } else {
    throw "Missing required array field: cases"
  }
  if ($items.Count -lt 1) {
    throw "Field 'cases' must contain at least 1 item."
  }
  return ,$items
}

function CleanText([string]$text) {
  return (($text -replace "[`r`a]+", "").Trim())
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
  $range = $table.Cell($row, $col).Range
  if ($range.End -gt $range.Start) {
    $range.End = $range.End - 1
  }
  $range.Text = $text
}

function ReplaceParagraphStartingWith($range, [string]$prefix, [string]$text) {
  foreach ($p in $range.Paragraphs) {
    if ((CleanText $p.Range.Text).StartsWith($prefix)) {
      $textRange = $p.Range.Duplicate
      if ($textRange.End -gt $textRange.Start) {
        $textRange.End = $textRange.End - 1
      }
      $textRange.Text = $text
      if ($prefix -eq "ID") {
        $p.Range.Font.Name = "微软雅黑"
        $p.Range.Font.NameFarEast = "微软雅黑"
        $p.Range.Font.NameAscii = "微软雅黑"
        $p.Range.Font.NameOther = "微软雅黑"
        $p.Range.Font.Size = 22
        $p.Range.Font.Bold = -1
        $p.Range.Font.Scaling = 100
        $p.Range.Font.Spacing = 0
        $p.Range.FitTextWidth = 0
        $p.Format.LineSpacingRule = 0
        $p.Format.SpaceAfter = 6
      }
      return
    }
  }
  throw "Cannot find paragraph starting with: $prefix"
}

function ReplaceParagraphContaining($range, [string]$needle, [string]$text) {
  foreach ($p in $range.Paragraphs) {
    if ((CleanText $p.Range.Text).Contains($needle)) {
      $textRange = $p.Range.Duplicate
      if ($textRange.End -gt $textRange.Start) {
        $textRange.End = $textRange.End - 1
      }
      $textRange.Text = $text
      return
    }
  }
  throw "Cannot find paragraph containing: $needle"
}

function ReplaceParagraphStartingWithAfterHeading($range, [string]$headingPrefix, [string]$targetPrefix, [string]$text) {
  $afterHeading = $false
  foreach ($p in $range.Paragraphs) {
    $clean = CleanText $p.Range.Text
    if (!$afterHeading) {
      if ($clean.StartsWith($headingPrefix)) {
        $afterHeading = $true
      }
      continue
    }
    if ($clean.StartsWith($targetPrefix)) {
      $textRange = $p.Range.Duplicate
      if ($textRange.End -gt $textRange.Start) {
        $textRange.End = $textRange.End - 1
      }
      $textRange.Text = $text
      return
    }
  }
  throw "Cannot find paragraph starting with '$targetPrefix' after heading: $headingPrefix"
}

function SetProjectImage($blockRange, [string]$imagePath) {
  if (!(Test-Path -LiteralPath $imagePath)) {
    throw "Project image does not exist: $imagePath"
  }
  if ($blockRange.InlineShapes.Count -lt 1) {
    throw "The expert template block does not contain an image placeholder."
  }

  $shape = $blockRange.InlineShapes.Item(1)
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

function ValidateCase($case) {
  foreach ($field in @(
    "no", "title", "topic_line", "core", "strategy", "project_type", "designer",
    "image_path", "url", "logic_conflict", "logic_action", "logic_value",
    "logic_condition", "relation_1", "relation_2", "relation_3", "presentation",
    "suitable", "suitable_focus", "risk", "control"
  )) {
    [void](Required $case $field)
  }
}

function FillExpertBlock($blockRange, $case, [string]$imagePath) {
  $tables = $blockRange.Tables
  if ($tables.Count -ne 3) {
    throw "Expert template block should contain exactly 3 tables; got $($tables.Count)."
  }

  ReplaceParagraphStartingWith $blockRange "ID" ((Required $case "no") + ". " + (Required $case "title"))
  ReplaceParagraphStartingWith $blockRange "专项命题" ("专项命题：" + (Required $case "topic_line"))
  SetCell $tables.Item(1) 1 1 (Required $case "core")
  SetCell $tables.Item(2) 1 2 (Required $case "strategy")
  SetCell $tables.Item(2) 2 2 (Required $case "project_type")
  SetCell $tables.Item(2) 3 2 (Required $case "designer")
  SetProjectImage $blockRange $imagePath

  SetCell $tables.Item(3) 1 2 (Required $case "logic_conflict")
  SetCell $tables.Item(3) 2 2 (Required $case "logic_action")
  SetCell $tables.Item(3) 3 2 (Required $case "logic_value")
  SetCell $tables.Item(3) 4 2 (Required $case "logic_condition")

  ReplaceParagraphContaining $blockRange "第一段：说明这个参考与本次专项对象的直接关系" (Required $case "relation_1")
  ReplaceParagraphContaining $blockRange "第二段：围绕用户指定重点展开" (Required $case "relation_2")
  ReplaceParagraphContaining $blockRange "第三段：围绕用户指定重点的可能相关联系点展开" (Required $case "relation_3")
  ReplaceParagraphStartingWith $blockRange "汇报时可以说" ("汇报时可以说：" + (Required $case "presentation"))

  $lineBreak = [string][char]11
  ReplaceParagraphStartingWithAfterHeading $blockRange "4. 适用场景判断" "适合" ("适合：" + (Required $case "suitable") + $lineBreak + "判断重点：" + (Required $case "suitable_focus"))
  ReplaceParagraphStartingWithAfterHeading $blockRange "5. 照搬风险底线" "风险底线" ("风险底线：" + (Required $case "risk") + $lineBreak + "落地控制：" + (Required $case "control"))

  $imageNote = OptionalValue $case "image_note" ""
  $imageNote = OptionalValue $case "source_note" $imageNote
  if ([string]::IsNullOrWhiteSpace($imageNote)) {
    $imageNote = "项目图片用于快速判断本案例与专项重点的关系；建议打开原网址查看完整项目图集和来源信息。"
  }
  ReplaceParagraphStartingWithAfterHeading $blockRange "6. 原网址 / 延伸查看" "原网址" ("原网址：" + (Required $case "url"))
  ReplaceParagraphStartingWithAfterHeading $blockRange "6. 原网址 / 延伸查看" "图片说明" ("图片说明：" + $imageNote)
}

$root = SkillRoot
$inputPath = ResolvePath $root $InputJson
if (!(Test-Path -LiteralPath $inputPath)) {
  throw "Input JSON does not exist: $inputPath"
}

$data = Get-Content -LiteralPath $inputPath -Raw -Encoding UTF8 | ConvertFrom-Json
$topic = Required $data "topic"
$userRequest = Required $data "user_request"
$cases = RequiredCaseArray $data

foreach ($case in $cases) {
  ValidateCase $case
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

$templatePath = Join-Path $root "assets\templates\expert_mode_template.docx"
if (!(Test-Path -LiteralPath $templatePath)) {
  throw "Expert template not found: $templatePath"
}

$safeTopic = SanitizeFilePart $topic
$docxPath = Join-Path $OutputDir ((U "5LiT6aG55qih5byPXw==") + $safeTopic + ".docx")
$linkPath = Join-Path $OutputDir ((U "6ZO+5o6l") + ".txt")

$word = $null
$doc = $null

try {
  $word = New-Object -ComObject Word.Application
  $word.Visible = $false
  $word.DisplayAlerts = 0

  if (Test-Path -LiteralPath $docxPath) {
    Remove-Item -LiteralPath $docxPath -Force
  }
  Copy-Item -LiteralPath $templatePath -Destination $docxPath -Force
  $doc = $word.Documents.Open($docxPath)

  for ($caseIndex = 0; $caseIndex -lt $cases.Count; $caseIndex++) {
    $case = $cases[$caseIndex]
    if ($caseIndex -eq 0) {
      $block = $doc.Content
    } else {
      $end = $doc.Content
      $end.Collapse(0)
      $end.InsertBreak(7)
      $insert = $doc.Range($doc.Content.End - 1, $doc.Content.End - 1)
      $start = $insert.Start
      $insert.InsertFile($templatePath)
      $block = $doc.Range($start, $doc.Content.End)
    }

    $imagePath = ResolvePath $root (Required $case "image_path")
    FillExpertBlock $block $case $imagePath
  }

  $doc.Save()
} finally {
  try { if ($doc) { $doc.Close($true) | Out-Null } } catch {}
  try { if ($word) { $word.Quit() | Out-Null } } catch {}
}

$utf8Bom = New-Object System.Text.UTF8Encoding($true)
$lines = New-Object System.Collections.Generic.List[string]
$lines.Add("用户问题：" + $userRequest)
$lines.Add("输出模式：项目搜索-专项模式")
$lines.Add("说明：本文件由专项模式 Word 渲染器根据结构化数据生成；链接用于追溯来源，NO 编号只代表文档顺序。")
$lines.Add("正文文件：" + [System.IO.Path]::GetFileName($docxPath))
$lines.Add("")
foreach ($case in $cases) {
  $lines.Add((Required $case "no") + ". " + (Required $case "title"))
  $lines.Add("链接：" + (Required $case "url"))
  $lines.Add("")
}
[System.IO.File]::WriteAllLines($linkPath, $lines, $utf8Bom)

[pscustomobject]@{
  Word = $docxPath
  Links = $linkPath
  Cases = $cases.Count
}
