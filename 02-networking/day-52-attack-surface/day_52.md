# Stage 01: Linux & Networking Fundamentals
## Day 52: Attack Surface Analysis

## Objective

Analyze the server's attack surface by identifying listening services, firewall rules, and comparing actual exposure with allowed access.

## Environment

Ubuntu 24.04 LTS with UFW enabled, SSH running on custom port 3301.

## Description

Performed attack surface analysis by inventorying all listening network services, reviewing UFW firewall rules, comparing both to identify discrepancies, and understanding which services are actually reachable from the network.

## What Was Done

- Listed all listening TCP/UDP ports with process names
- Reviewed UFW firewall rules and default policies
- Compared listening services against firewall allowances
- Analyzed which services are exposed to the network vs localhost-only
- Documented attack surface findings

## Commands Used

`sudo ss -tulnp`
`sudo ufw status verbose`

## Verification

- SSH on port 3301 listens on 0.0.0.0 and :: (all interfaces)
- UFW allows port 3301 only from 192.168.0.0/24
- systemd-resolve listens on port 53 (TCP/UDP) but only on 127.0.0.54 and 127.0.0.53
- No other listening services detected
- Default UFW policy: deny incoming, allow outgoing

## Issues Encountered

None — analysis was straightforward.

## Key Concept

Attack surface consists of all network-accessible services. Services bound to 127.0.0.1 are not reachable from the network and therefore do not require firewall rules. Services bound to 0.0.0.0 are exposed and must be protected by firewall rules.

## Takeaways

- Only SSH port 3301 is part of the attack surface
- SSH access is properly restricted to local subnet
- Port 53 DNS resolver is localhost-only — no firewall rule needed
- Minimal attack surface: one port, one service, network-restricted
- Understanding the difference between binding address and firewall rules is critical for security assessment