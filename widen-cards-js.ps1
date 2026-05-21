# Uses JavaScript to force the support cards' width/layout via inline styles.
# This bypasses any CSS specificity issues from main.css.

$path = "C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site\index.html"
$bak  = "$path.bak8"

if (-not (Test-Path $path)) { Write-Host "ERROR: index.html not found" -ForegroundColor Red; exit 1 }

Copy-Item $path $bak -Force
Write-Host "Backup saved: $bak"

$content = Get-Content $path -Raw

# Add JS at the bottom of the body that forces card widths via inline styles
$js = @'
<script>
/* Force widen the Phone/Email Support cards via inline style.cssText
   (CSS-level overrides were losing the specificity battle with main.css) */
(function(){
  function widen(){
    var container = document.querySelector('.real-support__cards');
    if (!container) { setTimeout(widen, 100); return; }
    container.style.cssText = 'display:flex !important;flex-wrap:nowrap !important;gap:18px !important;max-width:none !important;width:auto !important;';
    var cards = container.querySelectorAll('.card');
    cards.forEach(function(c){
      c.style.cssText = 'width:280px !important;min-width:280px !important;max-width:280px !important;flex:0 0 280px !important;padding:24px 22px !important;box-sizing:border-box !important;background:hsla(0,0%,100%,0.04);border:1px solid hsla(0,0%,100%,0.1);border-radius:16px;backdrop-filter:blur(10px);display:flex;flex-direction:column;gap:20px;';
      var p = c.querySelector('p');
      if (p) p.style.cssText = 'color:#fff !important;font-size:13px !important;line-height:1.55 !important;letter-spacing:-0.3px !important;word-break:normal !important;overflow-wrap:normal !important;margin:0 !important;display:block !important;';
      var strongs = c.querySelectorAll('p strong');
      strongs.forEach(function(s){ s.style.whiteSpace = 'nowrap'; });
    });
    /* Also unconstrain the parent column if present */
    var parent = container.parentElement;
    if (parent) {
      parent.style.maxWidth = 'none';
      parent.style.flex = '1 1 auto';
      var grandparent = parent.parentElement;
      if (grandparent && grandparent.classList.contains('real-support__inner')) {
        grandparent.style.gap = '40px';
      }
    }
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', widen);
  else widen();
})();
</script>
'@

if ($content -notmatch 'Force widen the Phone/Email Support cards via inline style') {
  $content = $content -replace '</body>', "$js`n</body>"
  Write-Host "Inserted JS widening script before </body>" -ForegroundColor Green
} else {
  Write-Host "Widening JS already present - skipping" -ForegroundColor Yellow
}

Set-Content $path $content -NoNewline
Write-Host ""
Write-Host "Done. JS will force cards to 280px wide regardless of CSS battles." -ForegroundColor Green
Write-Host "Restore backup if needed:" -ForegroundColor Yellow
Write-Host "  Copy-Item '$bak' '$path' -Force" -ForegroundColor Yellow
