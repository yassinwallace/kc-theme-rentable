# Script to recover from common git issues
Write-Host "Git Recovery Tool" -ForegroundColor Cyan
Write-Host "==================" -ForegroundColor Cyan

# Get current state
$currentBranch = git rev-parse --abbrev-ref HEAD
Write-Host "Current state: $currentBranch" -ForegroundColor Yellow

# Check if in detached HEAD state
if ($currentBranch -eq "HEAD") {
    Write-Host "Detected detached HEAD state. Attempting recovery..." -ForegroundColor Red
    
    # Get the current commit hash
    $currentCommit = git rev-parse HEAD
    Write-Host "Current commit: $currentCommit" -ForegroundColor Yellow
    
    # Create a recovery branch
    $recoveryBranch = "recovery-" + (Get-Date -Format "yyyyMMdd-HHmmss")
    Write-Host "Creating recovery branch: $recoveryBranch" -ForegroundColor Cyan
    git checkout -b $recoveryBranch
    
    Write-Host "Recovery complete! You are now on branch: $recoveryBranch" -ForegroundColor Green
    Write-Host "Your work has been saved to this branch." -ForegroundColor Green
    exit
}

# Check for staged but uncommitted changes
$stagedChanges = git diff --name-only --cached
if ($stagedChanges) {
    Write-Host "You have staged changes that are not committed." -ForegroundColor Yellow
    $commitOption = Read-Host "Would you like to commit these changes? (y/n)"
    
    if ($commitOption -eq "y") {
        $commitMessage = Read-Host "Enter commit message"
        git commit -m $commitMessage
        Write-Host "Changes committed successfully." -ForegroundColor Green
    }
}

# Check for unstaged changes
$unstagedChanges = git diff --name-only
if ($unstagedChanges) {
    Write-Host "You have unstaged changes." -ForegroundColor Yellow
    $stageOption = Read-Host "Would you like to stage these changes? (y/n)"
    
    if ($stageOption -eq "y") {
        git add .
        Write-Host "Changes staged successfully." -ForegroundColor Green
        
        $commitOption = Read-Host "Would you like to commit these changes? (y/n)"
        if ($commitOption -eq "y") {
            $commitMessage = Read-Host "Enter commit message"
            git commit -m $commitMessage
            Write-Host "Changes committed successfully." -ForegroundColor Green
        }
    }
}

Write-Host "Git recovery check complete." -ForegroundColor Green
