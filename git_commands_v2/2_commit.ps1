# Script to safely commit changes
param(
    [Parameter(Mandatory=$true)]
    [string]$CommitMessage
)

# Get current branch
$currentBranch = git rev-parse --abbrev-ref HEAD
Write-Host "Current branch: $currentBranch" -ForegroundColor Cyan

# Check if there are any changes to commit
$status = git status --porcelain
if ($status) {
    Write-Host "Changes detected. Staging changes..." -ForegroundColor Yellow
    git add .
    
    # Commit changes with the provided message
    Write-Host "Committing changes with message: '$CommitMessage'" -ForegroundColor Yellow
    git commit -m "$CommitMessage"
    
    Write-Host "Changes successfully committed!" -ForegroundColor Green
    Write-Host "Use 3_push.ps1 to push these changes to the remote repository." -ForegroundColor Cyan
} else {
    Write-Host "No changes detected. Nothing to commit." -ForegroundColor Magenta
}
