# Stage 01: Linux & Git Basics
## Day 11: Special Permissions (SUID, SGID, Sticky Bit)

**Description:**

Explored special permissions in Linux: SUID, SGID and Sticky bit. Learned how they work, where they're used and why they matter for security.

**What was done:**

- Found all SUID binaries ion the system (`find / -perm -4000`)

- Created a shared folder with SGID (`chmod 2755`) to inherit group ownership

- Observed Sticky bit on (`/tmp`) and created a test folder with `chmod 1777`

- Attempted to set SUID on a custom script and understood why it didn't work (security protection)

- Searched for SUID and SGID files system-wide and analyzed their purpose

- Cleaned up test directories and users

### Result

Understood the purpose and risks of special permissions: SUID for privilege escalation, SGID for group inheritance, Sticky bit for shared folders protection
