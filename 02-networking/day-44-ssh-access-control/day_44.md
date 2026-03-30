# Stage 01: Linux & Networking Fundamentals
## Day 44 — SSH Access Control

## Objective

Implement SSH access control to restrict login permissions to specific users and reduce unauthorized access risk.

## Environment

Ubuntu Linux host with OpenSSH server running on a custom port.

## Description

Configured SSH access control mechanisms to explicitly allow only a designated user (`danny`) to connect via SSH. Verified that access restrictions are enforced at runtime and not just in configuration files.

## What Was Done

- configured user-based access control using `AllowUsers`
- restricted SSH access exclusively to user `danny`
- enforced strict login attempt limits
- verified effective SSH runtime configuration using `sshd -T`
- confirmed that only authorize# Day 44 — SSH Access Control

## Objective

Implement SSH access control to restrict login permissions to specific users and reduce unauthorized access risk.

## Environment

Ubuntu Linux host with OpenSSH server running on a custom port.

## Description

Configured SSH access control mechanisms to explicitly allow only a designated user (`danny`) to connect via SSH. Verified that access restrictions are enforced at runtime and not just in configuration files.

## What Was Done

- configured user-based access control using `AllowUsers`
- restricted SSH access exclusively to user `danny`
- enforced strict login attempt limits
- verified effective SSH runtime configuration using `sshd -T`
- confirmed that only authorized user can establish SSH session

## Commands Used

`sshd -T`
`grep`
`cat /etc/ssh/sshd_config`

## Verification

- `allowusers danny` is active in runtime config
- login for `danny` → successful
- login for other users → denied
- password authentication → disabled
- root login → disabled
- max authentication attempts → limited

## Issues Encountered

* initial typo in `AllowUsers` directive
* need to validate effective runtime configuration instead of relying only on config file

## Key Concept

Access Control defines **who is allowed to access the system**, independent of authentication method.

## Takeaways

- SSH access must be explicitly restricted using allow-lists
- runtime verification (`sshd -T`) is critical for security validation
- even valid credentials do not grant access without explicit permission
- minimizing allowed users significantly reduces attack surfaced user can establish SSH session

## Commands Used

`sshd -T`
`grep`
`cat /etc/ssh/sshd_config`

## Verification

- `allowusers danny` is active in runtime config
- login for `danny` → successful
- login for other users → denied
- password authentication → disabled
- root login → disabled
- max authentication attempts → limited

## Issues Encountered

- initial typo in `AllowUsers` directive
- need to validate effective runtime configuration instead of relying only on config file

## Key Concept

Access Control defines **who is allowed to access the system**, independent of authentication method.

## Takeaways

- SSH access must be explicitly restricted using allow-lists
- runtime verification (`sshd -T`) is critical for security validation
- even valid credentials do not grant access without explicit permission
- minimizing allowed users significantly reduces attack surface
