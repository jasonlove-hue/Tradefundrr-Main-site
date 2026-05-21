# Fixes the overlapping support cards by tuning width + layout.

$path = "C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site\index.html"
$bak  = "$path.bak5"

if (-not (Test-Path $path)) { Write-Host "ERROR: index.html not found" -ForegroundColor Red; exit 1 }

Copy-Item $path $bak -Force
Write-Host "Backup saved: $bak"

$content = Get-Content $path -Raw

# Replace the previously injected widening CSS with a better-balanced version
$oldCSS = @'
<style>
  /* Make support cards wide enough to fit the email and phone without breaking */
  .real-support__cards { gap: 16px !important; }
  .real-support__cards .card { width: 240px !important; padding: 22px 18px !important; }
  .real-support__cards .card p { word-break: normal !important; overflow-wrap: normal !important; hyphens: none !important; }
</style>
'@

$newCSS = @'
<style>
  /* Support cards: wide enough for contact info, flex layout that won't overlap */
  .real-support__cards { display: flex !important; flex-wrap: wrap !important; gap: 16px !important; justify-content: flex-start !important; }
  .real-support__cards .card { width: 220px !important; flex: 0 0 220px !important; padding: 22px 18px !important; box-sizing: border-box !important; }
  .real-support__cards .card p { word-break: normal !important; overflow-wrap: normal !important; hyphens: none !important; font-size: 13px !important; line-height: 1.4 !important; }
</style>
'@

if ($content -match [regex]::Escape($oldCSS)) {
  $content = $content.Replace($oldCSS, $newCSS)
  Write-Host "Replaced support-card CSS with the non-overlapping version" -ForegroundColor Green
} else {
  # If the old block isn't found, inject the new block before </head>
  if ($content -notmatch 'Support cards: wide enough for contact info') {
    $content = $content -replace '</head>', "$newCSS`n</head>"
    Write-Host "Injected fresh support-card CSS into <head>" -ForegroundColor Green
  } else {
    Write-Host "Support-card CSS already up to date" -ForegroundColor Yellow
  }
}

Set-Content $path $content -NoNewline
Write-Host ""
Write-Host "Done. Reload and the cards should sit side by side without overlap." -ForegroundColor Green
Write-Host "Restore backup if needed:" -ForegroundColor Yellow
Write-Host "  Copy-Item '$bak' '$path' -Force" -ForegroundColor Yellow
