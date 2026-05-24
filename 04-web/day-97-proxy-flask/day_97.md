# Stage 01: Linux & Web Servers, SSL & Security Headers
## Day 97: Proxy to Flask Application

## Objective
Configure Nginx as a reverse proxy to a real Python Flask application. Understand how Nginx and application servers work together in a production-like setup.

## Environment
- OS: Ubuntu 24.04, Oh My Zsh
- Web Server: Nginx 1.24.0
- Application: Python 3.12, Flask 3.1
- Tools: curl, systemctl, python3-venv

## Description
Wrote a simple Flask application with two routes (`/` and `/api`), running on port 5000. Configured Nginx to proxy requests from `proxy.local:8000` to Flask on `127.0.0.1:5000`. Set up a Python virtual environment (venv) and installed Flask inside it. Verified that the client sees Nginx, while Flask sees Nginx as the client.

## What Was Done
- Installed `python3-venv` and created a virtual environment
- Installed Flask inside the venv
- Wrote `app.py` with routes `/` (HTML) and `/api` (JSON)
- Started Flask on `127.0.0.1:5000` (not exposed externally)
- Updated Nginx config with `proxy_pass http://127.0.0.1:5000;`
- Added separate access and error logs for the proxy
- Verified responses through curl and browser
- Observed that Flask sees `127.0.0.1` as the client (Nginx, not the real user)

## Commands Used
- `sudo apt install python3-venv python3-full -y`
- `python3 -m venv venv`
- `source venv/bin/activate`
- `pip install flask`
- `python3 app.py`
- `sudo tee /etc/nginx/sites-available/proxy.local`
- `sudo nginx -t`
- `sudo systemctl reload nginx`
- `curl http://proxy.local:8000/`
- `curl http://proxy.local:8000/api`

## Verification
- `curl http://127.0.0.1:5000/` returned Flask HTML directly
- `curl http://127.0.0.1:5000/api` returned JSON directly
- `curl http://proxy.local:8000/` returned the same HTML through Nginx
- `curl http://proxy.local:8000/api` returned the same JSON through Nginx
- JSON response showed `"client_ip": "127.0.0.1"` — proving the proxy hides the real client

## Issues Encountered
1. **`pip install flask` failed** — `externally-managed-environment` error. Fixed by creating and activating a virtual environment (venv).
2. **`proxy.local` not resolving** — domain was missing from `/etc/hosts`. Fixed by adding `127.0.0.1 proxy.local www.proxy.local`.
3. **Browser could not open the site on WSL** — `/etc/hosts` in WSL differs from Windows. Fixed by adding the WSL IP to the Windows hosts file.

## Key Concept
**Nginx + Application Server pattern.** Application servers (Flask, Django, Node.js) typically listen on internal ports and are not designed for direct Internet exposure. Nginx acts as a reverse proxy: it handles client connections, serves static files, and forwards dynamic requests to the application. Flask sees Nginx as the client because Nginx creates a new connection to Flask. To pass the real client IP, `proxy_set_header` directives are needed.

## Takeaways
1. Application servers should bind to `127.0.0.1`, not `0.0.0.0` — security best practice.
2. A virtual environment (venv) isolates Python packages per project.
3. Nginx logs and application logs both need to be checked when debugging.
4. Flask's `request.remote_addr` shows the proxy's IP unless headers are forwarded.
5. The proxy pattern is the foundation for load balancing, SSL termination, and microservices.