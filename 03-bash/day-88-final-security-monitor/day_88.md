# Stage 01: Linux & Networking Fundamentals
## Day 88: Final Project - System Security Monitoring Script

## Objective

Create a fully working security monitoring script with modules, logging, and alerts.

## Environment

Ubuntu 24.04, Oh My Zsh

## What Was Done

- Fixed module loading order (logging.sh before checks.sh)
- Fixed logging.sh with proper echo and color output
- Removed duplicate function definitions in main script
- Removed function calls from checks.sh that caused double execution
- Successfully tested security_monitor.sh with all checks

## Final Script Functions

- check_disk() - monitors disk usage, warns if >80%
- check_memory() - monitors free memory, warns if <500MB
- check_failed_logins() - counts failed attempts, warns if >5
- log_info/log_warn/log_error() - structured logging function

## Commands Used

`df -h / | tail -1 | awk '{print $5}' | sed 's/%//'` - get disk usage
`free -m | awk 'NR==2 {print $4}'` - get free memory in MB
`grep -c "Failed password" /var/log/auth.log` - count failed logins
`grep -E -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+"` - extract IP addresses
`sort | uniq -c | awk '$1 >= 3'` - find IPs with 3+ attempts

## Verification

security_monitor.sh runs successfully with output:
- [INFO] Disk usage: 26% - OK
- [WARN] Memory usage: 138MB - its bad!
- [WARN] Warning! Very logins failed! (17)
- Logs written to logs/monitor_*.log

## Issues Encountered

1. Module order: checks.sh called log_info before logging.sh was sourced
2. Duplicate functions: main.sh redefined check_disk()
3. Function calls in checks.sh: caused double execution
4. logging.sh used echo -e incorrectly for log files

## Key Concept

Final project combines all Month 3 topics: variables, conditions, loops, grep, awk, functions, modules, logging, and cron-ready structure.

## Takeaways

- Always source modules in correct order (colors, logging, checks, alerts)
- Keep function definitions in one place only (checks.sh)
- Dont call functions inside module files
- Use local variables in functions
- Separate concerns: one module = one responsibility
