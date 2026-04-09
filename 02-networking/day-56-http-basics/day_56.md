# Day 56 — HTTP Methods and Headers

## Objective

Understand HTTP methods (GET, POST, HEAD), headers (Content-Type, Accept, Host), and status codes.

## Environment

Ubuntu 24.04 LTS, curl.

## Description

Explored HTTP protocol basics: methods, headers, status codes. Practiced curl commands to inspect real-world responses from google.com, github.com, yandex.ru, cloudflare.com, microsoft.com. Learned difference between idempotent and safe methods.

## What Was Done

- Compared GET vs POST idempotency
- Analyzed response headers (Server, Content-Type, Cache-Control)
- Checked redirects (301) for http://github.com
- Used HEAD method to inspect resources without body
- Modified User-Agent to bypass restrictions
- Simulated 4xx errors (404, 401, 403)
- Created servers comparison table

## Commands Used

curl -v https://google.com
curl -I https://github.com
curl -L -I http://github.com
curl -I -A "Mozilla/5.0" yandex.ru
curl -X POST -d "name=DevSecOps" https://httpbin.org/post
curl -H "Accept: application/json" https://httpbin.org/get

## Verification

- GET is idempotent and safe, POST is neither
- Accept header tells server desired response format
- 502 Bad Gateway indicates server-side (proxy/backend) issue
- HEAD returns headers only, useful for health checks
- Missing Host header causes 400 or default virtual host response

## Issues Encountered

Yandex returned captcha with default curl User-Agent. Fixed by setting -A "Mozilla/5.0".

## Key Concept

HTTP is stateless. Idempotent methods (GET, PUT, DELETE) can be repeated without changing outcome. Safe methods (GET, HEAD) do not modify server state. Host header is mandatory in HTTP/1.1 for virtual hosting.

## Takeaways

- Always check Cache-Control to understand caching behavior
- Server header reveals technology stack (or hides it for security)
- HEAD before GET for large files to check size and existence
- 502 is infrastructure problem, 500 is application problem
- Virtual hosts require Host header — without it, server doesn't know which site to serve