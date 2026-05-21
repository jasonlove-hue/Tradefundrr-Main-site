# TradeFundrr — push to GitHub, then connect Vercel
#
# Usage:
#   1. Create an EMPTY repo on GitHub (no README, no .gitignore, no license)
#      e.g. https://github.com/new  ->  name it "tradefundrr-site"
#   2. Edit the $RepoUrl line below with your repo URL
#   3. Open PowerShell, cd to this folder, and run:
#        .\deploy-to-github.ps1
#   4. After it pushes, go to https://vercel.com/new, click "Import"
#      next to your new repo, accept defaults, click Deploy.

# === EDIT THIS LINE if you used a different repo name ===
$RepoUrl = "https://github.com/jasonlove-hue/Tradefundrr-Main-site.git"
# ========================================================

$ErrorActionPreference = "Stop"

Write-Host "Cleaning any prior broken .git folder..." -ForegroundColor Cyan
if (Test-Path .git) {
    # OneDrive sometimes makes files read-only — force it
    Get-ChildItem -Path .git -Recurse -Force | ForEach-Object { $_.Attributes = 'Normal' } 2>$null
    Remove-Item -Recurse -Force .git
}

Write-Host "Initializing git repo on 'main'..." -ForegroundColor Cyan
git init -b main

Write-Host "Configuring local git identity..." -ForegroundColor Cyan
git config user.email "jason.love@tradefundrr.com"
git config user.name  "Jason Love"

Write-Host "Staging files..." -ForegroundColor Cyan
git add -A

Write-Host "Creating initial commit..." -ForegroundColor Cyan
git commit -m "Initial commit: TradeFundrr marketing site"

Write-Host "Adding remote: $RepoUrl" -ForegroundColor Cyan
if ($RepoUrl -like "*YOUR-USERNAME*") {
    Write-Host "ERROR: edit `$RepoUrl at the top of this file first." -ForegroundColor Red
    exit 1
}
git remote add origin $RepoUrl

Write-Host "Pushing to GitHub..." -ForegroundColor Cyan
git push -u origin main

Write-Host ""
Write-Host "Done. Next:" -ForegroundColor Green
Write-Host "  1. Open https://vercel.com/new"
Write-Host "  2. Find your repo, click 'Import'"
Write-Host "  3. Framework Preset: 'Other'  (it's a pure static site)"
Write-Host "  4. Leave Build Command and Output Directory blank"
Write-Host "  5. Click 'Deploy'"
