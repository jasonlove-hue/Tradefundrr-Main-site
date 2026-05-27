# Mirror futures-delta-ten.vercel.app -> main-site/futures-mirror/
# Run from PowerShell: powershell -ExecutionPolicy Bypass -File .\mirror-futures-delta-ten.ps1
# Produced 2026-05-27 for the futures-page port into main-site/pages/.

$ErrorActionPreference = "Stop"
$BaseUrl  = "https://futures-delta-ten.vercel.app"
$OutDir   = Join-Path $PSScriptRoot "futures-mirror"

# 4 HTML pages, 1 CSS bundle, 1 JS bundle, all referenced images.
$Pages = @("index.html","about.html","switch.html","opt-in.html")
$Css   = @("styles/css/main.css")
$Js    = @("assets/js/scripts.js")
$Imgs  = @(
  "assets/img/favicon.ico",
  "assets/img/logo.svg",
  "assets/img/logo-small.svg",
  "assets/img/flogo.svg",
  "assets/img/dropdown1.png",
  "assets/img/dropdown3.png",
  "assets/img/hero-img.webp",
  "assets/img/reass-1.svg",
  "assets/img/reass-2.svg",
  "assets/img/reass-3.svg",
  "assets/img/reass-4.svg",
  "assets/img/reass-5.svg",
  "assets/img/why1.svg",
  "assets/img/why2.svg",
  "assets/img/why3.svg",
  "assets/img/why4.svg",
  "assets/img/why5.svg",
  "assets/img/graph.png",
  "assets/img/graph2.png",
  "assets/img/platform.png",
  "assets/img/reviews.png",
  "assets/img/trustpilot.svg",
  "assets/img/backinglogo.svg",
  "assets/img/payouts-icon-1.svg",
  "assets/img/payouts-icon-2.svg",
  "assets/img/payouts-icon-3.svg",
  "assets/img/payouts-icon-4.svg",
  "assets/img/x.svg",
  "assets/img/in.svg",
  "assets/img/youtube.svg",
  "assets/img/fb.svg"
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
    return $true
  } catch {
    Write-Host ("  FAIL  {0}  ({1})" -f $RelPath, $_.Exception.Message) -ForegroundColor Yellow
    return $false
  }
}

if (!(Test-Path $OutDir)) { New-Item -ItemType Directory -Path $OutDir -Force | Out-Null }

Write-Host "Mirroring $BaseUrl -> $OutDir" -ForegroundColor Cyan
Write-Host ""
Write-Host "HTML pages:" -ForegroundColor Cyan
$Pages | ForEach-Object { Fetch-To $_ | Out-Null }

Write-Host ""
Write-Host "CSS:" -ForegroundColor Cyan
$Css   | ForEach-Object { Fetch-To $_ | Out-Null }

Write-Host ""
Write-Host "JS:" -ForegroundColor Cyan
$Js    | ForEach-Object { Fetch-To $_ | Out-Null }

Write-Host ""
Write-Host "Images:" -ForegroundColor Cyan
$Imgs  | ForEach-Object { Fetch-To $_ | Out-Null }

Write-Host ""
Write-Host "Done. Files in: $OutDir" -ForegroundColor Green
