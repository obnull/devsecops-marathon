# Stage 01: Linux & Networking Fundamentals
## Day 79: grep and Regular Expressions

## Objective

Master basic regular expressions for text search in logs using grep.

## Environment

Ubuntu 24.04, Oh My Zsh

## Description

Learning basic regex symbols: ., *, +, ?, ^, $, [], {}. Search for IP addresses, filter logs, extract data.

## What Was Done

- test.txt - created test file
- basic_grep.sh - search root, ^root, 5$, digits
- find_ips.sh - search and extract IP addresses
- analyze_auth.sh - analyze auth.log with regex
- suspicious.sh - detect brute force and external IPs

## Commands Used

`grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"` - search IP
`grep -E -o "[0-9]+"` - only numbers
`grep -E "^root"` - line start
`grep -E "failed$"` - line end
`grep -E "Failed.*root"` - Failed and root in same line
`grep -v -E "^192\.168\."` - exclude IP
`grep -E "^ *[3-9]"` - lines starting with 3-9

## Verification

| Script | Result |
|--------|--------|
| basic_grep.sh | search root, ^root, 5$, digits |
| find_ips.sh | extract all IPs from test.txt |
| analyze_auth.sh | analyze failed, root, IPs |
| suspicious.sh | find IPs with 3+ attempts, external IPs |

## Issues Encountered

- Missing -E flag: without -E, +, ?, {} dont work
- Dot in regex: need escaping \.
- Test log has no IP with 3+ attempts: script works fine, lack of data

## Key Concept

Regular expressions - patterns for text search. Flag -E enables extended syntax. -o outputs only matching part.

## Takeaways

- Always use grep -E for regex with +, ?, {}
- Dot in regex means any character. To search dot: \.
- [0-9]{1,3} = 1 to 3 digits
- ^ = line start, $ = line end
- grep -v = exclude lines with pattern

