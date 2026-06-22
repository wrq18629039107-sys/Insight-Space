$ErrorActionPreference = "Stop"

function U([string]$base64) {
  return [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($base64))
}

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$renderer = Join-Path $root "scripts\render_expert_report.ps1"

if (!(Test-Path -LiteralPath $renderer)) {
  throw "Missing expert report renderer: $renderer"
}

Add-Type -AssemblyName System.Drawing

$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) ("insight-space-expert-test-" + [System.Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

try {
  $image1 = Join-Path $tempDir "case1.jpg"
  $image2 = Join-Path $tempDir "case2.jpg"
  foreach ($pair in @(@($image1, [System.Drawing.Color]::Gold), @($image2, [System.Drawing.Color]::SteelBlue))) {
    $bmp = New-Object System.Drawing.Bitmap(1200, 800)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    try {
      $g.Clear([System.Drawing.Color]::WhiteSmoke)
      $brush = New-Object System.Drawing.SolidBrush($pair[1])
      try {
        $g.FillEllipse($brush, 280, 120, 620, 520)
      } finally {
        $brush.Dispose()
      }
      $bmp.Save($pair[0], [System.Drawing.Imaging.ImageFormat]::Jpeg)
    } finally {
      $g.Dispose()
      $bmp.Dispose()
    }
  }

  $inputPath = Join-Path $tempDir "expert-input.json"
  $input = @{
    topic = "commercial-entrance-sculpture-test"
    user_request = "专项模式，商业入口空间雕塑。"
    output_dir = $tempDir
    cases = @(
      @{
        no = "NO1"
        title = "Sample Gateway Sculpture"
        topic_line = "商业入口空间雕塑 / 门户识别、入口打卡"
        core = "这个样例用于验证专项模式 Word 渲染器，重点是把雕塑和入口关系装进固定模板。"
        strategy = "门户地标型 / 雕塑即入口"
        project_type = "商业入口 / 公共艺术"
        designer = "Insight-Space Test"
        image_path = $image1
        url = "https://example.com/gateway-sculpture"
        image_note = "图片说明测试：直接使用样例图片。"
        logic_conflict = "商业入口需要记忆点，但雕塑容易变成孤立摆件。"
        logic_action = "用可穿越体量把雕塑转成入口门洞。"
        logic_value = "适合验证选用逻辑表的参考价值字段。"
        logic_condition = "适合有入口前场和通行宽度的项目。"
        relation_1 = "它和本次专项对象的关系在于雕塑直接承担入口识别。"
        relation_2 = "如果重点看打卡和导入，它能说明雕塑如何组织人流。"
        relation_3 = "转译时可以降低体量，用轻型构件保留入口门洞关系。"
        presentation = "这个参考说明入口雕塑可以成为可进入、可识别的门户。"
        suitable = "适合商业街主入口、综合体前场。"
        suitable_focus = "重点看雕塑、人流和入口界面的关系。"
        risk = "大体量雕塑可能影响通行和维护。"
        control = "需要控制通行净宽、基础、灯光和表面安全。"
      },
      @{
        no = "NO2"
        title = "Sample Art Doorway"
        topic_line = "商业入口空间雕塑 / 门头雕塑化、材料记忆"
        core = "这个样例用于验证多案例分页和第二张图片嵌入。"
        strategy = "雕塑化门洞型 / 入口表皮即装置"
        project_type = "商场入口 / 展陈界面"
        designer = "Insight-Space Test"
        image_path = $image2
        url = "https://example.com/art-doorway"
        logic_conflict = "室内商业入口常被普通招牌削弱。"
        logic_action = "把材料表皮和洞口包裹成可穿越装置。"
        logic_value = "适合验证第二个案例块仍然保持模板。"
        logic_condition = "适合商场内街、展厅入口和品牌店。"
        relation_1 = "它把雕塑从独立摆件转成入口界面。"
        relation_2 = "如果场地没有大广场，门头雕塑化更容易落地。"
        relation_3 = "转译时重点保留入口厚度、材料肌理和人视角画面。"
        presentation = "这个参考说明入口记忆点也可以来自门洞和表皮。"
        suitable = "适合商场店铺入口、展厅入口。"
        suitable_focus = "重点看材料、洞口和拍照视角。"
        risk = "复杂材料容易增加造价和维护。"
        control = "需要提前做样板并控制消防、检修和眩光。"
      }
    )
  }
  $input | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $inputPath -Encoding UTF8

  & $renderer -InputJson $inputPath -OutputDir $tempDir | Out-Null

  $docx = Join-Path $tempDir ((U "5LiT6aG55qih5byPXw==") + "commercial-entrance-sculpture-test.docx")
  $links = Join-Path $tempDir ((U "6ZO+5o6l") + ".txt")

  if (!(Test-Path -LiteralPath $docx)) {
    throw "Expected expert Word output was not created: $docx"
  }
  if (!(Test-Path -LiteralPath $links)) {
    throw "Expected link output was not created: $links"
  }

  $linkText = Get-Content -LiteralPath $links -Raw -Encoding UTF8
  if (!$linkText.Contains("https://example.com/gateway-sculpture") -or !$linkText.Contains("https://example.com/art-doorway")) {
    throw "Link output does not contain all sample source URLs."
  }

  $word = $null
  $doc = $null
  try {
    $word = New-Object -ComObject Word.Application
    $word.Visible = $false
    $word.DisplayAlerts = 0
    $doc = $word.Documents.Open($docx, $false, $true, $false)

    $text = $doc.Content.Text
    if (!$text.Contains("NO1. Sample Gateway Sculpture") -or !$text.Contains("NO2. Sample Art Doorway")) {
      throw "Rendered document does not contain both expert case titles."
    }
    if ($text.Contains("【说明适用场景") -or $text.Contains("【说明使用这个参考时最应该抓住的前提或取舍】")) {
      throw "Expert section 4 still contains placeholder text."
    }
    $firstLogicValue = $doc.Tables.Item(3).Cell(3, 2).Range.Text
    if (!$firstLogicValue.Contains("适合验证选用逻辑表的参考价值字段。") -or $firstLogicValue.Contains("判断重点：")) {
      throw "Expert section 4 replacement overwrote the selection-logic reference-value cell."
    }
    if (!$text.Contains("适合：适合商业街主入口、综合体前场。") -or !$text.Contains("判断重点：重点看雕塑、人流和入口界面的关系。")) {
      throw "Expert section 4 was not filled with the case applicability judgment."
    }
    if (!$text.Contains("6. 原网址 / 延伸查看") -or !$text.Contains("原网址：https://example.com/gateway-sculpture") -or !$text.Contains("原网址：https://example.com/art-doorway")) {
      throw "Expert section 6 did not include source URLs inside the Word report."
    }
    if (!$text.Contains("图片说明测试：直接使用样例图片。") -or !$text.Contains("建议打开原网址查看完整项目图集和来源信息。")) {
      throw "Expert section 6 did not include explicit/default image notes."
    }
    if ($doc.Tables.Count -ne 6) {
      throw "Expected six expert-template tables for two cases; got $($doc.Tables.Count)."
    }
    if ($doc.InlineShapes.Count -ne 2) {
      throw "Expected exactly two inline project images; got $($doc.InlineShapes.Count)."
    }
    if ($doc.ComputeStatistics(2) -lt 2) {
      throw "Expected a multi-page document for two expert cases."
    }
  } finally {
    try { if ($doc) { $doc.Close($false) | Out-Null } } catch {}
    try { if ($word) { $word.Quit() | Out-Null } } catch {}
  }

  "PASS: expert report renderer produced fixed-template Word and link outputs from sample JSON."
} finally {
  if (Test-Path -LiteralPath $tempDir) {
    Remove-Item -LiteralPath $tempDir -Recurse -Force
  }
}
