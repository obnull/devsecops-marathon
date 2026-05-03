# Stage 01: Linux & Networking Fundamentals
## Day 78: Log Processing For Loops

## Objective 

Learned processing log files with cycles and basic commands without using regular expressions.

## Environment

Ubuntu 24.04, Oh My Zsh.

## Description

Log analize with `grep`, `cut`, `sort`, `uniq`, `wc`. Real-time monitoring with `tail -f` + `while read`. Create security report based on test log `/var/log/auth.log`.

## What Was Done

- `test-auth.log` - created test-log file
- `simple_search.sh` - find by keywords (failed, accepted)
- `count_by_ip.sh` - count accepted by IP addresses
- `log_summary.sh` - summary: totas strings, failed, accepted, sudo
- `simple_monitor.sh` - a real time monitoring with `tail -f`
- `report.sh` - generate report with timee checkpoint

## Commands Used

- `grep "Failed" test-auth.log` - find strings
- `grep -c "Accepted" test-auth.log` - count quantity
- `wc -l test-auth.log` - summary quantitu strings
- `tail -f /var/log/auth.log` - real-time monitoring
- `cut -d' ' -f1-3` - cutting fields
- `sort | uniq -c | sort -nr` - count unique
- `case "$line" in *"Failed"*) ;; esac` - check substring

## Verification

| Script | Result |
|:--- | ---:|
| simple_search.sh | print all strings with failed |
| log_summary.sh | statistics with log |
| simmple_monitor.sh | monitoring with alert | 
| report.sh | create file report_*.txt |

## Key Concept

Processing logs - analize text files string-by-string. `while read line` + `case` allow filtered events without hard regular expressions.

## Takeaways

- `tail -f` + `while read` = live monitoring
- `grep -c` faster than `grep | wc -l`
- `case "$line" in *"text"*)` - simple search substring
- always checking exists file before processing
