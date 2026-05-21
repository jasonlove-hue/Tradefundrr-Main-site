# Sets the Phone Support and Email Support cards to be OPEN by default.
# Run from PowerShell in the main-site folder.

$path = "C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site\index.html"
$bak  = "$path.bak3"

if (-not (Test-Path $path)) { Write-Host "ERROR: index.html not found" -ForegroundColor Red; exit 1 }

Copy-Item $path $bak -Force
Write-Host "Backup saved: $bak"

$content = Get-Content $path -Raw

# 1) For each support card in .real-support__cards, replace 'class="card"' with 'class="card opened"'
$pattern = '(<div class="real-support__cards">[\s\S]*?</div>\s*</div>\s*</section>)'

if ($content -match $pattern) {
  $block = $Matches[1]
  $newBlock = $block -replace 'class="card"', 'class="card opened"'
  # Flip every "+" symbol to "-" inside this block
  $newBlock = $newBlock -replace '(<span class="symbol">)\+(</span>)', '$1-$2'
  # Add inline display:block to the paragraphs so they always render
  $newBlock = $newBlock -replace '(<p style="word-break: break-word; overflow-wrap: anywhere;)("[^>]*>)', '$1; display: block;$2'
  $newBlock = $newBlock -replace '(<p style="word-break: break-word; overflow-wrap: anywhere;[^"]*")>', '$1>'
  $content = $content.Replace($block, $newBlock)
  Write-Host "Both support cards set to opened" -ForegroundColor Green
} else {
  Write-Host "WARN: .real-support__cards block not found - skipping" -ForegroundColor Yellow
}

Set-Content $path $content -NoNewline
Write-Host ""
Write-Host "Done. Reload the page and both cards should be expanded." -ForegroundColor Green
Write-Host "If something looks wrong, restore the backup:" -ForegroundColor Yellow
Write-Host "  Copy-Item '$bak' '$path' -Force" -ForegroundColor Yellow
