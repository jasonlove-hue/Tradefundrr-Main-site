# Replaces the full sub-headline copy in the "Your Edge Is Real" section.

$path = "C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site\index.html"
$bak  = "$path.bak12"

if (-not (Test-Path $path)) { Write-Host "ERROR: index.html not found" -ForegroundColor Red; exit 1 }

Copy-Item $path $bak -Force
Write-Host "Backup saved: $bak"

$content = Get-Content $path -Raw

$new = "Access up to `$1M+ in buying power as a fully funded trader, through a structured trading environment with clear rules, performance-based payouts, and dedicated support."

# Match anything starting with "Access $..." and ending with "real support." (or similar)
$pattern1 = 'Access \$25K[^<]*?in simulated buying power[^<]*?real support\.'
$pattern2 = 'Access up to \$100k in simulated buying power[^<]*?real support\.'

$matched = $false

if ($content -match $pattern1) {
  $content = $content -replace $pattern1, $new
  Write-Host "Replaced original Edge section copy" -ForegroundColor Green
  $matched = $true
}
if ($content -match $pattern2) {
  $content = $content -replace $pattern2, $new
  Write-Host "Replaced previous '$100k' Edge section copy" -ForegroundColor Green
  $matched = $true
}

if (-not $matched) {
  Write-Host "WARN: pattern not found. Try a broader search:" -ForegroundColor Yellow
  Write-Host "  findstr /n `"Access`" index.html" -ForegroundColor Yellow
  Write-Host "Then paste the actual line(s) so we can target them precisely." -ForegroundColor Yellow
}

Set-Content $path $content -NoNewline
Write-Host ""
Write-Host "Done. Reload to verify the new copy:" -ForegroundColor Green
Write-Host "  $new" -ForegroundColor Cyan
Write-Host "Restore backup if needed:" -ForegroundColor Yellow
Write-Host "  Copy-Item '$bak' '$path' -Force" -ForegroundColor Yellow
