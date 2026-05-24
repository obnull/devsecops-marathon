# Stage 01: Linux & Web Servers, SSL & Security Headers
## Day 99: Load Balancing with Upstream

## Objective
Configure Nginx to distribute requests across multiple backend instances using the `upstream` directive. Understand round-robin load balancing and its role in horizontal scaling.

## Environment
- OS: Ubuntu 24.04, Oh My Zsh
- Web Server: Nginx 1.24.0
- Application: Python 3.12, Flask 3.1 (two instances)

## Description
Launched two Flask instances on ports 5001 and 5002. Defined an `upstream` group in Nginx pointing to both instances. Updated the `proxy_pass` directive to use the upstream group instead of a single IP. Verified that requests alternate between instances (round-robin). Each instance reports its port number in the response, making the distribution visible.

## What Was Done
- Created a shared Flask app that accepts a port number as a command-line argument
- Launched Flask instance 1 on port 5001
- Launched Flask instance 2 on port 5002
- Defined `upstream flask_backend` with both servers in Nginx config
- Changed `proxy_pass` from `http://127.0.0.1:5000;` to `http://flask_backend;`
- Reloaded Nginx and tested multiple requests
- Confirmed responses alternate between `5001` and `5002`

## Commands Used
- `python3 app.py 5001`
- `python3 app.py 5002`
- `sudo nano /etc/nginx/sites-available/proxy.local`
- `sudo nginx -t`
- `sudo systemctl reload nginx`
- `curl http://proxy.local:8000/api`
- `curl http://proxy.local:8000/api`

## Verification
- First `curl http://proxy.local:8000/api` returned `"instance": "5001"`
- Second `curl http://proxy.local:8000/api` returned `"instance": "5002"`
- Third request returned `5001` again — round-robin confirmed
- HTML page at `/` also showed the instance port
- `sudo nginx -t` passed without errors

## Issues Encountered
1. **502 Bad Gateway** — Flask instances were not running. Fixed by restarting both Flask processes.
2. **Syntax error in `proxy_pass`** — stray backslash `\;` caused config test to fail. Fixed by removing the backslash.

## Key Concept
**Upstream and load balancing.** The `upstream` directive defines a group of backend servers. Nginx distributes incoming requests among them. The default method is round-robin — each request goes to the next server in the list. Other methods include `least_conn` (least connections), `ip_hash` (client IP affinity), and weighted distribution with `weight=N`. If a backend server becomes unresponsive, Nginx will stop sending traffic to it (passive health check). Load balancing enables horizontal scaling: instead of making one server more powerful, add more instances.

## Takeaways
1. `upstream` groups are defined outside `server {}` blocks.
2. `proxy_pass` uses the upstream name instead of an IP address.
3. Round-robin is the default and works well for stateless applications.
4. Each backend instance should report its identity — makes debugging and monitoring easier.
5. Load balancing is the foundation of high availability and fault tolerance.