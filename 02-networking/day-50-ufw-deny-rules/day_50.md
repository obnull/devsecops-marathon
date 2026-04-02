# Stage 01: Linux & Networking Fundamentals
## Day 50: UFW Hardening

## Objective

Restrict SSH access and reduce attack surface.

## Environment

Ubuntu 24.04 LTS with SSH on port 3301.

## Description

Hardened firewall rules and removed unnecessary services. Investigated systemd behavior when services auto-restart after reboot.

## What Was Done

- checked open ports with `ss`
- identified unnecessary services (`avahi`, `cups`)
- stopped and disabled services
- discovered auto-start after reboot
- applied `mask` to fully disable services
- restricted SSH access to local subnet
- removed global SSH access

## Commands Used

`ss -tulpn`
`systemctl stop/disable/mask`
`ufw status numbered`
`ufw allow from 192.168.0.0/24 to any port 3301`

## Verification

- SSH available with local only
- externally connections is blocked
- services is dont start after reboot

## Issues Encountered

- services restarted after reboot despite disable
- required deeper understanding of systemd activation

## Key Concept

Minimize attack surface: remove services + restrict access.

## Takeaways

- disable is not enough → use mask
- firewall rules must be specific
- avoid “allow anywhere”
