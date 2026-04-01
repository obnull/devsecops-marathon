# Stage 01: Linux & Networking Fundamentals
## Day 49: UFW Allow Rules

## Objective

Implement a deny-by-default firewall policy and explicitly allow required network access.

## Environment

Ubuntu 24.04 LTS host with OpenSSH running on custom port (3301).

## Description

Configured UFW firewall to enforce network access control. Focused on allowing only essential service (SSH) while blocking all other incoming connections.

## What Was Done

- analyzed required network access (SSH only)
- enabled UFW firewall with default deny policy
- explicitly allowed SSH on custom port (3301)
- ensured IPv6 rules are applied
- validated active firewall configuration

## Commands Used

`ufw status`
`ufw allow 3301`
`ufw enable`

## Verification

- firewall status shows active
- only port 3301 is allowed
- all other incoming connections are denied
- SSH access remains functional after enabling firewall

## Key Concept

Deny-by-default — all traffic is blocked unless explicitly allowed.

## Takeaways

- firewall must be configured before exposure, not after
- allowing incorrect port (e.g. default SSH 22) can lead to loss of access
- explicit rules provide better control over network access
- minimal exposure significantly reduces attack surface
