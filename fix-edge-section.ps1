# Updates the "Your Edge Is Real" section to use "Access up to $100k" instead of "$25K-$1M+".

$path = "C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site\index.html"
$bak  = "$path.bak11"

if (-not (Test-Path $path)) { Write-Host "ERROR: index.html not found" -ForegroundColor Red; exit 1 }

Copy-Item $path $bak -Force
Write-Host "Backup saved: $bak"

$content = Get-Content $path -Raw

# Match "Access $25K[en dash or hyphen]$1M+ in simulated buying power" and replace
# the dollar-amount portion only. Use [^\s] to catch both en-dash (–) and hyphen (-).
$pattern = 'Access \$25K[–\-]\$1M\+ in simulated buying power'
$replacement = 'Access up to $100k in simulated buying power'

if ($content -match $pattern) {
  $content = $content -replace $pattern, $replacement
  Write-Host "Replaced amount in 'Your Edge Is Real' section" -ForegroundColor Green
} else {
  # Try a looser pattern in case the dash is something else
  $looser = 'Access \$25K\S\$1M\+ in simulated buying power'
  if ($content -match $looser) {
    $content = $content -replace $looser, $replacement
    Write-Host "Replaced amount (loose match) in 'Your Edge Is Real' section" -ForegroundColor Green
  } else {
    Write-Host "WARN: pattern not found - the source text may differ. No change made." -ForegroundColor Yellow
    Write-Host "Look for this text in index.html and update it manually:" -ForegroundColor Yellow
    Write-Host '  Access $25K-$1M+ in simulated buying power' -ForegroundColor Yellow
  }
}

Set-Content $path $content -NoNewline
Write-Host ""
Write-Host "Done. Reload to verify the new text reads 'Access up to `$100k in simulated buying power'." -ForegroundColor Green
Write-Host "Restore backup if needed:" -ForegroundColor Yellow
Write-Host "  Copy-Item '$bak' '$path' -Force" -ForegroundColor Yellow
