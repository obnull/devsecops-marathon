# Stage 01: Linux & Web Servers, SSL & Security Headers
## Day 94: [LAB] Static Website on Nginx

## Objective
Independently deploy a static website from scratch, applying all skills from the week: virtual hosts, file structure, permissions, logs, and testing.

## Environment
- OS: Ubuntu 24.04, Oh My Zsh
- Web Server: Nginx 1.24.0
- Tools: curl, nano, systemctl, chmod, chown

## Description
Deployed a third website (`lab.local`) completely from scratch, without ready-made commands. Created the folder structure, wrote HTML/CSS/SVG files, configured a virtual host with separate logs, enabled the site, and verified functionality. Applied debugging skills when issues arose.

## What Was Done
- Created folder structure: `/var/www/lab.local/{css,images}`
- Copied and adapted HTML, CSS, and SVG files from `site1.local`
- Modified content: cybersecurity theme, green accent color
- Created Nginx config in `sites-available/lab.local`
- Configured `server_name lab.local www.lab.local`, `root`, `index`
- Set up separate access and error logs for the lab site
- Enabled the site with a symlink in `sites-enabled`
- Added `lab.local` to `/etc/hosts`
- Tested configuration syntax and reloaded Nginx
- Verified the site responded correctly via curl and browser
- Fixed log file paths that were copied incorrectly from `site1.local`

## Commands Used

- `sudo mkdir -p /var/www/lab.local/{css,images}`
- `sudo cp -r /var/www/site1.local/* /var/www/lab.local/`
- `sudo nano /etc/nginx/sites-available/lab.local`
- `sudo ln -s /etc/nginx/sites-available/lab.local /etc/nginx/sites-enabled/`
- `sudo nginx -t`
- `sudo systemctl reload nginx`
- `echo "127.0.0.1 lab.local www.lab.local" | sudo tee -a /etc/hosts`
- `curl -H "Host: lab.local" http://127.0.0.1:8000/`
- `sudo chown -R www-data:www-data /var/www/lab.local/`
- `sudo chmod -R 755 /var/www/lab.local/`
- `sudo tail -f /var/log/nginx/lab_access.log`


## Verification
- `sudo nginx -t` — syntax ok, test successful
- `curl -I -H "Host: lab.local" http://127.0.0.1:8000/` returned `HTTP/1.1 200 OK`
- The site opened in the browser at `http://lab.local:8000/`
- CSS loaded correctly (dark theme, green accents)
- SVG logo displayed in the header
- Separate log files (`lab_access.log`, `lab_error.log`) were created and populated

## Issues Encountered
1. **Log files were not created** — the config still had old paths from `site1.local` (`site1.local.access.log`). Fixed by updating `access_log` and `error_log` directives to `lab_access.log` and `lab_error.log`.
2. **Site returned wrong content** — initially showed the blue blog instead of the lab site. Fixed by correcting `server_name` and ensuring the symlink was in place.

## Key Concept
**Independent deployment workflow.** The lab reinforced the complete site deployment cycle: create directory structure → write/adapt content → write Nginx config → enable site → test config → reload → verify. This cycle is the foundation of web server administration. The ability to copy an existing configuration and adapt it for a new purpose is a core DevOps skill — reusability over rewriting.

## Takeaways
1. Always check log file paths when copying configs from another site.
2. A clear folder structure makes site management predictable.
3. Separate logs per site make debugging significantly easier.
4. The deployment cycle becomes automatic with practice.
5. Adapting existing configs is faster and less error-prone than writing from scratch.