# Stage 01: Linux & Git Basics
## Day 24: Logging & Observability with Linux

**Description:**
Learn how Linux systems store logs and how to analyze system behavior using logging tools.

**What was done:**

### 1. systemd Journal
Explored the system logging mechanism provided by systemd

Command used: `journalctl`

This command shows the full system journal including system services, kernel messages, and user sessions.

To exit the journal viewer: `q`

### 2. Viewing Recent Logs
Displayed the most recent entries:

`journalctl -n 20`

This command helps quickly identify the latest system events.

### 3. Logs of Current Boot
Displayed logs from the current system boot:

`journalctl -b`

Useful for debugging issues after system startup

### 4. Filtering Errors
Filtered logs by priority level:

`journalctl -p err`

This shown only error-level messages, allowing faster troubleshooting

### 5. Service-Specific Logs
Examined logs for a specific service:

`journalctl -u NetworkManager`

This allowed tracing the lifecycle of the network connection.

Observed Sequence:
- authentication
- association
- WPA handshake
- DHCP IP assignment
- network activation

The system successfully connected to the WI-FI network.

### 6. Kernel Logs
Viewed kernel messages using:

`sudo dmesg | tail -n 20`

Kernel logs revealed:
- Wi-Fi authtentication and assotiation events
- reconnection attempts
- AppArmor security policy enforcement
- system journal rotation

**Security Lens:**

Observed AppArmor security enforcement:

`apparmor=DENIED`

This indicates that a process attempted to access a restricted resourse and was blocked by the security policy.

Linux Security Modules (LSM) such as AppArmor help enforce security boundaries vetween processes.

**Key Observations:**

Not every error in system logs indicated a critical failure.

Effective troubleshooting requires:
- identifying the responsible service
- understanding system context
- verifying the final system state

## Final Takeaway:
Linux observability relies heavily on system logs

Core logging tools include:
- `journalctl` - system service logs
- `dmesg` - kernel messages
- `/var/log` - traditional log files

Understanding how to read logs is essential for system administration, DevOps and DevSecOps troubleshooting
