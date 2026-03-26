# Stage 01: Linux & Networking Fundamentals
## Day 43: SSH Hardening

## Objective

Apply SSH hardening to reduce attack surface and restrict authentication methods.

## Environment

Linux (Ubuntu) host with SSH on custom port.

## Description

Hardened SSH configuration by disabled weak authentication methods, restricted access and limiting connection behavior.

## What Was Done

- disabled password authentication
- disabled root login
- enforced key-based authentication
- limited authentication attempts
- restricted numner of sessions
- disabled forwarding (TCP, agent, X11)
- configured user allow-list

## Commands Used

`sshd -T`
`grep`
`cat /etc/sshd/sshd_config`

## Verification

- password auth: disabled
- root login: disabled
- pubkey auth: enabled
- forwarding: disabled
- access limited to specific user

## Issues Encountered

- duplicated parameters in config
- need to verify effective runtime config

## Key Concept

Security = minimize attack surface and restricting access path.

## Takeaways

- SSH must be tightly controlled
- disable all unused features
- always verify effective config
- access control is as important as authentication
