# Slim Dockerfile for Railway (Web UI only)
FROM oven/bun:1.2-slim

RUN apt-get update && apt-get install -y git curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install OpenCode
RUN bun install -g opencode-ai

WORKDIR /app

# Copy your project (Railway will clone Git repo)
COPY . .

# Install OMO on first run (or bake it in)
# Keep these flags in sync with install.sh and install.ps1
RUN bunx oh-my-openagent install --no-tui --gemini=yes --opencode-zen=no || true

EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD curl -f http://localhost:8080/api/health || exit 1

# Use environment variables set in Railway dashboard
CMD ["opencode", "serve", "--port", "8080", "--hostname", "0.0.0.0"]
