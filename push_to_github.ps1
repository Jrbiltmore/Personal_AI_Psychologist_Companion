# Check if Git is installed
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git is not installed. Please install Git to use this script."
    exit 1
}

# Navigate to the project directory
$projectDir = "C:\Users\Shrew\Downloads\ai_companion_project_final"
Set-Location -Path $projectDir

# Initialize a Git repository if it does not exist
if (-not (Test-Path -Path ".git")) {
    git init
    git checkout -b main
    Write-Host "Initialized a new Git repository."
}
else {
    git checkout main
}

# Add all files to the Git repository
git add .
Write-Host "Added all files to the Git repository."

# Commit the changes
$commitMessage = "Initial commit"
git commit -m $commitMessage
Write-Host "Committed the changes with message: '$commitMessage'."

# Add the remote repository if it does not exist
$remoteUrl = "git@github.com:Jrbiltmore/Personal_AI_Psychologist_Companion.git"
$remoteName = "github"
if (-not (git remote | Select-String -Pattern $remoteName)) {
    git remote add origin $remoteUrl
    Write-Host "Added remote repository '$remoteName'."
}

# Push the changes to the remote repository
git push -u origin main
Write-Host "Pushed the changes to GitHub."
