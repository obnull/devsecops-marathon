## Stage 01: Linux & Git Basics
## Day 04: File Inspection & Grep Basics

1. **Commands Mastered:**
   - `cat`: Views and concatenates files. Use `-n` to display line numbers, `-A` to show non-printable characters.
   - `less`: Browses files page by page. Supports search (`/`), navigation (`g`/`G`), and follow mode (`+F`).
   - `head`: Displays the beginning of files. Use `-n` to specify number of lines, `-c` for bytes.
   - `tail`: Displays the end of files. Use `-f` to follow logs in real time — critical for debugging.
   - `grep`: Searches for patterns in files. Essential flags:
     - `-i` — ignore case
     - `-r` — recursive search
     - `-n` — show line numbers
     - `-c` — count matches
     - `-v` — invert match (exclude)
     - `-E` — extended regular expressions
     - `-A`/`-B`/`-C` — context lines (after/before/around)

2. **Log Analysis & Security:**
   - **HTTP status code analysis:**
     `grep -o ' [0-9]\{3\} ' access.log | sort | uniq -c | sort -rn`
   - **Attack pattern detection:**
     - Path traversal: `grep -E "\.\./|etc/passwd" access.log`
     - SQL injection: `grep -E "union|select|1=1" access.log`
     - Brute force: `grep "Failed password" auth.log | grep -c "45.33.22.11"`
     - Scanners: `grep -E "nmap|sqlmap|nikto" access.log`
   - **Real-time monitoring:**
     `tail -f access.log | grep --color "ERROR\|attack"`

3. **Security Focus:**
   - Never grep secrets directly — commands stay in history
   - Use `cat file | grep "pattern"` or `less` instead of `grep -r "password"`
   - Clean history with `history -d <line_number>` if secrets are exposed
   - Always check for suspicious User-Agents and uncommon HTTP methods

4. **Automation Script:**
   - Created `analyzer.sh` — automated security report generator
   - Collects top attacking IPs, suspicious requests, application errors, and brute force attempts
   - Saves timestamped reports: `security-report-YYYYMMDD.txt`



### Result:
Successfully mastered file inspection commands, grep pattern matching, and security log analysis. Built an automated log analyzer script for DevSecOps monitoring. All practical tasks and log structures have been committed to the repository.
