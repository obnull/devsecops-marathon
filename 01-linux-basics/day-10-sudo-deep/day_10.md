# Stage 01: Linux & Git Basics
## Day 10: Sudoers & Privillege Escalation

**Description:**

Explored sudoers file syntax and privilege escalation. Configured precise sudo rules, command restrictions, and group-based permissions. Analyzed logs and clean-up.

**What was done:**

- Added user `devops` and checked default sudo access.

- Configured exact command permissions (`/bin/systemctl restart nginx`)

- Rescricted specific command (`/bin/kill`) using `!`

- Created `webadmins` group and granted group-based sudo rules

- Enabled passwordless sudo for allowed commands (`NOPASSWD`)

- Understood `ALL=(ALL)` syntax and order sensitivity in sudoers

- Reviewed sudo logs in (`/var/logs/auth.log`)

- Removed test user and group

### Result

Understood how to grant least-privilege sudo access and why `NOPASSWD: ALL` is dangerous
