# Stage 01: Linux & Networking Fundamentals
## Day 41: SSH Architecture & Hardening

## Objective

Analyze SSH configuration and assess security of remote access.

## Environment

Linux (Ubuntu) host with SSH on custom port.

## Description

Deviewed SSH service exposure and validated effective configuration. Focused on authentication methods and access restrictions.

## What Was Done

- checked listening ports and interfaces (`ss`, `sudo ss`)
- confirmed SSH process (`sshd`)
- analyzed `sshd_config`
- verified effective settings with `sshd -T`
- identified config overrides
- evaluated exposure and access control

## Commands Used

`ss -tulpn`
`sudo ss -tulpn`
`sshd -T`
`grep`

## Verification

- SSH port is 3301
- bound to 0.0.0.0 / [::]
- password auth: disabled
- root login: disabled
- pubkey auth: enabled
- forvarding: disabled (effective config)

## Issues Encountered

- limited visibility without root
- mismatch between config file and runtime settings

## Key Concept

Runtime config > static config
Security = authentication + access control

## Takeaways

- SSH is a critical attack vector
- key-based auth reduced risk
- always verify effective config
- exposure depends on network and binding
- restrict post-auth capabilities