# Stage 01: Linux & Git Basics
## Day 12: SSH Hardening

**Description:**

Hardened SSH server by applying security best practices: disabled root login, switched to key-based authentication, changed default port, restricted users and added a warning banner.

**What was done:**

- Installed and enabled OpenSSH-server

- Disabled root login (`PermitRootLogin no`)

- Disabled password authentication (`PasswordAuthentication no`)

- Changed SSH port

- Restricted access to user `danny` only (`AllowUsers`)

- Changed and copied SSH-key for passwordless login

- Added a security banner (`/etc/ssh/banner`)

- Tested connection with `ssh -p **** danny@localhost`

- Verified that password login is no longer possible

- Backed up original config and reloaded SSH

- Connected from Windows laptop via SSH using key authentication

- Fixed key permissions and successfully logged in remotely

### Result

SSH is now configured securely: no root, no passwords, only key auth, custom port, user whitelish and a legal warning banner. Remote access from other devices works with key-based authentication.
