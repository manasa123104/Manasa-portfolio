# Portfolio Deployment Script
# This script helps you deploy your portfolio to GitHub Pages

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Portfolio Deployment Helper" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if git is installed
try {
    $gitVersion = git --version
    Write-Host "✓ Git is installed: $gitVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Git is not installed. Please install Git first:" -ForegroundColor Red
    Write-Host "  Download from: https://git-scm.com/downloads" -ForegroundColor Yellow
    exit
}

Write-Host ""
Write-Host "Step 1: Initialize Git Repository" -ForegroundColor Yellow
Write-Host "-----------------------------------" -ForegroundColor Yellow

if (Test-Path ".git") {
    Write-Host "✓ Git repository already exists" -ForegroundColor Green
} else {
    Write-Host "Initializing git repository..." -ForegroundColor Cyan
    git init
    Write-Host "✓ Git repository initialized" -ForegroundColor Green
}

Write-Host ""
Write-Host "Step 2: Add Files" -ForegroundColor Yellow
Write-Host "-----------------------------------" -ForegroundColor Yellow
git add .
Write-Host "✓ All files added" -ForegroundColor Green

Write-Host ""
Write-Host "Step 3: Create Initial Commit" -ForegroundColor Yellow
Write-Host "-----------------------------------" -ForegroundColor Yellow
git commit -m "Initial commit: Portfolio website"
Write-Host "✓ Initial commit created" -ForegroundColor Green

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  Next Steps:" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "1. Create a new PUBLIC repository on GitHub:" -ForegroundColor White
Write-Host "   - Go to: https://github.com/new" -ForegroundColor Yellow
Write-Host "   - Repository name: portfolio" -ForegroundColor Yellow
Write-Host "   - Make it PUBLIC (required for free GitHub Pages)" -ForegroundColor Yellow
Write-Host "   - DO NOT initialize with README" -ForegroundColor Yellow
Write-Host ""
Write-Host "2. After creating the repository, run these commands:" -ForegroundColor White
Write-Host "   git remote add origin https://github.com/YOUR_USERNAME/portfolio.git" -ForegroundColor Cyan
Write-Host "   git branch -M main" -ForegroundColor Cyan
Write-Host "   git push -u origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "3. Enable GitHub Pages:" -ForegroundColor White
Write-Host "   - Go to your repository Settings → Pages" -ForegroundColor Yellow
Write-Host "   - Source: main branch, / (root) folder" -ForegroundColor Yellow
Write-Host "   - Click Save" -ForegroundColor Yellow
Write-Host ""
Write-Host "4. Your portfolio will be live at:" -ForegroundColor White
Write-Host "   https://YOUR_USERNAME.github.io/portfolio/" -ForegroundColor Green
Write-Host ""
Write-Host "For detailed instructions, see: DEPLOY_TO_GITHUB_PAGES.md" -ForegroundColor Cyan
Write-Host ""

