# Forces the email to stay on a single line, no matter what.

$path = "C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site\index.html"
$bak  = "$path.bak9"

if (-not (Test-Path $path)) { Write-Host "ERROR: index.html not found" -ForegroundColor Red; exit 1 }

Copy-Item $path $bak -Force
Write-Host "Backup saved: $bak"

$content = Get-Content $path -Raw

# Update the JS widening block to also forcibly fix the email span using innerHTML rewriting
$oldJSPattern = '(?s)/\* Force widen the Phone/Email Support cards via inline style\.cssText.*?\}\)\(\);'
$newJS = @'
/* Force widen the Phone/Email Support cards via inline style.cssText
   (CSS-level overrides were losing the specificity battle with main.css) */
(function(){
  function widen(){
    var container = document.querySelector('.real-support__cards');
    if (!container) { setTimeout(widen, 100); return; }
    container.style.cssText = 'display:flex !important;flex-wrap:nowrap !important;gap:18px !important;max-width:none !important;width:auto !important;';
    var cards = container.querySelectorAll('.card');
    cards.forEach(function(c){
      c.style.cssText = 'width:300px !important;min-width:300px !important;max-width:300px !important;flex:0 0 300px !important;padding:24px 22px !important;box-sizing:border-box !important;background:hsla(0,0%,100%,0.04);border:1px solid hsla(0,0%,100%,0.1);border-radius:16px;backdrop-filter:blur(10px);display:flex;flex-direction:column;gap:20px;';
      var p = c.querySelector('p');
      if (p) {
        /* Force fix: rewrite innerHTML to wrap contact info in nowrap spans, removing stray spaces around @ */
        var html = p.innerHTML;
        /* Collapse any "support@ TradeFundrr.com" with spaces back into a single token wrapped in nowrap */
        html = html.replace(/(<strong[^>]*>)?\s*support\s*@\s*TradeFundrr\.com(\s*<\/strong>)?/gi,
          '<span style="white-space:nowrap;font-weight:600;">support@TradeFundrr.com</span>');
        html = html.replace(/(<strong[^>]*>)?\s*\+1\s*\(877\)\s*799-8198(\s*<\/strong>)?/gi,
          '<span style="white-space:nowrap;font-weight:600;">+1 (877) 799-8198</span>');
        p.innerHTML = html;
        p.style.cssText = 'color:#fff !important;font-size:13px !important;line-height:1.55 !important;letter-spacing:-0.3px !important;word-break:normal !important;overflow-wrap:normal !important;margin:0 !important;display:block !important;';
      }
    });
    var parent = container.parentElement;
    if (parent) {
      parent.style.maxWidth = 'none';
      parent.style.flex = '1 1 auto';
    }
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', widen);
  else widen();
})();
'@

if ($content -match $oldJSPattern) {
  $content = $content -replace $oldJSPattern, $newJS
  Write-Host "Updated JS widening block with email/phone nowrap span rewrites" -ForegroundColor Green
} else {
  Write-Host "ERROR: didn't find existing JS widening block - this script expects the previous widen-cards-js.ps1 to have already run" -ForegroundColor Red
  exit 1
}

Set-Content $path $content -NoNewline
Write-Host ""
Write-Host "Done. Cards are 300px wide and email/phone are forced into single-line spans." -ForegroundColor Green
Write-Host "Restore backup if needed:" -ForegroundColor Yellow
Write-Host "  Copy-Item '$bak' '$path' -Force" -ForegroundColor Yellow
