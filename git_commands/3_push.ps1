# Script to safely push changes to remote
Write-Host "Preparing to push changes..." -ForegroundColor Cyan

# Get current branch
$currentBranch = git rev-parse --abbrev-ref HEAD
Write-Host "Current branch: $currentBranch" -ForegroundColor Cyan

# Check if there are any commits to push
$unpushedCommits = git log origin/$currentBranch..$currentBranch --oneline
if ($unpushedCommits) {
    Write-Host "Found unpushed commits. Pushing to remote repository..." -ForegroundColor Yellow
    git push origin $currentBranch
    
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Changes successfully pushed to remote repository!" -ForegroundColor Green
    } else {
        Write-Host "Error pushing changes. Please check your connection and try again." -ForegroundColor Red
    }
} else {
    Write-Host "No unpushed commits found. Nothing to push." -ForegroundColor Magenta
}
