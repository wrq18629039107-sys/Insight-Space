$ErrorActionPreference = "Stop"
$utf8 = [System.Text.Encoding]::UTF8

function Decode([string]$base64) {
    return [Text.Encoding]::UTF8.GetString([Convert]::FromBase64String($base64))
}

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)

$blockedTerms = @(
    (Decode "5bCP57qi5Lmm"),
    (Decode "WGlhb2hvbmdzaHU="),
    (Decode "WEhT"),
    (Decode "UmVkTm90ZQ=="),
    (Decode "eGhz")
)

$blockedFileParts = @(
    ("process_" + (Decode "eGhz") + "_link_pool.ps1"),
    ((Decode "eGhz") + "_link_pool.txt"),
    ((Decode "eGhz") + "_card_data_example.json"),
    ("test_" + (Decode "eGhz") + "_link_pool_rules.ps1")
)

foreach ($part in $blockedFileParts) {
    $matches = Get-ChildItem -LiteralPath $root -Recurse -File | Where-Object { $_.Name -eq $part }
    if ($matches) {
        throw "Blocked source helper file still exists: $part"
    }
}

$files = Get-ChildItem -LiteralPath $root -Recurse -File |
    Where-Object {
        $_.FullName -notlike "*\.git\*" -and
        $_.Extension -in @(".md", ".txt", ".json", ".ps1", ".yaml", ".yml")
    }

foreach ($file in $files) {
    if ($file.FullName -eq $MyInvocation.MyCommand.Path) {
        continue
    }
    $text = [System.IO.File]::ReadAllText($file.FullName, $utf8)
    foreach ($term in $blockedTerms) {
        if ($text.Contains($term)) {
            throw "Blocked source term still appears in $($file.FullName)"
        }
    }
}

Write-Host "Removed blocked visual-source workflow and references."
