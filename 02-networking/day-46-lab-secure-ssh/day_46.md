# Stage 01: Linux & Networking Basics
## Day 46 — Secure SSH Configuration (LAB)

## Objective

Build a hardened SSH configuration by combining authentication, access control, and connection restrictions into a secure and consistent profile.

## Environment

Ubuntu 24.04 LTS host with OpenSSH server running on custom port (3301).

## Description

Extended previous SSH hardening work by consolidating all security controls into a single configuration. Focused on enforcing strict authentication, minimizing attack surface, and validating secure access behavior through testing and log analysis.

## What Was Done

- enforced key-based authentication only (password and interactive methods disabled)
- explicitly restricted access to a single user (`AllowUsers danny`)
- disabled root login
- reduced authentication attempts (`MaxAuthTries 1`)
- minimized login window (`LoginGraceTime 30s`)
- limited concurrent sessions (`MaxSessions 1`)
- disabled unnecessary features:
  - TCP forwarding
  - agent forwarding
  - X11 forwarding
- configured custom SSH port (3301)
- added login banner
- reviewed and cleaned duplicated parameters in configuration

## Commands Used

`nano /etc/ssh/sshd_config`
`systemctl restart ssh`
`sshd -T`
`ssh -v danny@localhost -p 3301`
`journalctl -u ssh -n 20 --no-pager`
`tail -f /var/log/auth.log`

## Verification

Performed controlled access tests:

- login without key → rejected
- login with invalid user → rejected
- root login → rejected
- wrong key → rejected
- valid user with correct key → successful login

Log analysis confirmed:

- invalid users are rejected before authentication
- authentication attempts are limited (`MaxAuthTries`)
- only public key authentication is accepted
- successful login occurs only for allowed user

## Issues Encountered

- risk of complete lockout when no valid authentication method is available
- duplicated parameters in configuration file
- need to validate effective runtime configuration (`sshd -T`) instead of relying only on static config

## Key Concept

Secure SSH configuration requires combining:

- --Authentication-- — verifying identity (public key)
- --Authorization-- — controlling access (`AllowUsers`)
- --Exposure reduction-- — limiting features and connection behavior

Misconfiguration in any of these areas can result in either security gaps or loss of access.

## Takeaways

- SSH must be hardened across multiple layers, not just authentication
- restricting users significantly reduces attack surface
- reducing authentication attempts limits brute-force behavior
- logs are critical for validating real system behavior
- runtime configuration may differ from static configuration
- improper changes can lead to complete loss of remote access
