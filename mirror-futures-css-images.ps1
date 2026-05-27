# Follow-up mirror: grab the 34 background/icon images that main.css references.
# Run AFTER mirror-futures-delta-ten.ps1 has completed.
# Run from PowerShell: powershell -ExecutionPolicy Bypass -File .\mirror-futures-css-images.ps1

$ErrorActionPreference = "Stop"
$BaseUrl = "https://futures-delta-ten.vercel.app"
$OutDir  = Join-Path $PSScriptRoot "futures-mirror"

$Imgs = @(
  "assets/img/arrow-down.svg",
  "assets/img/bg-drop-down.png",
  "assets/img/bgaboutmain.svg",
  "assets/img/bgaboutmainimg.webp",
  "assets/img/bgbacking.svg",
  "assets/img/bgbeyond.svg",
  "assets/img/bgbeyondimg.webp",
  "assets/img/bgcomparison.webp",
  "assets/img/bgcta.webp",
  "assets/img/bgfaq.svg",
  "assets/img/bggetstarted.svg",
  "assets/img/bghero.svg",
  "assets/img/bghowitworks.svg",
  "assets/img/bginner.svg",
  "assets/img/bgnewsletter.webp",
  "assets/img/bgpayouts.svg",
  "assets/img/bgprograms.svg",
  "assets/img/bgreason.svg",
  "assets/img/bgreassurance.svg",
  "assets/img/bgswitching.svg",
  "assets/img/bgswitching.webp",
  "assets/img/bgtheplatform.svg",
  "assets/img/bgwhy.svg",
  "assets/img/external.svg",
  "assets/img/icon-arrow-right.svg",
  "assets/img/icon-check-blue.svg",
  "assets/img/icon-check.svg",
  "assets/img/icon-close.svg",
  "assets/img/icon-dropdown.svg",
  "assets/img/icon-enter.svg",
  "assets/img/icon-info.svg",
  "assets/img/icon-sec-box.svg",
  "assets/img/iconchecktransparent.svg",
  "assets/img/numbg-hover.png",
  "assets/img/numbg.png"
)

function Fetch-To {
  param([string]$RelPath)
  $Url  = "$BaseUrl/$RelPath"
  $Dest = Join-Path $OutDir $RelPath
  $DestDir = Split-Path $Dest -Parent
  if (!(Test-Path $DestDir)) { New-Item -ItemType Directory -Path $DestDir -Force | Out-Null }
  try {
    Invoke-WebRequest -Uri $Url -OutFile $Dest -UseBasicParsing -ErrorAction Stop
    $size = (Get-Item $Dest).Length
    Write-Host ("  OK  {0,8:N0} bytes  {1}" -f $size, $RelPath)
  } catch {
    Write-Host ("  FAIL  {0}  ({1})" -f $RelPath, $_.Exception.Message) -ForegroundColor Yellow
  }
}

Write-Host "Mirroring CSS-referenced images -> $OutDir" -ForegroundColor Cyan
Write-Host ""
$Imgs | ForEach-Object { Fetch-To $_ }
Write-Host ""
Write-Host "Done." -ForegroundColor Green
