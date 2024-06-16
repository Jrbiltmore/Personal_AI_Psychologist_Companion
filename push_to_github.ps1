# Check if Git is installed
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Git is not installed. Please install Git to use this script."
    exit 1
}

# Navigate to the project directory
$projectDir = "ai_companion"
Set-Location -Path $projectDir

# Initialize a Git repository if it does not exist
if (-not (Test-Path -Path ".git")) {
    git init
    Write-Host "Initialized a new Git repository."
}

# Add all files to the Git repository
git add .
Write-Host "Added all files to the Git repository."

# Commit the changes
$commitMessage = "Initial commit"
git commit -m $commitMessage
Write-Host "Committed the changes with message: '$commitMessage'."

# Add the remote repository
$remoteUrl = "https://github.com/jrbiltmore/Personal_AI_Psychologist_Companion.git"
git remote add origin $remoteUrl

# Push the changes to the remote repository
git push -u origin main
Write-Host "Pushed the changes to GitHub."

# Open the project in VS Code
code .
Write-Host "Opened the project in VS Code."
