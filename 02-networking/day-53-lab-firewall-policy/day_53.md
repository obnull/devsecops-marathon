# Stage 01: Linux & Networking Fundamentals
# Day 53 — [LAB] Secure Firewall Policy for Linux Host

## Objective

Implement production-grade firewall policy with rate limiting and default deny.

## Environment

Ubuntu 24.04 LTS, UFW, SSH on port 3301.

## Description

Configured UFW from scratch: default deny incoming, rate limiting for SSH, logging enabled. Verified rules with iptables.

## What Was Done

- Reset UFW to clean state
- Set default policies: deny incoming, allow outgoing, deny routed
- Added rate limiting for SSH port 3301 from local subnet
- Enabled logging (medium level)
- Activated UFW
- Inspected iptables output to understand rate limiting mechanism

## Commands Used

`sudo ufw reset`
`sudo ufw limit from 192.168.0.0/24 to any port 3301 proto tcp`
`sudo ufw enable`
`sudo ufw status verbose`
`sudo iptables -L -n -v | grep -A 10 -B 2 3301`

## Verification

- UFW active, default deny incoming
- SSH port 3301 accepts only from 192.168.0.0/24
- Rate limiting active: 6 attempts per 30 seconds

## Issues Encountered

None. All commands executed successfully.

## Key Concept

Rate limiting uses kernel-level "recent" module to track connection attempts per IP. After 6 hits in 30 seconds, packets go to ufw-user-limit chain and get rejected with logging.

## Takeaways

- UFW limit command is one-line protection against brute force
- Default deny incoming is the foundation of secure firewall policy
- iptables shows what UFW does under the hood