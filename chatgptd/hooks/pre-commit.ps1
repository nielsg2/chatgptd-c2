#!/usr/bin/env pwsh
# Pre-commit hook to scan for secrets

$patterns = @(
    'sk-[a-zA-Z0-9]{32,}',       # OpenAI API keys
    'AIza[0-9A-Za-z-_]{35}',     # Google API keys
    'ghp_[A-Za-z0-9_]{36}',      # GitHub tokens
    '-----BEGIN PRIVATE KEY-----' # PEM files
)

$staged = git diff --cached --name-only
$abort = $false

foreach ($file in $staged) {
    if (Test-Path $file) {
        $content = Get-Content $file -Raw
        foreach ($pattern in $patterns) {
            if ($content -match $pattern) {
                Write-Host "🚫 Potential secret found in $file matching pattern: $pattern"
                $abort = $true
            }
        }
    }
}

if ($abort) {
    Write-Error "❌ Commit blocked: secrets detected."
    exit 1
} else {
    Write-Host "✅ Pre-commit scan passed."
}
