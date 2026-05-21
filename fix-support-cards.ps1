# Run this from PowerShell in the main-site folder.
# It updates the Phone Support and Email Support cards on the homepage.

$path = "C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site\index.html"
$bak  = "$path.bak"

if (-not (Test-Path $path)) { Write-Host "ERROR: index.html not found at $path" -ForegroundColor Red; exit 1 }

Copy-Item $path $bak -Force
Write-Host "Backup saved: $bak"

$content = Get-Content $path -Raw

# 1) Change any 'card opened' to just 'card' (collapses any expanded card)
$content = $content -replace 'class="card opened"', 'class="card"'

# 2) Flip the '-' symbol back to '+' (closed state) in real-support cards
$content = $content -replace '(<div class="real-support__cards">[\s\S]*?<span class="symbol">)-(</span>)', '$1+$2'

# 3) Replace the Phone Support description (any current text -> new text with phone number)
$phonePattern = '(<h4>Phone Support</h4>\s*)<p[^>]*>[^<]*</p>'
$phoneReplacement = '$1<p style="word-break: break-word; overflow-wrap: anywhere;">Call directly and speak with a member of the team who knows the platform, the rules, and your account at <strong>+1 (877) 799-8198</strong>.</p>'
$content = $content -replace $phonePattern, $phoneReplacement

# 4) Replace the Email Support description (any current text -> new text with email address)
$emailPattern = '(<h4>Email Support</h4>\s*)<p[^>]*>[^<]*</p>'
$emailReplacement = '$1<p style="word-break: break-word; overflow-wrap: anywhere;">Send a message to <strong>support@TradeFundrr.com</strong> and get a response from a real person, not an AI reply, not a 3-day wait.</p>'
$content = $content -replace $emailPattern, $emailReplacement

Set-Content $path $content -NoNewline
Write-Host ""
Write-Host "Done. Open index.html and verify before pushing." -ForegroundColor Green
Write-Host "If anything looks wrong, restore the backup:" -ForegroundColor Yellow
Write-Host "  Copy-Item '$bak' '$path' -Force" -ForegroundColor Yellow
