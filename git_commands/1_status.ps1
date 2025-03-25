# Script to check git status
Write-Host "Checking git status..." -ForegroundColor Cyan
git status

# Get current branch
$currentBranch = git rev-parse --abbrev-ref HEAD
Write-Host "`nCurrent branch: $currentBranch" -ForegroundColor Green
