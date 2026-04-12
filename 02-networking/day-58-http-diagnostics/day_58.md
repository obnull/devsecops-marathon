# Stage 01: Linux & Networkong Fundamentals
## Day 58 — HTTP Diagnostics and Status Codes

## Objective

Learn HTTP status code families, diagnose website performance with curl, and understand redirect chains and caching.

## Environment

Ubuntu 24.04 LTS, curl.

## Description

Explored HTTP status codes (2xx, 3xx, 4xx, 5xx) and their meaning for DevOps. Practiced curl diagnostics: extracting status codes, following redirects, measuring timing breakdown (DNS, TCP, TLS, TTFB). Simulated different error scenarios using httpbin.org.

## What Was Done

- Extracted only status code with curl -s -o /dev/null -w
- Followed redirect chains with curl -L -I
- Measured timing breakdown (DNS lookup, TCP connect, TLS handshake, TTFB, total)
- Simulated status codes: 200, 301, 404, 429, 500, 502
- Checked Cache-Control headers for caching behavior
- Compared performance of ya.ru vs google.com

## Commands Used

`curl -s -o /dev/null -w "%{http_code}\n" https://google.com`
`curl -L -I http://github.com`
`curl -w "@curl-format.txt" -o /dev/null -s https://google.com`
`curl -I https://httpbin.org/status/404`
`curl -I https://httpbin.org/status/502`
`curl -I https://google.com | grep -i "cache-control"`

## Verification

- 404 returns on non-existent pages
- 301 redirects include Location header
- 401 = unauthenticated, 403 = authenticated but forbidden
- 304 indicates cached resource (not modified)
- 502 = proxy/backend issue, 500 = application issue
- TTFB shows backend processing time

## Issues Encountered

None. All commands executed successfully.

## Key Concept

Status codes tell you who is responsible: 4xx = client mistake, 5xx = server/infrastructure problem. curl timing breakdown helps locate bottlenecks: slow DNS = resolver issue, slow TTFB = backend problem.

## Takeaways

- Always check status code first when debugging
- 401 vs 403: 401 means "login first", 403 means "logged in but no access"
- 502 = check backend health, 504 = check timeout settings
- TTFB (Time To First Byte) is critical performance metric
- Cache-Control with max-age=0 means don't cache
- Use curl timing to find where latency comes from