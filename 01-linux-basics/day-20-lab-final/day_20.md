# Stage 01: Linux & Git Basics
## Day 20: [LAB] Build & Scan Your Own image

**Description**

Final lab of week 3: built a custom Docker image for a simple Python web app, applied all security practices learning during the week - non-root user, resource limits, `.dockerignire`, and vulnerability scanning with Trivy.

**What was done:**

- Created a minimal web app (`index.html` + `server.py`) inside `app/` folder

- Wrote a `Dockerfile`:
  - Used `python:3.11-slim` as base
  - Created a nonprivileged user (`appuser`) with UID 1001
  - Set `USER appuser`
  - Copied the app to fixed ownership

- Added `.dockerignore` to exclude cache and local files

- Wrote `docker-compose.yaml` with resource limits

- Built and started the stack with `docker compose up -d`

- Verified that app responrs on `localhost:8080`

- Checked the user inside the container (`whoami` -> `appuser`

- Scanned the image with Trivy and saved the report `trivy image day-20-lab-final-web:latest | tee scan-report.txt`)

- Filtered critical/high vulnerabilities with `grep`

- Monitoring resource usage with `docker stats`

- Cleaned up with `docker compose down -v`

**Investigation:**

- Understood that a even a simple app musst run as non-root to reduce attack surface
- Saw that resource limits protect the host from a runaway container
- Realised that scanning is essential before pushing any image to production

### Result

Built a production-ready container image with security best practices and validated it with Trivy. All topics from Week 3 (Dockerfile, Compose, non-root, limits, scanning) are how combined in one working project.