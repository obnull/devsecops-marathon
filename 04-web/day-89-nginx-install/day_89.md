# Stage 01: Linux & Web Servers, SSL & Security Headers
## Day 89: Nginx Install & Basic Config

## Objective

Install Nginx, run and checked working and learning base configurations.

## Environment

Ubuntu 24.04, Oh My Zsh

Nginx 1.24.0

## Description

A first day work with web-server. In official repo ubuntu isntall, check service status, first run and return default page.
First change - port change with 80 by 8088.

## What Was Done

- installed nginx
- checked service status
- nginx added to startup
- open default page in browser
- observed structure
- changed port (80/8088)
- checked syntax
- verified work on new port

## Commands Used

- `sudo apt update && sudo apt install nginx -y`
- `sudo systemctl status nginx`
- `sudo systemctl enable nginx`
- `sudo systemctl reload nginx`
- `sudo nginx -t`
- `sudo nano /etc/nginx/sites-available/default`

## Verification

- `sudo systemctl status nginx` = running
- `curl http://localhost:8088` return html a basic page
- default page open on browser with new port

## Key Concept

A structure Nginx configuration. Main config `/etc/nginx/nginx.conf` inside which connected files with `sites-enabled/*`
Sites created on `sites-available` and connected to `sites-enabled` with symlink. This approach allows faster enabled or disabled sites without deleted files.

## Takeaways

1. Nginx after install with autorunned and ready to working.
2. Before reload - ever `nginx -t`
3. Symlinks - mechanism of on/off sites
4. `reload` applies changes without stopped server.