# Stage 01: Linux & Git Basics
## Day 21: APT Trust Model & Package Integrity

**Description:**

Understand how APT establishes trust, validates repositories, and protects against supply chain risks.

**What was done:**

### 1. Repository Configuration
- Checked `/etc/apt/sources.list`
- Observed modern Ubuntu using:
  - `/etc/apt/sources.list.d/ubuntu.sources`
- Identified key fields:
  - `Types`
  - `URIs`
  - `Suites`
  - `Components`
  - `Signed-By`

### 2. Trust Model
APT workflow during `apt update`:
1. Downloads `InRelease` or `Release`
2. Verified GPG signature
3. Validates hashes of package indexes
4. Updates local package database

Key concept: APT trusts repositories based on **GPG keys**, not brand names.

### 3. Practical Experiment
Created a test repository file:

Observed:
- Malfirmed line error (invalid syntax)
- 404 error when URL exists but no Release file
- APT refused to update from repository without Release file
- Warned to about legacy `trusted.gpg`

Conckusion: 
APT enforces stricr validation and refuses insecure sources

**Security Lens:**

### Risks Identified
- Adding a malicious repository + GPG key = trusted compromise
- Supply chain attack via compromised upstream
- Using `curl | sudo bash`
- Using `latest` tags tags breakss reproducibility

### Key Insight
GPG signature ensures:
  - Integrity
  - Authenticity of repository metadata

Is does NOT ensures:
- Upstreap repository is uncompromised
- Private key is safe

## Final Takeaway
APT does not blindly install packages.

It verifies:
- Structure
- Signature
- Integrity
- Release metadata

Security is about controlling trust, not asuming it.