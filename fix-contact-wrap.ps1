# Stops the phone number and email from breaking mid-string.
# Widens cards slightly, wraps the contact info in nowrap spans.

$path = "C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site\index.html"
$bak  = "$path.bak4"

if (-not (Test-Path $path)) { Write-Host "ERROR: index.html not found" -ForegroundColor Red; exit 1 }

Copy-Item $path $bak -Force
Write-Host "Backup saved: $bak"

$content = Get-Content $path -Raw

# 1) Wrap the phone number in <strong> with white-space: nowrap so '+1' and '(877)...' stay together
$content = $content -replace '<strong>\+1 \(877\) 799-8198</strong>', '<strong style="white-space: nowrap;">+1 (877) 799-8198</strong>'

# 2) Wrap the email in <strong> with white-space: nowrap
$content = $content -replace '<strong>support@TradeFundrr\.com</strong>', '<strong style="white-space: nowrap;">support@TradeFundrr.com</strong>'

# 3) Remove the aggressive word-break / overflow-wrap that was causing the mid-word splitting
$content = $content -replace 'style="word-break: break-word; overflow-wrap: anywhere;', 'style="overflow-wrap: normal;'
$content = $content -replace 'style="word-break: break-word; overflow-wrap: anywhere"', 'style="overflow-wrap: normal;"'

# 4) Inject CSS that widens the support cards so the contact info fits without wrapping
$widenCSS = @'
<style>
  /* Make support cards wide enough to fit the email and phone without breaking */
  .real-support__cards { gap: 16px !important; }
  .real-support__cards .card { width: 240px !important; padding: 22px 18px !important; }
  .real-support__cards .card p { word-break: normal !important; overflow-wrap: normal !important; hyphens: none !important; }
</style>
'@

if ($content -notmatch 'Make support cards wide enough') {
  $content = $content -replace '</head>', "$widenCSS`n</head>"
  Write-Host "Inserted card-width CSS into <head>" -ForegroundColor Green
} else {
  Write-Host "Card-width CSS already present - skipping" -ForegroundColor Yellow
}

Set-Content $path $content -NoNewline
Write-Host ""
Write-Host "Done. Reload the page - phone and email should stay on one line." -ForegroundColor Green
Write-Host "Restore backup if needed:" -ForegroundColor Yellow
Write-Host "  Copy-Item '$bak' '$path' -Force" -ForegroundColor Yellow
