# Script to commit and push changes to GitHub
# Run this script from the repository directory

Write-Host "Initializing git repository (if not already initialized)..." -ForegroundColor Yellow

# Initialize git if .git doesn't exist
if (-not (Test-Path .git)) {
    git init
    Write-Host "Git repository initialized." -ForegroundColor Green
}

# Check if remote exists, if not add it
$remoteExists = git remote get-url origin 2>$null
if (-not $remoteExists) {
    Write-Host "Adding remote repository..." -ForegroundColor Yellow
    git remote add origin https://github.com/manasa123104/Manasa-portfolio.git
} else {
    Write-Host "Remote already exists." -ForegroundColor Green
    git remote set-url origin https://github.com/manasa123104/Manasa-portfolio.git
}

Write-Host "Adding changed files..." -ForegroundColor Yellow
git add index.html styles.css

Write-Host "Committing changes..." -ForegroundColor Yellow
git commit -m "Add Contact Me section with form and Let's Connect section"

Write-Host "Pushing to GitHub..." -ForegroundColor Yellow
git branch -M main 2>$null
git push -u origin main

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  Changes have been pushed to GitHub!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Repository: https://github.com/manasa123104/Manasa-portfolio" -ForegroundColor Cyan
Write-Host ""

