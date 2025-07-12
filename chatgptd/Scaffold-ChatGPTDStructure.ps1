# ====================================================
# Script: Scaffold-ChatGPTDStructure.ps1
# Purpose: Initialize chatgptd modular repo structure with Git and subdirectories
# Author: Niels Goldstein (nielsg2)
# License: MIT License
# Version: v0.1.0
# ====================================================

param (
    [string]$BasePath = "$env:USERPROFILE\OneDrive\Code\chatgptd"
)

# Ensure the base path exists
if (!(Test-Path $BasePath)) {
    New-Item -ItemType Directory -Path $BasePath -Force
}

# Define all subdirectories to create
$folders = @(
    "daemon",
    "ai_bridge",
    "local_agent",
    "memory",
    "tasks",
    "ui",
    "api_gateway",
    "logs",
    "filebot",
    "shared",
    "docs"
)

# Create each folder
foreach ($folder in $folders) {
    $fullPath = Join-Path $BasePath $folder
    if (!(Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
    }
}

# Initialize Git if not already initialized
if (!(Test-Path (Join-Path $BasePath ".git"))) {
    Set-Location $BasePath
    git init
    git remote add origin https://github.com/nielsg2/chatgptd
    git config user.name "Niels Goldstein"
    git config user.email "nielsgoldstein@users.noreply.github.com"
}

# Copy global Git hygiene template if available
$gitTemplatePath = "$env:USERPROFILE\OneDrive\Code\Utilsrepo\Git_Template"
if (Test-Path $gitTemplatePath) {
    Copy-Item -Path "$gitTemplatePath\*" -Destination $BasePath -Recurse -Force
}

# Create a README stub
$readme = @"
# chatgptd

Modular AI orchestration daemon built for local memory, secure file handling, and persistent ChatGPT interaction. Part of the MurkyCloud ecosystem.

This repo adheres to the Vibe architecture: composable, memory-aware, and privacy-first.

"@
Set-Content -Path (Join-Path $BasePath "README.md") -Value $readme -Encoding UTF8

Write-Host "✅ chatgptd structure initialized at $BasePath"