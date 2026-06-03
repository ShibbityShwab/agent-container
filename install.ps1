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
bunx oh-my-openagent install --no-tui --gemini=yes --opencode-zen=no

Write-Host "Pulling latest code and state..." -ForegroundColor Green
git pull --rebase

Write-Host ""
Write-Host "✅ Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Copy .env.example to .env and fill in your keys"
Write-Host "2. Run: opencode web"
Write-Host ""
Write-Host "For autostart on Windows, use Task Scheduler (see README.md)"
