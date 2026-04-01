# Stage 01: Linux & Networking Fundamentals
## Day 48: Firewall Basics

## Objective

Understand firewall behavior and analyze current network exposure before applying restrictions.

## Environment

Ubuntu 24.04 LTS host with OpenSSH (port 3301).

## Description

Analyzed active network services and evaluated system exposure prior to enabling firewall protection. Focused on identifying unnecessary services and reducing attack surface.

## What Was Done

- inspected open ports and listening services (`ss -tulpn`)
- identified externally accessible services
- detected unnecessary services:

  - nginx (port 80)
  - avahi (mDNS, port 5353)
- stopped and removed unnecessary services
- validated that only required service (SSH on port 3301) remains exposed

## Commands Used

`ss -tulpn`
`systemctl stop nginx`
`systemctl disable nginx`

## Verification

- confirmed that port 80 is no longer listening
- confirmed removal of avahi service
- verified that only SSH (3301) is exposed externally

## Key Concept

Attack surface reduction — minimizing the number of exposed services before applying firewall rules.

## Takeaways

- open ports directly define system exposure
- unnecessary services increase attack surface
- service-level hardening must be done before firewall configuration
