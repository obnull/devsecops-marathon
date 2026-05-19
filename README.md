# 🛡️ Road to DevSecOps Middle (2026-2028)

Welcome to my journey! This repository is a 24-month intensive training log where I transform from zero to a Middle DevSecOps Engineer. All materials, configs, and labs are centralized in this `devsecops-marathon` mono-repo.

## 🎯 Current Goal
- **Phase:** 1 (Linux, Networking, Automation & Web Security)
- **Status:** Month 4 - Web Servers, SSL & Security Headers 🚀
- **Target Certs:** CKS (Certified Kubernetes Security Specialist) & CDP.

---

## 📊 Progress Tracker

| Stage | Focus Area | Status | Period | Folder |
| :--- | :--- | :--- | :--- | :--- |
| **01** | **Linux, Networking, Automation & Web** | 🟢 Active | Month 1-4 | `/01-linux-basics`, `/02-networking`, `/03-bash`, `/04-web` |
| **02** | **Containers & CI/CD Security** | ⚪ Pending | Month 5-8 | `/07-docker-expert` |
| **03** | **Kubernetes & Cloud Native** | ⚪ Pending | Month 9-14 | `/13-k8s-security` |
| **04** | **Advanced DevSecOps** | ⚪ Pending | Month 15-24 | `/19-advanced-sec` |

---

# 🌐 Month 4: Web Servers, SSL & Security Headers

Focus of this month:
- Installing and configuring Nginx web server
- Serving static sites and managing logs
- Setting up reverse proxy and load balancing
- Securing traffic with SSL/TLS (Let's Encrypt)
- Hardening web applications with security headers

---

## 📅 Week 1: Nginx Basics & Static Sites

- [x] **Day 89:** Installing Nginx, basic configuration  
  📁 `/04-web/day-89-nginx-install`

- [x] **Day 90:** server_name, root, index directives  
  📁 `/04-web/day-90-nginx-config`

- [x] **Day 91:** Access and error log handling  
  📁 `/04-web/day-91-nginx-logs`

- [x] **Day 92:** Serving static HTML sites  
  📁 `/04-web/day-92-static-site`

- [x] **Day 93:** Graceful reload, restart, config testing  
  📁 `/04-web/day-93-nginx-reload`

- [x] **Day 94:** **[LAB] Static website on Nginx**  
  📁 `/04-web/day-94-lab-static-site`

---

## 🔄 Week 2: Reverse Proxy & Load Balancing

- [x] **Day 96:** Reverse proxy concept and use cases  
  📁 `/04-web/day-96-reverse-proxy`

- [x] **Day 97:** Proxying to a Python (Flask) application  
  📁 `/04-web/day-97-proxy-flask`

- [ ] **Day 98:** proxy_set_header (Host, X-Real-IP)  
  📁 `/04-web/day-98-proxy-headers`

- [ ] **Day 99:** Load balancing with upstream  
  📁 `/04-web/day-99-load-balancing`

- [ ] **Day 100:** Redirects and rewrite rules  
  📁 `/04-web/day-100-redirects`

- [ ] **Day 101:** **[LAB] Reverse proxy for a containerized app**  
  📁 `/04-web/day-101-lab-reverse-proxy`

---

## 🔒 Week 3: SSL/TLS (HTTPS)

- [ ] **Day 103:** TLS handshake and certificate basics  
  📁 `/04-web/day-103-tls-basics`

- [ ] **Day 104:** Installing Certbot, issuing Let's Encrypt certificate  
  📁 `/04-web/day-104-certbot-issue`

- [ ] **Day 105:** Enabling HTTPS in Nginx (port 443, ssl_certificate)  
  📁 `/04-web/day-105-nginx-https`

- [ ] **Day 106:** Automated certificate renewal (cron / systemd timer)  
  📁 `/04-web/day-106-cert-renewal`

- [ ] **Day 107:** SSL security testing (testssl.sh, SSL Labs)  
  📁 `/04-web/day-107-ssl-test`

- [ ] **Day 108:** **[LAB] Full HTTPS app with static + reverse proxy**  
  📁 `/04-web/day-108-lab-ssl-site`

---

## 🛡️ Week 4: HTTP Security Headers

- [ ] **Day 110:** X-Frame-Options, X-Content-Type-Options  
  📁 `/04-web/day-110-security-headers-1`

- [ ] **Day 111:** Strict-Transport-Security (HSTS)  
  📁 `/04-web/day-111-hsts`

- [ ] **Day 112:** Content-Security-Policy (CSP) basics  
  📁 `/04-web/day-112-csp-basics`

- [ ] **Day 113:** Referrer-Policy and Permissions-Policy  
  📁 `/04-web/day-113-referrer-policy`

- [ ] **Day 114:** Limiting HTTP methods and request body size  
  📁 `/04-web/day-114-method-limit`

- [ ] **Day 115:** **[FINAL PROJECT] Static + Reverse Proxy + SSL + Security Headers**  
  📁 `/04-web/day-115-final-lab-secure-website`

---

## 📈 Streak Calendar
![My GitHub Stats](https://github-readme-stats.vercel.app/api?username=obnull)

---

## 📁 Repository Structure

- `/01-linux-basics` — OS fundamentals, permissions, processes  
- `/02-networking` — Network diagnostics, SSH hardening, firewalls  
- `/03-bash` — Bash scripting, automation, log analysis, security monitoring  
- `/04-web` — Nginx, reverse proxy, SSL/TLS, security headers  
- `/07-docker-expert` — Containerization and image hardening  
- `/13-k8s-security` — Kubernetes security practices  
- `/19-advanced-sec` — Advanced DevSecOps tools and projects  

---

## 🗄️ Archive

Historical snapshots of monthly progress:

* Month 01 — Linux Basics (Completed ✅)  
* Month 02 — Networking & Hardening (Completed ✅)  
* Month 03 — Bash Scripting & Automation (Completed ✅)  
* Month 04 — Web Servers, SSL & Security Headers (Active 🚀)
