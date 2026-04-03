# Stage 01: Linux & Networking Fundamentals
## Day 51: Firewall Verification & Logs

## Objective

Verify firewall rules, analyze logs, and confirm actual network exposure.

## Environment

Ubuntu 24.04 LTS with UFW enabled and SSH running on custom port 3301.

## Description

Performed validation of firewall configuration by comparing UFW rules with actual network behavior. Analyzed firewall logs to understand incoming traffic patterns and verify that unauthorized access is blocked.

## What Was Done

- checked firewall status and active rules
- verified default policies (incoming deny)
- compared listening ports with firewall rules
- confirmed SSH access only from local subnet
- inspected UFW logs for blocked traffic
- identified multicast traffic (mDNS and all-hosts)
- analyzed source and destination IP addresses
- verified that blocked traffic is limited to local network noise

## Commands Used

`ufw status numbered`
`ss -tulpn`
`journalctl -k`
`tail -f /var/log/ufw.log`

## Verification

- firewall is active and enforcing rules
- SSH access only from 192.168.0.0/24
- no unintended open ports detected
- external access is blocked
- multicast traffic is blocked and logged
- no signs of suspicious or malicious activity

## Issues Encountered

- distinguishing between normal network traffic and potential threats
- interpreting multicast addresses and firewall log structure

## Key Concept

Firewall validation requires observing real traffic and logs, not just reviewing configuration.

## Takeaways

- firewall logs provide visibility into actual network behavior
- multicast traffic is normal in local networks
- default deny policy blocks both malicious and benign traffic
- verification must include external perspective, not only local checks
- understanding packet flow is essential for accurate security assessment