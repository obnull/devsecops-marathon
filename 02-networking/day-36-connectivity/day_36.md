# Stage 01: Linux & Networking Fundamentals
## Day 36: Connectivity Diagnostics

## Objective

Learn how to diagnose network connectivity issues using basic tools and understand the difference between network, DNS, and routing problems.

## Environment

Linux (Ubuntu), Wi-Fi interface.

## Description

Learned how test connect step by step: local system, gateway, external IP and domain.

## What Was Done

- tested loopback connectivity (127.0.0.1)
- tested gateway connectivity (192.168.1.1)
- tested external IP connectivity (8.8.8.8)
- tested domain connectivity (google.com)
- used traceroute to analyze path
- checked DNS configuration
- checked hostname and local resolution

## Command Used

`ping`
`traceroute`
`resolvectl status`
`cat /etc/resolv.conf`
`hostname`

## Verification

- confirmed loopback work
- confirmed gateway reachable (0% loss)
- confirmed external IP reachable
- confirmed domain resolves and reachable
- saw traceroute path to google.com
- saw "***" in traceroute to vk.com
- confirmed DNS server (192.168.1.1)
- confirmed hostname mapping (127.0.0.1)

## Key Concept

Connectivity should checked step by step.

Loopback -> gateway -> external IP -> domain.

If IP works but domain not - DNS problem
If IP not work - network or routing problem

Traceroute shown '***' when path of hops to ignore diagnostic packets.

Local resolver (127.0.0.53) forwards DNS queries.

## Takeaways

- ping checks connectivity
- traceroute shown path
- DNS resolves names to IP
- network issues must be checked by layers
- '***' in traceroute is normal sometimes
- DNS can go through router even with VPN