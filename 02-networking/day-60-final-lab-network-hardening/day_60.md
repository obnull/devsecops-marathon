# Stage 01: Linux & Networking Fundamentals
## Day 60: [FINAL LAB] Network Exposure and Hardening Audit

## Objective

Conduct a full network security audit of the host: open ports, listening services, firewall rules, DNS configuration, SSH hardening. Produce a report with findings and recommendations.

## Environment

Ubuntu 24.04 LTS, UFW, SSH on port 3301, systemd-resolved.

## Description

Performed comprehensive network audit on local machine. Analyzed network interfaces, routing table, open ports (TCP/UDP/Unix sockets), firewall status, DNS configuration, HTTP/HTTPS connectivity, and SSH security settings. Compiled findings into structured report with risk assessment and hardening recommendations.

## What Was Done

- Network interfaces and routing audit (ip addr, ip route)
- Open ports inventory (ss -tulnp, ss -xlp)
- Firewall policy review (ufw status verbose, iptables)
- DNS configuration check (/etc/resolv.conf, dig)
- HTTP/HTTPS diagnostics (curl -I -L)
- External exposure analysis (0.0.0.0 listeners)
- SSH hardening verification (sshd_config grep)
- Final audit report compilation

## Commands Used

ip addr show
ip route show
sudo ss -tulnp
sudo ss -xlp
sudo ufw status verbose
cat /etc/resolv.conf
dig google.com +short
curl -I -L https://google.com
sudo grep -E "Port|PermitRootLogin|PasswordAuthentication|AllowUsers|MaxAuthTries" /etc/ssh/sshd_config

## Verification

- Only port 3301 (SSH) open on external interfaces
- UFW active with default deny incoming
- SSH rate limiting active from 192.168.0.0/24 subnet
- DNS uses systemd-resolved stub (127.0.0.53)
- SSH hardened: non-standard port, keys only, root disabled, AllowUsers set

## Issues Encountered

None. All audit commands executed successfully.

## Key Concept

Network exposure audit = inventory everything that listens + understand who can reach it + verify access controls. Default deny + specific allow + rate limiting = defense in depth.

## Takeaways

- ss -tulnp shows all listening ports with process names
- 0.0.0.0 means accessible from any interface (including network)
- 127.0.0.1 means localhost only (safe)
- UFW default deny incoming is foundation of host firewall
- Rate limiting protects against brute force without breaking legit access
- Regular audits help catch accidental exposure (e.g., forgotten debug services)