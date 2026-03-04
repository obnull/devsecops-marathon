# Stage 01: Linux & Git Basics
# Day 23 — systemd & Service Management

**Description:**
Understand how Linux services are managed with systemd and how service lifecycle works.

### 1. systemd Overview

- Identified the first system process (PID 1)
- Confirmed that modern Linux systems use **systemd** as the init system
- systemd manages services, dependencies, and system startup

Command used:

ps -p 1 -o pid,comm,cmd

Result:
PID 1 is systemd (started through /sbin/init).

---

### 2. Listing Services

Explored currently active services with:

systemctl list-units --type=service

Observed service states such as:

- active (running)
- active (exited)

This command shows only currently loaded units.

---

### 3. Service Status

Checked detailed information about a service:

systemctl status ssh

Important fields:

- Loaded — service configuration loaded
- Active — current state
- Main PID — main process ID

---

### 4. Service Lifecycle

Learned how to control services:

Start service:
systemctl start ssh

Stop service:
systemctl stop ssh

Restart service:
systemctl restart ssh

Reload configuration:
systemctl reload ssh

Difference:
Restart fully stops and starts a service, while reload only reloads configuration.

---

### 5. Autostart Configuration

Checked service autostart status:

systemctl is-enabled ssh

Result:
enabled

Meaning the service starts automatically during system boot.

Commands learned:

Enable service:
systemctl enable ssh

Disable service:
systemctl disable ssh

---

### 6. Unit Files

Listed all available service unit files:

systemctl list-unit-files --type=service

Observed service states:

- enabled
- disabled
- static

---

### 7. Service Dependencies

Explored dependencies of a service:

systemctl list-dependencies ssh

Observed that services depend on multiple targets such as:

- network.target
- basic.target
- system.slice

This demonstrates how systemd manages service startup order.

---

### 8. systemd Configuration Reload

Learned about reloading systemd configuration:

systemctl daemon-reload

Used after modifying or creating new service unit files.

---

## 🔐 Security Lens

Key observations:

- systemctl provides controlled service management
- services should be stopped using systemctl rather than kill
- systemd sends SIGTERM before forcing SIGKILL
- minimizing enabled services reduces attack surface

---

## 📌 Final Takeaway

systemd is the core service manager in modern Linux systems.

Understanding service lifecycle and management is essential for system administration, DevOps, and DevSecOps workflows.