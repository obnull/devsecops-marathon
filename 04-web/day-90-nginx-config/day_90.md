# Stage 01: Linux & Web Servers, SSL & Security Headers
## Day 90: server_name, root and index.

## Objective

Learned setting virtual hosts on one Nginx: different on one IP and port, separation with domain name.

## Environment

Ubuntu 24.04, Oh My Zsh
Nginx 1.24.0

## Description

Configured two different sites (`mysite.local` and `shop.local`) on one server. Use directives `server_name`, `root` and `index`.
Learned difference sites with HOST header, added local domains `/etc/hosts` and testing with `curl` to `-H` flag.

## Црфе Was Done 

- created 2 folders `/var/www/site1.local/` and `/var/www/site2.local/`
- writing index.html for all sites (blue blog and red shop)
- created configs on `sites-available`: `site1.local` and `site2.local`
- writing `server_name`, `root`, `index`, `access_log`, `error_log`
- sites enabled by symlinks
- default site disabled
- checked syntax (`nginx -t`) and run `reload`
- checked work with `curl -H` and browser
- fixed issue to code (added `<meta charset="UTF-8">`)

## Commands Used 

- `sudo mkdir -p /var/...`
- `sudo tee`
- `sudo rm`
- `sudo nano`
- `sudo ln -s`

## Verification

- `curl -H "Host: mysite.local" http://127.0.0.1:8000/` returned a blue site (blog)
- `curl -H "Host: shop.local" http://127.0.0.1:8000/` returned a red site (shop)
- `sudo nginx -t` syntax ok

## Issues Encountered

1. 404 to open without port
2. Sites no different - didn't turn it on symlinks in `sites-enabled`
3. Nginx didn't see server_name - `grep server_name` showed only general settings. Decided.

## Key Concept 

Virtual Hosts. One physical server can service tens sites. Nginx differenciates them by title `Host`, which browser send on all requests.
Directive `server_name` say: "If Host = `mysite.local`, servise this block `server {}`" Directive `root` indicates, where search files. Directive `index` sets file by default, if URL uncorrectly file.

## Takeaways

1. One nginx can service as much as you like sites in one IP and port.
2. Title `Host` - key mechanism separate sites.
3. Ever writing `charset`
4. Order is important (`nginx -t` -> `reload` - testing`)
5. Each site should have its own logs - it makes debugging easier