param(
  [Parameter(Mandatory = $true)]
  [string]$ImagePath,

  [Parameter(Mandatory = $true)]
  [string]$OutputPath,

  [string]$Code = "C01",
  [Parameter(Mandatory = $true)]
  [string]$Title,
  [Parameter(Mandatory = $true)]
  [string]$TypeLabel,
  [Parameter(Mandatory = $true)]
  [string]$Point1,
  [string]$Point2 = "",
  [string]$Point3 = "",
  [Parameter(Mandatory = $true)]
  [string]$Footer,
  [Parameter(Mandatory = $true)]
  [string]$SourceLabel,

  [double]$FocusX = 0.5,
  [double]$FocusY = 0.5
)

$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Drawing

function Clamp([double]$value, [double]$min, [double]$max) {
  if ($value -lt $min) { return $min }
  if ($value -gt $max) { return $max }
  return $value
}

function New-Rect([int]$x, [int]$y, [int]$w, [int]$h) {
  return New-Object System.Drawing.Rectangle($x, $y, $w, $h)
}

function Get-CropRect([System.Drawing.Image]$image, [int]$targetW, [int]$targetH, [double]$focusX, [double]$focusY) {
  $targetRatio = $targetW / $targetH
  $sourceRatio = $image.Width / $image.Height

  if ($sourceRatio -gt $targetRatio) {
    $cropH = $image.Height
    $cropW = [int][Math]::Round($cropH * $targetRatio)
  } else {
    $cropW = $image.Width
    $cropH = [int][Math]::Round($cropW / $targetRatio)
  }

  $focusX = Clamp $focusX 0 1
  $focusY = Clamp $focusY 0 1
  $x = [int][Math]::Round(($image.Width - $cropW) * $focusX)
  $y = [int][Math]::Round(($image.Height - $cropH) * $focusY)
  $x = [int](Clamp $x 0 ($image.Width - $cropW))
  $y = [int](Clamp $y 0 ($image.Height - $cropH))

  return New-Rect $x $y $cropW $cropH
}

function New-RoundRectPath([System.Drawing.Rectangle]$rect, [int]$radius) {
  $path = New-Object System.Drawing.Drawing2D.GraphicsPath
  $d = $radius * 2
  $path.AddArc($rect.X, $rect.Y, $d, $d, 180, 90)
  $path.AddArc($rect.Right - $d, $rect.Y, $d, $d, 270, 90)
  $path.AddArc($rect.Right - $d, $rect.Bottom - $d, $d, $d, 0, 90)
  $path.AddArc($rect.X, $rect.Bottom - $d, $d, $d, 90, 90)
  $path.CloseFigure()
  return $path
}

function Measure-Lines([System.Drawing.Graphics]$graphics, [string]$text, [System.Drawing.Font]$font, [int]$maxWidth) {
  $lines = New-Object System.Collections.Generic.List[string]
  $current = ""
  foreach ($ch in $text.ToCharArray()) {
    $try = $current + $ch
    if ($graphics.MeasureString($try, $font).Width -gt $maxWidth -and $current.Length -gt 0) {
      $lines.Add($current)
      $current = [string]$ch
    } else {
      $current = $try
    }
  }
  if ($current.Length -gt 0) {
    $lines.Add($current)
  }
  return $lines
}

function Draw-WrappedText(
  [System.Drawing.Graphics]$graphics,
  [string]$text,
  [System.Drawing.Font]$font,
  [System.Drawing.Brush]$brush,
  [int]$x,
  [int]$y,
  [int]$maxWidth,
  [int]$lineHeight
) {
  $yy = $y
  foreach ($line in (Measure-Lines $graphics $text $font $maxWidth)) {
    $graphics.DrawString($line, $font, $brush, $x, $yy)
    $yy += $lineHeight
  }
  return $yy
}

if (!(Test-Path -LiteralPath $ImagePath)) {
  throw "ImagePath does not exist: $ImagePath"
}

$outputDir = Split-Path -Parent $OutputPath
if ($outputDir -and !(Test-Path -LiteralPath $outputDir)) {
  New-Item -ItemType Directory -Force -Path $outputDir | Out-Null
}

$canvas = New-Object System.Drawing.Bitmap(1600, 2200)
$graphics = [System.Drawing.Graphics]::FromImage($canvas)
$source = [System.Drawing.Image]::FromFile($ImagePath)

