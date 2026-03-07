# Stage 01: Linux & Git Basics
## Day 26 [LAB]: Secure Service Deployment

**Description:**

Deploy an HTTP service on bare Linux with maximum hardening:
- Run under a dedicated user without shell
- Isolate with systemd sandboxing
- Set up log rotation
- Verify that security measures actually work

**What was done:**

### 1. User
Created a system user `webapp` without login shell: 

`sudo useradd -r -s /usr/bin/nologin -m -d /opt/webapp webapp`

Verified with: `id webapp`, `grep webapp /etc/passwd`

### 2. Directories
- `sudo mkdir -p /opt/webapp/bin`
- `sudo mkdir -p /var/log/webapp`
- `sudo chown -R webapp:webapp /opt/webapp /var/log/webapp`
- `sudo chmod 750 /opt/webapp /opt/webapp/bin /var/log/webapp`

### 3. Service code
File `/opt/webapp/bin/app.py`:
- Python HTTP server listening on `127.0.0.1:8080`
- Logs to `/var/log/webapp`
- Owner `webapp:webapp`, permissions 750

### 4. Systemd unit
File`etc/systemd/system/webapp.service:`

[Unit]
Description=Secure Web App
After=network.target

[Service]
User=webapp
Group=webapp
WorkingDirectory=/opt/webapp/bin
ExecStart=/usr/bin/python3 /opt/webapp/bin/app.py
Restart=on-failure

# Security hardening
NoNewPrivileges=yes
PrivateTmp=yes
ProtectSystem=strict
ReadWritePaths=/var/log/webapp
PrivateDevices=yes
ProtectHome=yes

[Install]
WantedBy=multi-user.target

### 5. Longrotate
File /etc/logrotate.d/webapp:

/var/log/webapp/*.log {
    daily
    missingok
    rotate 7
    compress
    delaycompress
    notifempty
    create 640 webapp webapp
    sharedscripts
    postrotate
        systemctl reload webapp > /dev/null 2>&1 || true
    endscript
}

## Verification:

`sudo systemctl status webapp`
`curl http://127.0.0.1:8080`
`sudo journalctl -u webapp -f`
`ls -l /var/log/webapp`

## Security checks

# systemd isolation analysis
sudo systemd-analyze security webapp

# Attempt to write outside allowed paths
sudo -u webapp touch /etc/test
# Should fail with Permission denied

## Takeaways
- systemd is a powerful isolation tool but requires syntax attention
- logrotate is mandatory for services that write logs
- Even a simple service can be secured in 15–20 minutes
- Understanding file/directory permissions is critical for running under unprivileged users