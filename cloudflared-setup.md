# Cloudflare Tunnel Setup (Free & Lean Remote Access)

This replaces Tailscale for exposing your local `opencode web` to your phone.

## One-time Setup (on your laptop/desktop)

1. Install cloudflared:
   - Linux: `sudo pacman -S cloudflared` (Arch) or download from Cloudflare
   - Windows: Download from https://github.com/cloudflare/cloudflared/releases

2. Login:
   ```bash
   cloudflared tunnel login
   ```

3. Create a tunnel:
   ```bash
   cloudflared tunnel create opencode-grind
   ```

4. Route a domain (use a free Cloudflare domain or your own):
   ```bash
   cloudflared tunnel route dns <your-tunnel-id> grind.yourdomain.com
   ```

5. Run the tunnel (pointing to your local port):
   ```bash
   cloudflared tunnel run opencode-grind --url http://localhost:4096
   ```

Now access from your phone at: `https://grind.yourdomain.com`

You can run this in the background with `systemd` or Task Scheduler.

**Advantages over Tailscale**:
- No client needed on phone
- Free HTTPS
- Very lightweight

For the simplest possible experience, just deploy the `Dockerfile` to Railway instead.
