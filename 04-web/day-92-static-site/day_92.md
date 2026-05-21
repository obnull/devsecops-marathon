# Stage 01: Linux & Web Servers, SSL & Security Headers
## Day 92: Static Website Delivery

## Objective

Learning deploy a static site by Nginx: HTML, CSS, JavaScript, images. Understand how Nginx gives different type of files and how browser requests them.

## Environment

Ubuntu 24.04, Oh My Zhs
Nginx 1.24.0

## Description

Created a static site from scratch: semantic HTML page, cascade styles (CSS), posted files in trued structure of folders.
Configured Nginx for recoil and checked Content-Type headers for everyone type of resource.

## What Was Done

- Created folders structure: `css/`, `js/`, `images/`
- Writing `index.html` - with semantic layout (header, main, footer)
- Writing `style.css` - dark style, cards, button by hower-effect
- Writing `script.js` - interactive button with random quotes
- Created SVG-logo - pasted in a hat with `sed`
- Configured true permissions
- Confirmed recoil defferent MIME types with `curl -I`
- Confirmed correct chain requests with one page load

## Commands Used

- `sudo tail -f`
- `curl -I -H`
- `sudo chmod`
- `sudo chown`
- `sudo mkdir -p`

## Verification

- `http://mysite.local:8000` open in browser - full-fledged page with dark theme.
- CSS loaded correct
- JavaScript work is stable
- SVG logo shows in cup
- `curl -I` shows correct Content-Type

## Issues Encountered
 
1. 404 with open site - different port (80 vs 8000). Nginx listen 80, and request walked to 8000. Fixed config, all well done

## Key Concept

Recoiled static resources and MIME types. When browser loading HTML page, he's parsing she's content and finded links on external resources:
<link> for CSS, <script> for JS, <img> for images. For everyone resourse, browser sended a separate request, finded file on a root folder, defines MIME type on expansion through file 
`/etc/nginx/mime.types` and sended file with correct header `Content-Type`. Without it header, browser don't knowning, how process answer.

## Takeaways

1. Nginx automatically defined Content-Type
2. One page = many requests
3. Permissions on files must be `www-data:www-data` with `chmod 755`