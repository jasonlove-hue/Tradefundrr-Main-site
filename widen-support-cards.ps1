# Widens the support cards so phone and email fit on one line each.

$path = "C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site\index.html"
$bak  = "$path.bak7"

if (-not (Test-Path $path)) { Write-Host "ERROR: index.html not found" -ForegroundColor Red; exit 1 }

Copy-Item $path $bak -Force
Write-Host "Backup saved: $bak"

$content = Get-Content $path -Raw

# 1) Clear any prior support-card CSS overrides
$content = $content -replace '(?s)<style>\s*/\* Make support cards wide enough[^<]*</style>', ''
$content = $content -replace '(?s)<style>\s*/\* Support cards: wide enough for contact info[^<]*</style>', ''
$content = $content -replace '(?s)<style>\s*/\* Make support card descriptions slightly smaller[^<]*</style>', ''

# 2) Remove <wbr> from email so it stays on one line
$content = $content -replace '<strong>support@<wbr>TradeFundrr\.com</strong>', '<strong>support@TradeFundrr.com</strong>'

# 3) Add white-space: nowrap to phone and email <strong> tags so they stay on one line
$content = $content -replace '<strong>\+1 \(877\) 799-8198</strong>', '<strong style="white-space: nowrap;">+1 (877) 799-8198</strong>'
$content = $content -replace '<strong>support@TradeFundrr\.com</strong>', '<strong style="white-space: nowrap;">support@TradeFundrr.com</strong>'

# 4) Inject CSS that widens the cards AND their parent container so they have room
$css = @'
<style>
  /* Widen support cards + parent container to fit contact info on one line */
  .real-support__inner > div:last-child,
  .real-support__inner > div:nth-child(2) { max-width: none !important; flex: 1 1 auto !important; }
  .real-support__cards { display: flex !important; flex-wrap: nowrap !important; gap: 18px !important; max-width: 100% !important; }
  .real-support__cards .card { width: 260px !important; min-width: 260px !important; max-width: 260px !important; flex: 0 0 260px !important; padding: 22px 20px !important; box-sizing: border-box !important; }
  .real-support__cards .card p { font-size: 13px !important; line-height: 1.5 !important; word-break: normal !important; overflow-wrap: normal !important; }
</style>
'@

if ($content -notmatch 'Widen support cards \+ parent container') {
  $content = $content -replace '</head>', "$css`n</head>"
  Write-Host "Inserted wider-cards CSS" -ForegroundColor Green
} else {
  Write-Host "Wider-cards CSS already present - skipping" -ForegroundColor Yellow
}

Set-Content $path $content -NoNewline
Write-Host ""
Write-Host "Done. Cards are now 260px wide with phone + email on single lines." -ForegroundColor Green
Write-Host "Restore backup if needed:" -ForegroundColor Yellow
Write-Host "  Copy-Item '$bak' '$path' -Force" -ForegroundColor Yellow
