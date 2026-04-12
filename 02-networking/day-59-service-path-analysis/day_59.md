# Stage 01: Linux & Network Fundamentals
## Day 59:DNS → HTTP → Firewall: Full Request Path

## Objective

Understand the complete path of an HTTP request from browser to server: DNS resolution, TCP connection, TLS handshake, HTTP request/response. Learn to diagnose problems at each layer.

## Environment

Ubuntu 24.04 LTS, curl, dig, nc, openssl.

## Description

Traced the full request flow for google.com using curl -v -L. Analyzed each step: DNS resolution (multiple IPs), TCP connection to port 443, TLS handshake (TLSv1.3), HTTP/2 request, 301 redirect, final 200 OK. Simulated failures at each layer: DNS (nonexistent domain), TCP (closed port), TLS (self-signed certificate), HTTP (404).

## What Was Done

- Ran full diagnostic: curl -v -L https://google.com
- Broke down output: DNS → TCP → TLS → HTTP request → HTTP response
- Compared HTTP (port 80) vs HTTPS (port 443) behavior
- Simulated layer failures and identified error messages
- Measured timing: DNS lookup, TCP connect, TLS handshake, TTFB, total
- Created diagnostic cheat sheet for each layer

## Commands Used

`curl -v -L https://google.com 2>&1 | tee diagnose.log`
`dig google.com +short`
`nc -zv google.com 443`
`curl -I https://google.com/not-exist`
`curl -w "DNS: %{time_namelookup}s\nTCP: %{time_connect}s\nTLS: %{time_appconnect}s\nTTFB: %{time_starttransfer}s\nTotal: %{time_total}s\n" -o /dev/null -s https://google.com`

## Verification

- DNS returns multiple IPs for load balancing
- HTTPS uses port 443, HTTP uses port 80
- TLS handshake shown by "SSL connection using TLSv1.3"
- HTTP/2 used by default with modern curl
- 301 redirect: google.com → www.google.com
- Each layer has distinct error messages

## Issues Encountered

Initially used curl -v -L google.com (without https://), which connected to port 80 (HTTP) instead of 443 (HTTPS). No TLS handshake visible. Fixed by adding https:// prefix.

## Key Concept

Each request layer can fail independently. DNS failure = "could not resolve host". TCP failure = "connection refused". TLS failure = "SSL certificate problem". HTTP failure = 4xx/5xx status codes. Always diagnose from bottom up: DNS → TCP → TLS → HTTP.

## Takeaways

- Always use https:// for secure connections
- curl -v shows every step: resolve, connect, TLS, request, response
- Multiple IPs in DNS = load balancing / redundancy
- TLSv1.3 is current standard (faster, more secure)
- 301 redirects are permanent, browsers cache them
- Timing breakdown helps find bottlenecks: slow DNS, slow TLS, slow backend