# Stage 01: Linux & Git Basics
## Day 38: DNS Basics

## Objective

Understand how DNS resolution works and learn how to inspect DNS records using system tools.

## Environment

Linux (Ubuntu).

## Description

Studied how domain names resolved to IP addresses and how DNS queries work practice. Focused to analyzing DNS responses and identified record types.

## What Was Done

- inspect DNS resolution process using `dig`
- inspected A records and multiple IP addresses for a domain
- checked DNS responses from different resolvers (Google DNS, Cloudflare DNS)
- analyzed SOA record to identify authoritative DNS provider
- verified absense/presense of CNAME recorde
- compared DNS responses and query time

## Commands Used

`dig example.com`
`dig example.com A`
`dig example.com CNAME`
`dig example.com MX`
`dig example.com @8.8.8.8`
`dig example.com @1.1.1.1`
`cat /etc/resolv.conf`

## Verification

- confirmed domain resolves to multiple IP addresses
- confirmed DNS responses are consistent across different resolvers
- confirmed domain uses Cloudflare authoritative DNS (SOA record)
- confirmed to CNAME record for root domain
- observed low TTL indicating dynamic DNS updates

## Key Concept

DNS resolves domain names to IP addresses.

A record maps domain -> IPv4
CNAME creates alias -> another domain
MX defines mail servers

SOA record defines authoritative DNS server.

DNS resolution chain:
client -> resolver -> authoritative DNS -> response

## Takeaways

- DNS is the first step to network connection
- multiple IPs indicate load balancing or CDN usage
- Cloudflare acts as reverse proxy and hides origin server
- DNS misconfiguration can expose infrastructure
- security depends on restricting access to origin server