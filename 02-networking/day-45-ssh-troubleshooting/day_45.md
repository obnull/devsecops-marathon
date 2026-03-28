# Day 45 — SSH Troubleshooting & Logs

## Objective

Understand how to diagnose SSH connection issues using client-side and server-side debugging tools.

## Environment

Ubuntu 24.04 LTS host with OpenSSH server running on a custom port (3301).
Key-based authentication enabled, password authentication disabled.

## Description

Analyzed SSH authentication flow using verbose client output (`ssh -v`) and server logs (`journalctl`, `auth.log`).
Investigated both failed and successful authentication scenarios to understand how SSH handles invalid users, authentication attempts, and key-based access.

## What Was Done

- inspected SSH logs using `journalctl -u ssh`
- identified failed login attempts for invalid user
- analyzed authentication failure due to exceeding max attempts
- executed SSH connection with verbose mode (`ssh -v`)
- traced full authentication flow from connection to successful login
- confirmed that only `publickey` authentication is allowed
- verified that `id_ed25519` key is used and accepted by server
- matched client behavior with server-side logs

## Commands Used

- `ssh -v danny@localhost -p 3301`
- `journalctl -u ssh -n 20 --no-pager`
- `tail -f /var/log/auth.log`
- `systemctl status ssh`

## Verification

- SSH service is active and listening on port 3301
- connection to localhost established successfully
- server allows only `publickey` authentication
- client offers `id_ed25519` key
- server accepts the key from `authorized_keys`
- successful login confirmed
- invalid user attempts detected and rejected in logs

## Issues Encountered

- attempted login with non-existent user (`dann`)
- authentication attempts exceeded limit (`MaxAuthTries`)
- initial confusion between authentication and authorization errors

## Key Concept

SSH troubleshooting requires analyzing both client-side behavior (`ssh -v`) and server-side logs.
Authentication success depends on correct key matching and server-side authorization rules.

## Takeaways

- `ssh -v` shows what the client is doing during connection
- `journalctl` and `auth.log` explain why the server accepts or rejects access
- `Invalid user` indicates user does not exist
- `publickey` authentication requires matching key in `authorized_keys`
- SSH authentication flow includes connection, key exchange, authentication, and authorization
- disabling password authentication enforces stronger security model
