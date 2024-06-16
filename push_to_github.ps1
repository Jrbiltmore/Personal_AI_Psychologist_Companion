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
    git init -b main
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
$remoteUrl = "git@github.com:Jrbiltmore/Personal_AI_Psychologist_Companion.git"
git remote add origin $remoteUrl

# Push the changes to the remote repository
git push -u origin main
Write-Host "Pushed the changes to GitHub."

# Open the project in VS Code if the `code` command is available
if (Get-Command code -ErrorAction SilentlyContinue) {
    code .
    Write-Host "Opened the project in VS Code."
}
else {
    Write-Host "VS Code command-line tools are not installed or not added to the PATH."
}
