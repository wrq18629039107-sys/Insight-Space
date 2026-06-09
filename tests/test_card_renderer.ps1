$ErrorActionPreference = "Stop"

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$renderer = Join-Path $root "scripts\render_project_card.ps1"
if (!(Test-Path -LiteralPath $renderer)) {
  throw "Missing card renderer: $renderer"
}

Add-Type -AssemblyName System.Drawing

$tempDir = Join-Path ([System.IO.Path]::GetTempPath()) ("insight-space-card-test-" + [System.Guid]::NewGuid().ToString("N"))
New-Item -ItemType Directory -Force -Path $tempDir | Out-Null

try {
  $inputImage = Join-Path $tempDir "input.jpg"
  $outputImage = Join-Path $tempDir "card.png"

  $bmp = New-Object System.Drawing.Bitmap(800, 1200)
  $g = [System.Drawing.Graphics]::FromImage($bmp)
  try {
    $g.Clear([System.Drawing.Color]::LightSkyBlue)
    $brush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::Sienna)
    try {
      $g.FillRectangle($brush, 300, 260, 220, 520)
    } finally {
      $brush.Dispose()
    }
    $bmp.Save($inputImage, [System.Drawing.Imaging.ImageFormat]::Jpeg)
  } finally {
    $g.Dispose()
    $bmp.Dispose()
  }

  & $renderer `
    -ImagePath $inputImage `
    -OutputPath $outputImage `
    -Code "C01" `
    -Title "Test Project" `
    -TypeLabel "Park Node / Test" `
    -Point1 "Keeps the main subject visible." `
    -Point2 "Uses the fixed template only." `
    -Point3 "Moves full URLs to link text." `
    -Footer "Its value is a reusable public node strategy." `
    -SourceLabel "Source: Test"

  if (!(Test-Path -LiteralPath $outputImage)) {
    throw "Renderer did not create output image."
  }

  $card = [System.Drawing.Image]::FromFile($outputImage)
  try {
    if ($card.Width -ne 1600 -or $card.Height -ne 2200) {
      throw "Expected 1600x2200, got $($card.Width)x$($card.Height)."
    }
  } finally {
    $card.Dispose()
  }

  $bytes = (Get-Item -LiteralPath $outputImage).Length
  if ($bytes -lt 50000) {
    throw "Rendered card is unexpectedly small: $bytes bytes."
  }

  "PASS: card renderer produced a fixed 1600x2200 template card."
} finally {
  if (Test-Path -LiteralPath $tempDir) {
    Remove-Item -LiteralPath $tempDir -Recurse -Force
  }
}
