# Script to safely switch between branches
param(
    [Parameter(Mandatory=$true)]
    [string]$BranchName
)

# Check if there are uncommitted changes
$status = git status --porcelain
if ($status) {
    Write-Host "Warning: You have uncommitted changes." -ForegroundColor Yellow
    Write-Host "Please commit or stash your changes before switching branches." -ForegroundColor Yellow
    Write-Host "Use 2_commit.ps1 to commit your changes." -ForegroundColor Cyan
    exit
}

# Check if the branch exists
$branchExists = git show-ref --verify --quiet refs/heads/$BranchName
if ($LASTEXITCODE -eq 0) {
    # Branch exists, switch to it
    Write-Host "Switching to existing branch: $BranchName" -ForegroundColor Cyan
    git checkout $BranchName
} else {
    # Branch doesn't exist, create it
    Write-Host "Creating and switching to new branch: $BranchName" -ForegroundColor Yellow
    git checkout -b $BranchName
}

Write-Host "Successfully switched to branch: $BranchName" -ForegroundColor Green
