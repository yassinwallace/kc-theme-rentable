# Comprehensive Git Workflow Script
# IMPORTANT: This script combines all git operations in one place

# Function to check current git status
function Show-GitStatus {
    Write-Host "`nCURRENT GIT STATUS" -ForegroundColor Cyan
    Write-Host "==================" -ForegroundColor Cyan
    
    # Get current branch
    $script:currentBranch = git rev-parse --abbrev-ref HEAD
    Write-Host "Current branch: $script:currentBranch" -ForegroundColor Green
    
    # Check if in detached HEAD state
    if ($script:currentBranch -eq "HEAD") {
        Write-Host "WARNING: You are in a detached HEAD state!" -ForegroundColor Red
        Write-Host "Run the 5_recover.ps1 script to fix this issue." -ForegroundColor Yellow
        exit
    }
    
    # Show status
    git status
}

# Function to commit changes
function Commit-Changes {
    param (
        [string]$CommitMessage
    )
    
    Write-Host "`nCOMMITTING CHANGES" -ForegroundColor Cyan
    Write-Host "==================" -ForegroundColor Cyan
    
    # Check if there are any changes to commit
    $status = git status --porcelain
    if ($status) {
        Write-Host "Changes detected. Staging changes..." -ForegroundColor Yellow
        git add .
        
        # Commit changes with the provided message
        Write-Host "Committing changes with message: '$CommitMessage'" -ForegroundColor Yellow
        git commit -m "$CommitMessage"
        
        Write-Host "Changes successfully committed!" -ForegroundColor Green
    } else {
        Write-Host "No changes detected. Nothing to commit." -ForegroundColor Magenta
    }
}

# Function to push changes
function Push-Changes {
    Write-Host "`nPUSHING CHANGES" -ForegroundColor Cyan
    Write-Host "================" -ForegroundColor Cyan
    
    # Check if there are any commits to push
    $unpushedCommits = git log origin/$script:currentBranch..$script:currentBranch --oneline 2>$null
    if ($?) {
        if ($unpushedCommits) {
            Write-Host "Found unpushed commits. Pushing to remote repository..." -ForegroundColor Yellow
            git push origin $script:currentBranch
            
            if ($LASTEXITCODE -eq 0) {
                Write-Host "Changes successfully pushed to remote repository!" -ForegroundColor Green
            } else {
                Write-Host "Error pushing changes. Please check your connection and try again." -ForegroundColor Red
            }
        } else {
            Write-Host "No unpushed commits found. Nothing to push." -ForegroundColor Magenta
        }
    } else {
        Write-Host "Remote branch may not exist yet. Pushing with -u flag..." -ForegroundColor Yellow
        git push -u origin $script:currentBranch
    }
}

# Main script execution
Show-GitStatus

$action = Read-Host "`nWhat would you like to do? (commit/push/both/status/exit)"

switch ($action.ToLower()) {
    "commit" {
        $commitMessage = Read-Host "Enter commit message"
        Commit-Changes -CommitMessage $commitMessage
    }
    "push" {
        Push-Changes
    }
    "both" {
        $commitMessage = Read-Host "Enter commit message"
        Commit-Changes -CommitMessage $commitMessage
        Push-Changes
    }
    "status" {
        Show-GitStatus
    }
    "exit" {
        Write-Host "Exiting script." -ForegroundColor Cyan
        exit
    }
    default {
        Write-Host "Invalid option. Please choose commit, push, both, status, or exit." -ForegroundColor Red
    }
}

Write-Host "`nGit workflow complete!" -ForegroundColor Green
Write-Host "Remember to use the other scripts in the git_commands folder for specific operations:" -ForegroundColor Cyan
Write-Host "1_status.ps1 - Check git status" -ForegroundColor Cyan
Write-Host "2_commit.ps1 - Commit changes" -ForegroundColor Cyan
Write-Host "3_push.ps1 - Push changes" -ForegroundColor Cyan
Write-Host "4_switch_branch.ps1 - Switch branches" -ForegroundColor Cyan
Write-Host "5_recover.ps1 - Recover from git issues" -ForegroundColor Cyan