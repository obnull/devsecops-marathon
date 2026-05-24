# Stage 01: Linux & Web Servers, SSL & Security Headers
## Day 98: proxy_set_header

## Objective
Configure Nginx to forward the real client IP and other original request data to the backend application via HTTP headers.

## Environment
- OS: Ubuntu 24.04, Oh My Zsh
- Web Server: Nginx 1.24.0
- Application: Python 3.12, Flask 3.1

## Description
Fixed the issue discovered on Day 97: Flask was seeing Nginx as the client (`127.0.0.1`) instead of the real client IP. Added `proxy_set_header` directives to the Nginx configuration to forward `X-Real-IP`, `X-Forwarded-For`, `X-Forwarded-Proto`, and `Host` headers. Updated the Flask application to display these headers, confirming the real client data reaches the backend.

## What Was Done
- Added `proxy_set_header X-Real-IP $remote_addr;` to Nginx config
- Added `proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;`
- Added `proxy_set_header X-Forwarded-Proto $scheme;`
- Added `proxy_set_header Host $host;`
- Updated Flask `app.py` to read and display the new headers
- Verified that `X-Real-IP` and `X-Forwarded-For` appear in the response
- Fixed syntax errors: backslash before `;` and `X-Real_IP` (underscore instead of hyphen)
- Confirmed `direct_ip` still shows `127.0.0.1` (correct — it's the proxy's connection)

## Commands Used
- `sudo nano /etc/nginx/sites-available/proxy.local`
- `sudo nginx -t`
- `sudo systemctl reload nginx`
- `curl http://proxy.local:8000/`
- `curl http://proxy.local:8000/api`

## Verification
- `curl http://proxy.local:8000/api` returned:
  - `"direct_ip": "127.0.0.1"` — Flask sees Nginx
  - `"x_real_ip": "127.0.0.1"` — real client IP forwarded (127.0.0.1 because local test)
  - `"x_forwarded_for": "127.0.0.1"` — proxy chain
- HTML page showed all three values correctly
- `sudo nginx -t` passed without errors

## Issues Encountered
1. **`X-Real-IP` was `not set`** — config had `X-Real_IP` (underscore) instead of `X-Real-IP` (hyphen). HTTP headers use hyphens. Fixed by correcting the header name.
2. **Config had `proxy.local,` with a comma** — `server_name` should separate domains with spaces, not commas. Fixed by removing the comma.
3. **Stray backslash in `proxy_pass`** — `http://flask_backend\;` caused a syntax error. Fixed by removing the backslash.

## Key Concept
**Proxy headers.** When Nginx proxies a request, it creates a new connection to the backend. The backend sees Nginx as the client. To preserve the original client information, Nginx must forward it via HTTP headers:
- `X-Real-IP` — the client's IP address (`$remote_addr`)
- `X-Forwarded-For` — the full chain of IPs the request passed through
- `X-Forwarded-Proto` — the original protocol (http or https)
- `Host` — the original Host header from the client

These headers are the industry standard for preserving client identity behind proxies.

## Takeaways
1. Always set `proxy_set_header` when configuring a reverse proxy — it's required for logging, security, and analytics.
2. Header names use hyphens, not underscores: `X-Real-IP`, not `X-Real_IP`.
3. `$remote_addr` is the IP that connected to Nginx.
4. `$proxy_add_x_forwarded_for` appends to the existing chain, preserving upstream proxies.
5. Flask's `request.remote_addr` will always show the proxy's IP — that's expected.