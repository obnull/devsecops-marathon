# Stage 01: Linux & Git Basics
## Day 25: Linux Networking & Port Inspect

**Description:**

Learn how Linux services expose nertwork ports and how to inspect active network sockets using system networking tools

**What was done:**

### 1. Inspecting Listening Port
Explored active listening services using the `ss` command

Command used: `ss -tulpn`

This command displays:
- listening ports
- associated proccesses
- PID of service using sockets

It provides a real-time overview of servicers that are reachable through the network.

### 2. Filtering Specific Ports
Filtered the output to identify services using a specific port.

Command used: `ss -tulpn | grep :80`

This helped identify the web server listening to port 80

Observed result:
nginx wan bound to port 80.

### 3. IPv4 vs IPv6 Listening
Observed that services may listen on multiple network stacks.

Typical adresses:

`0.0.0.0:80` - This means the service listens on all IPv4 interfaces.

`[::]:80` - This means the service listens on all IPv6 interfaces.

This configuration allows the service to accept connections from any network interface.

### 4. Process Verification
Verified the running service processes.

Command used: `ps aux | grep nginx`

Observed architecture:
- nginx master process running as root
- nginx worker processes running as www-data

This confirms the standart nginx master-worker model.

### 5. Web Root Inspection
Inspected the web server document root.

Command used: `ls -la /var/www/html`

Observed that the directory is owned by root and readable by nginx workers

This prevents the web server from modifying its own content

### 6. Port Ownership Valodation
Confirmed which service holds port 80

Command used: `ss -tulpn`

Result confirmed nginx master process owns the listeting socket while worker processes handle requests

**Security Lens:**

Every listening network port increases the system attack surfase.

Important security practices include:
- exposing only required ports
- auditing listening services regularly
- restricting unnecessary network exposure
- running services with least privilege

The nginx configuration demonstration a common security model:
the master process runs as root to open privoleged ports, while worker processes run under a restricted user (`www-data`)

Understanding wghich services listen on network ports is essential for troubleshooting and system security analysis

## Final Takeaway
Linux networking observability depends on understanding active sockets and service exposure.

Core inspection tools include:
- `ss` - socket and port inspection
- `ps` - process verification
- service configuration files - defining listening behavior

Network visibility is critical for system administration, DevOps and DevSecOps operation.
