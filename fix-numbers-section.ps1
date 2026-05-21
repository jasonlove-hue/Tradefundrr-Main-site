# Updates the .numbers section copy and adds a falling-cards animation.
# Run from PowerShell in the main-site folder.

$path = "C:\Users\Trader\OneDrive\Desktop\TradeFundrr Brain\main-site\index.html"
$bak  = "$path.bak2"

if (-not (Test-Path $path)) { Write-Host "ERROR: index.html not found at $path" -ForegroundColor Red; exit 1 }

Copy-Item $path $bak -Force
Write-Host "Backup saved: $bak"

$content = Get-Content $path -Raw

# 1) Replace the entire .numbers__stack contents
$stackPattern = '(?s)<div class="numbers__stack">.*?</div>'
$stackReplacement = @'
<div class="numbers__stack">
      <p><span class="num">Trusted</span> by Funded Traders Worldwide</p>
      <p><span class="num">Structured</span> Weekly Payout Cycles</p>
      <p><span class="num">Built</span> for Long-Term Trader Growth</p>
      <p><span class="num">Opportunities</span> to Scale Over Time</p>
    </div>
'@

if ($content -match $stackPattern) {
  $content = $content -replace $stackPattern, $stackReplacement
  Write-Host "Replaced .numbers__stack content" -ForegroundColor Green
} else {
  Write-Host "WARN: .numbers__stack not found - skipping copy update" -ForegroundColor Yellow
}

# 2) Add falling-cards animation CSS just before </head>
$animationCSS = @'
<style>
  /* Falling certificates animation for the .numbers section */
  .numbers {
    animation: numbers-cards-fall 1.2s cubic-bezier(0.34, 1.56, 0.64, 1) both;
    animation-play-state: paused;
  }
  .numbers.is-in-view { animation-play-state: running; }
  @keyframes numbers-cards-fall {
    0%   { background-position: center -300px; opacity: 0; }
    60%  { opacity: 1; }
    100% { background-position: center 0;       opacity: 1; }
  }
  .numbers .bg {
    animation: numbers-bg-fade 1.4s ease 0.2s both;
    animation-play-state: paused;
  }
  .numbers.is-in-view .bg { animation-play-state: running; }
  @keyframes numbers-bg-fade {
    0%   { opacity: 0; transform: translateY(-40px); }
    100% { opacity: 1; transform: translateY(0); }
  }
  @media (prefers-reduced-motion: reduce) {
    .numbers, .numbers .bg { animation: none !important; background-position: center 0 !important; opacity: 1 !important; transform: none !important; }
  }
</style>
'@

if ($content -notmatch 'numbers-cards-fall') {
  $content = $content -replace '</head>', "$animationCSS`n</head>"
  Write-Host "Inserted falling-cards animation CSS into <head>" -ForegroundColor Green
} else {
  Write-Host "Animation CSS already present - skipping" -ForegroundColor Yellow
}

# 3) Add IntersectionObserver JS to trigger animation when section scrolls into view
$observerJS = @'
<script>
/* Trigger falling-cards animation when .numbers enters viewport */
(function(){
  function init(){
    var n = document.querySelector('.numbers');
    if (!n) return;
    if ('IntersectionObserver' in window) {
      var io = new IntersectionObserver(function(entries){
        entries.forEach(function(e){
          if (e.isIntersecting) { e.target.classList.add('is-in-view'); io.unobserve(e.target); }
        });
      }, { threshold: 0.2 });
      io.observe(n);
    } else {
      n.classList.add('is-in-view');
    }
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', init);
  else init();
})();
</script>
'@

if ($content -notmatch 'Trigger falling-cards animation') {
  $content = $content -replace '</body>', "$observerJS`n</body>"
  Write-Host "Inserted falling-cards observer JS before </body>" -ForegroundColor Green
} else {
  Write-Host "Observer JS already present - skipping" -ForegroundColor Yellow
}

Set-Content $path $content -NoNewline
Write-Host ""
Write-Host "Done. Open index.html in browser and scroll to the .numbers section to see the animation." -ForegroundColor Green
Write-Host "If anything looks wrong, restore the backup:" -ForegroundColor Yellow
Write-Host "  Copy-Item '$bak' '$path' -Force" -ForegroundColor Yellow
