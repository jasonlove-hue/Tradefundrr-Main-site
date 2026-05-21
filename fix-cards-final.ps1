# Reverts the card width back to original; uses smarter line-break for email.

$path = "C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site\index.html"
$bak  = "$path.bak6"

if (-not (Test-Path $path)) { Write-Host "ERROR: index.html not found" -ForegroundColor Red; exit 1 }

Copy-Item $path $bak -Force
Write-Host "Backup saved: $bak"

$content = Get-Content $path -Raw

# 1) Remove the wider-card CSS blocks - revert layout to original
$content = $content -replace '(?s)<style>\s*/\* Make support cards wide enough[^<]*</style>', ''
$content = $content -replace '(?s)<style>\s*/\* Support cards: wide enough for contact info[^<]*</style>', ''

# 2) Remove white-space: nowrap from phone/email so they can break naturally
$content = $content -replace '<strong style="white-space: nowrap;">\+1 \(877\) 799-8198</strong>', '<strong>+1 (877) 799-8198</strong>'
$content = $content -replace '<strong style="white-space: nowrap;">support@TradeFundrr\.com</strong>', '<strong>support@<wbr>TradeFundrr.com</strong>'

# 3) Add small CSS to make the description font slightly smaller so contact info fits in 180px cards
$smallerCSS = @'
<style>
  /* Make support card descriptions slightly smaller so phone/email fit cleanly */
  .real-support__cards .card p { font-size: 12.5px !important; line-height: 1.4 !important; word-break: keep-all !important; overflow-wrap: break-word !important; }
  .real-support__cards .card p strong { font-size: 13px !important; }
</style>
'@

if ($content -notmatch 'Make support card descriptions slightly smaller') {
  $content = $content -replace '</head>', "$smallerCSS`n</head>"
  Write-Host "Added smaller-font CSS for support cards" -ForegroundColor Green
} else {
  Write-Host "Font CSS already present - skipping" -ForegroundColor Yellow
}

Set-Content $path $content -NoNewline
Write-Host ""
Write-Host "Done. Layout is back to original side-by-side cards, with smaller font so contact info fits." -ForegroundColor Green
Write-Host "Restore backup if needed:" -ForegroundColor Yellow
Write-Host "  Copy-Item '$bak' '$path' -Force" -ForegroundColor Yellow
