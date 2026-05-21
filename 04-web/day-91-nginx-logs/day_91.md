# Stage 01: Linux & Web Servers, SSL & Security Headers
## Day 91: Access & Error Logs

## Objective

Learning read, filter and use Nginx logs for debug and monitoring.

## Environment

Ubuntu 24.04, Oh My Zsh
Nginx 1.24.0

## Description

Configured individual access and error logs for each site. Learned looking logs in real-time, analyzed suspicious requests and filter data by IP, answer code and User-Agent.

## What Was Done

- Verified, logs been created in real-time on one request
- Studied an access log structure: IP, time, method, URL, answer code, size, referer, User-Agent
- Learned monitoring logs in real-time
- Generate test-traffic (ordinary requests, 404, imitation vulnerability scanner)
- Mastered filtration: grep by answer code, grep by User-Agent
- Counted quantity requests and grouped by IP
- Learned read error log and understand error level

## Commands Used

- `sudo tail -f`
- `curl -H`
- `grep`

## Verification

- `ls -la /var/log/nginx/` showed separate files for everyone site.
- `tail -f` on real time monitoring for new requests
- `grep " 404 "` finds only 404 error requests
- `awk | sort | uniq -c` showed to IP statistics

## Issues Encountered

1. Logs don't created for new site - wasn't enough permissions for recording on `/var/log/nginx`.
Fixed: `sudo chmod 755 /var/log/nginx`

## Key Concept

A Nginx access log structure (combined format): 

`IP - - [time] "METHOD URL PROTOCOL" CODE SIZE "REFERER" "USER-AGENT"`
Every request - one string. Knowing the structure, can faster find suspicious active.

A error log levels:

`debug`, `info`, `notice`, `warn`, `error`, `crit`, `alert`, `emerg`. In production usually use `warn` or `error`.

## Takeaways

1. Logs - main debug tool
2. Always separate logs by site - easier find a problems.
3. `tail -f` - best friend for real-time debug
4. `grep`, `awk`, `sort`, `uniq` - basic tools for logs analize
5. Suspicious URL with logs - occasion security check