# Nuclear option: find each support card by its h4 title and replace
# its <p> innerHTML entirely with known-good markup.

$path = "C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site\index.html"
$bak  = "$path.bak10"

if (-not (Test-Path $path)) { Write-Host "ERROR: index.html not found" -ForegroundColor Red; exit 1 }

Copy-Item $path $bak -Force
Write-Host "Backup saved: $bak"

$content = Get-Content $path -Raw

# Strip ALL prior support-card JS so we don't have conflicting blocks
$content = $content -replace '(?s)<script>\s*/\* Force widen the Phone/Email Support cards.*?\}\)\(\);\s*</script>', ''

# Inject one definitive JS block that:
#  - widens cards
#  - replaces phone/email <p> contents wholesale from known-good template
$js = @'
<script>
/* Definitive support-card rebuild: find each card by its h4 title,
   replace its description <p> with a clean version, force widths inline. */
(function(){
  function rebuild(){
    var container = document.querySelector('.real-support__cards');
    if (!container) { setTimeout(rebuild, 100); return; }

    // Force container layout
    container.style.cssText = 'display:flex !important;flex-wrap:nowrap !important;gap:18px !important;max-width:none !important;width:auto !important;justify-content:flex-start !important;';

    // Force the parent column to not constrain children
    var parent = container.parentElement;
    if (parent) { parent.style.maxWidth = 'none'; parent.style.flex = '1 1 auto'; }

    var phoneHTML = 'Call directly and speak with a member of the team who knows the platform, the rules, and your account at <span style="white-space:nowrap;font-weight:600;">+1 (877) 799-8198</span>.';
    var emailHTML = 'Send a message to <span style="white-space:nowrap;font-weight:600;">support@TradeFundrr.com</span> and get a response from a real person, not an AI reply, not a 3-day wait.';

    var cards = container.querySelectorAll('.card');
    cards.forEach(function(c){
      // Force card width/styling
      c.style.cssText = 'width:320px !important;min-width:320px !important;max-width:320px !important;flex:0 0 320px !important;padding:24px 22px !important;box-sizing:border-box !important;background:hsla(0,0%,100%,0.04);border:1px solid hsla(0,0%,100%,0.1);border-radius:16px;backdrop-filter:blur(10px);display:flex;flex-direction:column;gap:20px;';

      // Identify which card by h4 text
      var h4 = c.querySelector('h4');
      var p = c.querySelector('p');
      if (!h4 || !p) return;
      var title = (h4.textContent || '').toLowerCase();

      if (title.indexOf('phone') !== -1) {
        p.innerHTML = phoneHTML;
      } else if (title.indexOf('email') !== -1) {
        p.innerHTML = emailHTML;
      }
      p.style.cssText = 'color:#fff !important;font-size:13px !important;line-height:1.55 !important;letter-spacing:-0.3px !important;word-break:normal !important;overflow-wrap:normal !important;margin:0 !important;display:block !important;';
    });
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', rebuild);
  else rebuild();
})();
</script>
'@

if ($content -notmatch 'Definitive support-card rebuild') {
  $content = $content -replace '</body>', "$js`n</body>"
  Write-Host "Inserted definitive rebuild script" -ForegroundColor Green
} else {
  Write-Host "Rebuild script already present - skipping insert (you may want to reset and re-run)" -ForegroundColor Yellow
}

Set-Content $path $content -NoNewline
Write-Host ""
Write-Host "Done. Cards: 320px wide. Email + phone rebuilt from clean templates." -ForegroundColor Green
Write-Host "Restore backup if needed:" -ForegroundColor Yellow
Write-Host "  Copy-Item '$bak' '$path' -Force" -ForegroundColor Yellow
