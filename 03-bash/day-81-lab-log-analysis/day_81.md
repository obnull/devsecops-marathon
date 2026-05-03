# Stage 01: Linux & Networking Fundamentals
## Day 81: Security Log Analysis Lab

## Objective

Create a script to analyze auth.log and generate security report.

## Environment

Ubuntu 24.04, Oh My Zsh

## What Was Done

Created security_check.sh script that:
- Counts failed, successful, and invalid attempts
- Shows top 3 attacking IPs
- Detects IPs with 3+ attempts
- Saves report with timestamp

## Commands Used

grep -c "Failed password"
grep -E -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+"
sort | uniq -c | sort -rn
while read count ip; do if [ $count -ge 3 ]; then
tee

## Verification

Script runs successfully and generates report_*.txt file.

## Issues Encountered

None

## Key Concept

Combining grep, sort, uniq, and while loop in one script for log analysis.

## Takeaways

- grep -c is faster than grep | wc -l
- tee shows output and saves to file
- while read for processing piped output
