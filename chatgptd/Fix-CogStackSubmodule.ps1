# ====================================================
# Script: Fix-CogStackSubmodule.ps1
# Purpose: Remove Git submodule link and embed as flat folder under chatgptd
# Author: Niels Goldstein (nielsg2)
# License: MIT License
# Version: v0.2.1
# ====================================================

$repoRoot = "$env:USERPROFILE\OneDrive\Code\chatgptd"

# Go to repo root
Set-Location $repoRoot

# Step 1: Unstage the submodule pointer
git rm --cached cognition/CogStack

# Step 2: Delete the embedded .git folder that caused submodule mode
Remove-Item -Recurse -Force "$repoRoot\cognition\CogStack\.git"

# Step 3: Re-add the folder as regular content
git add cognition/CogStack

# Step 4: Commit and re-tag v0.2.0
git commit -m "🧠 FIXED: Embedded CogStack as flat folder, removed submodule link"
git tag -f v0.2.0
git push origin main --tags --force

Write-Host "✅ CogStack is now embedded properly and v0.2.0 has been corrected."