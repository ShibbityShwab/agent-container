#!/bin/bash
set -e

echo "=== OpenCode + Oh-My-OpenAgent Lean Installer ==="
echo "Installing for Linux / macOS / Git Bash..."

# Install Bun if missing
if ! command -v bun &> /dev/null; then
    echo "Installing Bun..."
    curl -fsSL https://bun.sh/install | bash
    export PATH="$HOME/.bun/bin:$PATH"
fi

echo "Installing OpenCode globally..."
bun install -g opencode-ai

echo "Installing Oh-My-OpenAgent..."
# Keep these flags in sync with install.ps1 and Dockerfile
bunx oh-my-openagent install --no-tui --claude=no --gemini=yes --copilot=no --opencode-zen=no || true

echo "Pulling latest code and state..."
git pull --rebase || true

echo ""
echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "1. cp .env.example .env"
echo "2. Edit .env with your API keys"
echo "3. Run: opencode web"
echo ""
echo "For background autostart on Arch: see systemd/opencode.service"
