# OpenCode + Oh-My-OpenAgent — Lean Cross-Platform Setup (June 2026)

**Goal**: Most modern, lean, KISS, DRY setup for autonomous MMO-style coding grinds using **cloud free tiers + OpenCode Go**.  
No heavy local models required. Works great even on modest hardware.

**Core Principles**
- Git = single source of truth (code + `.omo/` agent state)
- One `.env` for all API keys
- Native Bun installs (no Docker on personal machines)
- `opencode web` as the single interface
- Cloud-first models (Gemini, Groq, OpenRouter, OpenCode Go)
- Phone = browser only
- Minimal background processes

## Quick Start

### 1. Clone the repo
```bash
git clone <your-repo-url> my-ai-grind-project
cd my-ai-grind-project
```

### 2. Install (one command)
**Linux / macOS / Git Bash**:
```bash
chmod +x install.sh
./install.sh
```

**Windows (PowerShell)**:
```powershell
.\install.ps1
```

### 3. Configure keys
```bash
cp .env.example .env
# Edit .env and add your keys (Groq, Google Gemini, OpenRouter, OpenCode Go, etc.)
```

### 4. Start the grind
```bash
# One-time: pull latest + start
git pull
opencode web
```

Or use the background service (see below).

### 5. Access from Phone
**Option A (Recommended)**: Use Cloudflare Tunnel (see `cloudflared-setup.md`)

**Option B**: Deploy the `Dockerfile` to Railway → access the public Railway URL from your phone browser.

## Key Files

- `opencode.json` — Base config (cloud-first)
- `oh-my-openagent.jsonc` — Multi-agent orchestration + cascading fallbacks (lean cloud version)
- `.env` — All your API keys (never commit real keys)
- `systemd/opencode.service` — Autostart on Arch Linux with env vars loaded

## Model Strategy (Cloud Only)

Primary models used in the configs:
- Quick tasks: `google/gemini-3-flash` or Groq fast models
- Deep planning / complex work: `google/gemini-3.1-pro` or `openrouter/deepseek-v4-pro`
- Best value upgrade: `opencode-go/qwen3.7-max` or `opencode-go/kimi-k2.6` (after subscribing to OpenCode Go)

Fallback chains are already configured in `oh-my-openagent.jsonc`.

## Background / Autostart

**Arch Linux**:
```bash
systemctl --user enable --now opencode
```

**Windows**: Use Task Scheduler pointing to a small wrapper that loads `.env` and runs `opencode serve`.

## Phone Workflow

1. Open browser
2. Go to your Cloudflare Tunnel URL **or** Railway public URL
3. Full web interface works great on mobile

No Termux or local models needed for the main grind.

## Updating

```bash
git pull
# Re-run install.sh if OMO/OpenCode updated
```

## Philosophy

- KISS: One interface, one way to run, cloud models
- DRY: Everything in Git, one `.env`
- Lean: Native where possible, minimal background daemons
- Future-proof: Easy to add OpenCode Go later

Enjoy the grind. Build real things without the paywall.

---

**Created**: June 2026 — Optimized after critical review for maximum leanness and modernity.
