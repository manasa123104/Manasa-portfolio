# Quick script to push portfolio to GitHub
# Replace YOUR_USERNAME with your GitHub username

$username = Read-Host "Enter your GitHub username"

Write-Host "Setting up GitHub remote..." -ForegroundColor Yellow
git remote add origin "https://github.com/$username/portfolio.git"
if ($LASTEXITCODE -ne 0) {
    Write-Host "Remote might already exist. Updating..." -ForegroundColor Yellow
    git remote set-url origin "https://github.com/$username/portfolio.git"
}

Write-Host "Renaming branch to main..." -ForegroundColor Yellow
git branch -M main

Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git push -u origin main

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Success! Next Steps:" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "1. Go to: https://github.com/$username/portfolio" -ForegroundColor Cyan
Write-Host "2. Settings → Pages" -ForegroundColor Cyan
Write-Host "3. Source: main branch, / (root)" -ForegroundColor Cyan
Write-Host "4. Your site will be live at:" -ForegroundColor Cyan
Write-Host "   https://$username.github.io/portfolio/" -ForegroundColor Green
Write-Host ""

