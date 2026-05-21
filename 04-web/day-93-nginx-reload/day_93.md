# Stage 01: Linux & Web Servers, SSL & Security Headers
## Day 93: Nginx Reload, Restart & Config Test

## Objective
Learn safe Nginx configuration management: test syntax, graceful reload without connection loss, and understand the difference between reload and restart.

## Environment
- OS: Ubuntu 24.04, Oh My Zsh
- Web Server: Nginx 1.24.0

## Description
Studied three ways to apply Nginx configuration changes. Tested configuration syntax before applying. Learned the difference between `reload` (graceful, keeps connections) and `restart` (hard, drops all connections). Explored direct signals to the Nginx master process (`kill -HUP`).

## What Was Done
- Tested configuration syntax with `nginx -t`
- Deliberately broke the config and observed the error messages
- Fixed the broken config and verified syntax
- Applied changes with `systemctl reload nginx` (graceful)
- Simulated a slow connection and compared `reload` vs `restart` behavior
- Learned to find the master process PID (`/var/run/nginx.pid`)
- Sent signals directly to the process: `kill -HUP` for graceful reload

## Commands Used

- `sudo nginx -t`
- `sudo systemctl reload nginx`
- `sudo systemctl restart nginx`
- `sudo nginx -s reload`
- `sudo nginx -s stop`
- `sudo nginx -s quit`
- `cat /var/run/nginx.pid`
- `ps aux | grep "nginx: master"`


## Verification
- `sudo nginx -t` returned `syntax is ok` and `test is successful`
- Broken config produced a clear error message with file name and line number
- `systemctl reload nginx` applied changes without dropping connections
- `systemctl restart nginx` dropped active connections
- `kill -HUP` successfully triggered a configuration reload

## Issues Encountered
No issues. All commands worked as expected.

## Key Concept
**Graceful reload vs hard restart.** Nginx can reload its configuration without dropping active client connections. The `reload` command sends a `HUP` signal to the master process. The master opens new listening sockets with the new configuration, while old worker processes finish their current requests before shutting down. A `restart`, on the other hand, kills all processes immediately and starts fresh — dropping all connections. On production, always prefer `reload`.

The golden rule: `test` → `reload`. Never `restart` on production without a reason.

## Takeaways
1. Always run `nginx -t` before reloading or restarting.
2. Use `reload` for production — it keeps connections alive.
3. Use `restart` only when absolutely necessary.
4. `kill -HUP` is an alternative to `systemctl reload` when systemd is unavailable.
5. Nginx error messages during config test are precise: they show the file and line number.