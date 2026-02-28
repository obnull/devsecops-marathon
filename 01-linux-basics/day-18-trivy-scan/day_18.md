# Stage 01: Linux & Git Basics
## Day 18: Trivy - Image Vulnerability Scanner
**Description:**

Installed Trivy, a Vulnerability scanner for containers, and scanned several Docker images. Learned how to interpret scan result, compare image versions, and identify critical security issues.

**What was done:**

- Installed Tryvy for official GitHub release

- Scanned oficial images: `nginx:alpine`, `postgres:13-alpine`, `alpine:latest`

- Observed that `postgres:13-alpine` contains many vulnerabilities (old version)

- Noticed that `nginx:alpine` is almost clean (only 1 low/medium issue)

- Saved scat results for text files:
  - `trivy image postgres:13-alpine --format table > postgres-scan.txt`
  - `trivy image nginx:alpine --format table > nginx-scan.txt`

- Filtered critical vulnerabilities with `grep "CRITICAL" postgres-scan.txt`

- Understood that old images = security risk

### Result 

Able to scan container image for known vulnerabilities, interpret output and make informed decisions about base image versions. This is a core DevSecOps skill for supply chain security