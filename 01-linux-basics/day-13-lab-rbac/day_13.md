# Stage 01: Linux & Git Basics
## Day 13: [LAB] RBAC Simulation

**Description:**

Simulated Role-Based Access Control (RBAC) on Linux: created users, groups and folders with restricted permissions. Added SGID for group inheritance and configured passwordless sudo for a specific command.

**What was done:**

- Created users: `alice` (dev), `bob` (ops), `charlie` (audit)

- Created groups: `developers`, `operators`, `auditors`

- Assigned users to corresponding groups

- Created folder structure: `/srv/project/{dev,logs,audit}`

- Set ownership and permissions:
  - `dev` -> `alice:developers` `770`
  - `logs` -> `bob:operators` `750`
  - `audit` -> `charlie:auditors` `700`

- Enabled SGID on `/dev` so new files inherit the `developers` group

- Added sudo rule for `operators` group: `%operators ALL=(ALL) NOPASSWD: /bin/systemctl restart rsyslog`

- Verified access: each user could only access theri own folder

- Tested sudo for `bob` - works without password

- Wrote an idempotent deployment script `rbac-deploy.sh`

### Result

Fully functional RBAC simulation on Linux, demonstrating users, groups, permissions, SGID, and sudo restrictions - the foundation for understanding Kubernetes RBAC.

