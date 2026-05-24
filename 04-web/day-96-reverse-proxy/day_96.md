# Stage 01: Linux & Web Servers, SSL & Security Headers
## Day 96: Reverse Proxy Concept

## Objective
Understand what a reverse proxy is, why it is needed, and how Nginx acts as an intermediary between clients and backend applications.

## Environment
- OS: Ubuntu 24.04, Oh My Zsh
- Web Server: Nginx 1.24.0

## Description
Learned the concept of a reverse proxy and implemented a simple proxy setup. Created a mock backend on port 5000 and configured a frontend site (`proxy.local`) to forward requests to it via `proxy_pass`. Proved through logs that the client communicates with Nginx, and Nginx communicates with the backend.

## What Was Done
- Created a mock backend server block listening on port 5000
- Created a frontend site (`proxy.local`) on port 8000
- Configured `proxy_pass http://127.0.0.1:5000;` to forward requests
- Added `proxy.local` to `/etc/hosts`
- Verified both direct backend access and proxied access return the same content
- Added separate logs for the backend to trace the full request chain
- Confirmed the client never directly connects to the backend port

## Commands Used
- `sudo tee /etc/nginx/sites-available/backend`
- `sudo ln -s /etc/nginx/sites-available/backend /etc/nginx/sites-enabled/`
- `sudo tee /etc/nginx/sites-available/proxy`
- `sudo ln -s /etc/nginx/sites-available/proxy /etc/nginx/sites-enabled/`
- `sudo nginx -t`
- `sudo systemctl reload nginx`
- `curl http://127.0.0.1:5000/`
- `curl -H "Host: proxy.local" http://127.0.0.1:8000/`
- `sudo tail -f /var/log/nginx/access.log`
- `sudo tail -f /var/log/nginx/backend_access.log`

## Verification
- Direct backend: `curl http://127.0.0.1:5000/` returned "Hello from BACKEND"
- Via proxy: `curl -H "Host: proxy.local" http://127.0.0.1:8000/` returned the same
- Backend access log showed requests coming from `127.0.0.1` (Nginx, not the real client)
- `sudo nginx -t` passed without errors

## Issues Encountered
1. **404 or wrong site returned** — Nginx served the default site instead of the proxy. Fixed by ensuring the `proxy` site was enabled in `sites-enabled` and `server_name` matched the `Host` header.
2. **Syntax error: unexpected "}"** — caused by a stray backslash before `;` in `proxy_pass`. Fixed by removing the backslash.

## Key Concept
**Reverse Proxy.** A reverse proxy sits between clients and backend servers. Clients connect to the proxy, and the proxy forwards requests to one or more backends. Benefits: hiding backend infrastructure, load balancing, SSL termination, caching, and compression. The key directive is `proxy_pass`, which tells Nginx where to forward requests.

## Takeaways
1. A reverse proxy hides backend servers from clients — the client only sees Nginx.
2. `proxy_pass` is the core directive for proxying requests.
3. Backends see the proxy's IP, not the client's — this will be fixed with `proxy_set_header`.
4. Always test both direct backend access and proxied access to isolate issues.
5. Separate log files for each component make debugging the full request chain easier.