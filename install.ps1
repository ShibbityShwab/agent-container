# OpenCode + Oh-My-OpenAgent Lean Installer for Windows (PowerShell)
Write-Host "=== OpenCode + Oh-My-OpenAgent Lean Installer (Windows) ===" -ForegroundColor Cyan

# Check for Bun
if (-not (Get-Command bun -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Bun..." -ForegroundColor Yellow
    irm bun.sh/install.ps1 | iex
    $env:Path = "$env:USERPROFILE\.bun\bin;$env:Path"
}

Write-Host "Installing OpenCode globally..." -ForegroundColor Green
bun install -g opencode-ai

Write-Host "Installing Oh-My-OpenAgent..." -ForegroundColor Green
# Keep these flags in sync with install.sh and Dockerfile
try {
    bunx oh-my-openagent install --no-tui --claude=no --gemini=yes --copilot=no --opencode-zen=no
} catch {
    Write-Host "Warning: Oh-My-OpenAgent install step failed. Continuing..." -ForegroundColor Yellow
}

Write-Host "Pulling latest code and state..." -ForegroundColor Green
try {
    git pull --rebase
} catch {
    Write-Host "Warning: git pull failed (dirty tree or no remote). Continuing..." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "✅ Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Copy .env.example to .env and fill in your keys"
Write-Host "2. Run: opencode web"
Write-Host ""
Write-Host "For autostart on Windows, use Task Scheduler (see README.md)"
