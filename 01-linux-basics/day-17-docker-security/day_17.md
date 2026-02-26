# Stage 01: Linux & Git Basics
## Day 17: Docker Security - Non Root & Rootless

**Description:**

Explored Docker security by comparing containers runing as root vs. non-root users. Learned< whe running containers with root is dangerous and how to create image that use an unprivileged user. Briefly discussed rootless mode.

**What was done:**

- Created a container from `alpine` running as root (`whoami` -> root, `id` -> uid=0)

- Observed that a root-user can install packages (`akp add sudo`) and modify system files

- Built a non-root imagge using `adduser` and `USER` instruction

- Debugging common pitfalls:
  - Wrong order of `RUN` and `USER` (tried install packages after switching user)
  - Syntax differences between `alpine` and `debian` based images (`addgroup` flags)

- Verified that the non-root user:
  - Has UID 1000+ (not 0)
  - Cannot write to `/` (`touch /test.txt` -> Permission denied)
  - Cannot install packages (`apk add` files)

- Briefly covered rootless Docker (daemon without root privileges)

**Investigation:**

- Compared root and non-root containers side by side

- Understood why official images (nginx, postgres) often use `USER` at the end

- Rewrote an old Dockerfile to run with an unprivileged user

### Result

Understood the principle of least privilege in containers: always run as non-root when possible. Know how to create such images and why it matters for security