try {
  $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::AntiAlias
  $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
  $graphics.TextRenderingHint = [System.Drawing.Text.TextRenderingHint]::AntiAliasGridFit

  $bg = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#F6F3EF"))
  $ink = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#20282B"))
  $muted = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#60686B"))
  $lineBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#D8D0C5"))
  $tagBg = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#EEE7DA"))
  $badgeBg = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#353B3F"))
  $white = [System.Drawing.Brushes]::White
  $bulletBrush = New-Object System.Drawing.SolidBrush([System.Drawing.ColorTranslator]::FromHtml("#9C462F"))

  $graphics.FillRectangle($bg, 0, 0, 1600, 2200)

  $borderPen = New-Object System.Drawing.Pen([System.Drawing.ColorTranslator]::FromHtml("#D8D0C5"), 2)
  $graphics.DrawRectangle($borderPen, 57, 57, 1485, 2085)

  $frameRect = New-Rect 84 84 1448 1062
  $photoRect = New-Rect 96 96 1424 1038
  $graphics.FillRectangle($white, $frameRect)
  $crop = Get-CropRect $source $photoRect.Width $photoRect.Height $FocusX $FocusY
  $graphics.DrawImage($source, $photoRect, $crop, [System.Drawing.GraphicsUnit]::Pixel)

  $badgeRect = New-Rect 112 112 188 70
  $badgePath = New-RoundRectPath $badgeRect 7
  try {
    $graphics.FillPath($badgeBg, $badgePath)
  } finally {
    $badgePath.Dispose()
  }

  $fontBadge = New-Object System.Drawing.Font("Microsoft YaHei UI", 42, [System.Drawing.FontStyle]::Regular)
  $fontTitle = New-Object System.Drawing.Font("Microsoft YaHei UI", 62, [System.Drawing.FontStyle]::Bold)
  $fontTag = New-Object System.Drawing.Font("Microsoft YaHei UI", 35, [System.Drawing.FontStyle]::Regular)
  $fontBody = New-Object System.Drawing.Font("Microsoft YaHei UI", 39, [System.Drawing.FontStyle]::Regular)
  $fontFooter = New-Object System.Drawing.Font("Microsoft YaHei UI", 33, [System.Drawing.FontStyle]::Regular)
  $fontSource = New-Object System.Drawing.Font("Microsoft YaHei UI", 31, [System.Drawing.FontStyle]::Regular)

  $badgeFormat = New-Object System.Drawing.StringFormat
  $badgeFormat.Alignment = [System.Drawing.StringAlignment]::Center
  $badgeFormat.LineAlignment = [System.Drawing.StringAlignment]::Center
  $badgeRectF = New-Object System.Drawing.RectangleF(
    [single]$badgeRect.X,
    [single]$badgeRect.Y,
    [single]$badgeRect.Width,
    [single]$badgeRect.Height
  )
  $graphics.DrawString($Code, $fontBadge, $white, $badgeRectF, $badgeFormat)

  $titleY = 1168
  $titleY = Draw-WrappedText $graphics $Title $fontTitle $ink 104 $titleY 1380 76

  $typeHeight = 58
  $typeWidth = [int][Math]::Min(980, [Math]::Max(360, $graphics.MeasureString($TypeLabel, $fontTag).Width + 44))
  $typeRect = New-Rect 104 ($titleY + 18) $typeWidth $typeHeight
  $typePath = New-RoundRectPath $typeRect 6
  try {
    $graphics.FillPath($tagBg, $typePath)
  } finally {
    $typePath.Dispose()
  }
  $graphics.DrawString($TypeLabel, $fontTag, $muted, 122, ($typeRect.Y + 7))

  $dividerY = $typeRect.Bottom + 42
  $dividerPen = New-Object System.Drawing.Pen([System.Drawing.ColorTranslator]::FromHtml("#D8D0C5"), 3)
  $graphics.DrawLine($dividerPen, 90, $dividerY, 1518, $dividerY)

  $points = @($Point1, $Point2, $Point3) | Where-Object { $_ -and $_.Trim().Length -gt 0 } | Select-Object -First 3
  $bulletY = $dividerY + 70
  foreach ($point in $points) {
    $graphics.FillEllipse($bulletBrush, 104, ($bulletY + 17), 16, 16)
    $nextY = Draw-WrappedText $graphics $point $fontBody $ink 148 $bulletY 1300 58
    $bulletY = $nextY + 38
  }

  $footerY = 2040
  [void](Draw-WrappedText $graphics $Footer $fontFooter $ink 100 $footerY 1360 48)
  $graphics.DrawString($SourceLabel, $fontSource, $muted, 100, 2090)

  $canvas.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Png)
} finally {
  if ($source) { $source.Dispose() }
  if ($graphics) { $graphics.Dispose() }
  if ($canvas) { $canvas.Dispose() }

  foreach ($obj in @(
    $bg, $ink, $muted, $lineBrush, $tagBg, $badgeBg, $bulletBrush,
    $borderPen, $dividerPen,
    $fontBadge, $fontTitle, $fontTag, $fontBody, $fontFooter, $fontSource,
    $badgeFormat
  )) {
    if ($obj -and $obj -is [System.IDisposable]) {
      $obj.Dispose()
    }
  }
}
