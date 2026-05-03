# Stage 01: Linux & Networking Fundamentals
## Day 80: sed and awk (basics)

## Objective

Master basic text replacement with sed and column processing with awk.

## Environment

Ubuntu 24.04, Oh My Zsh

## Path

/03-bash/day-80-sed-awk/

## What Was Done

- data.txt - test file with user data
- log.txt - test log file with ERROR, INFO, WARNING
- sed_basic.sh - replace first, replace all, replace second occurrence
- awk_basic.sh - print columns, filter by UID, filter by keyword
- log_stats.sh - log statistics with awk

## Commands Used

`s/old/new/` - replace first match
`s/old/new/g` - replace all matches
`/pattern/d` - delete matching lines
`awk -F: '{print $1}'` - print first column with colon delimiter
`awk '$3 > 100 {print $1, $3}'` - filter by value
`awk '/ERROR/ {print}'` - filter lines by pattern
`awk '{print $NF}'` - print last column

## Verification

| Script | Result |
|--------|--------|
| sed_basic.sh | working |
| awk_basic.sh | working |
| log_stats.sh | working |

## Issues Encountered

None

## Key Concept

sed replaces text patterns. awk processes structured data by columns. Flag -i in sed saves changes to file. Flag -F in awk sets custom delimiter.

## Takeaways

- sed `s/old/new/g` - g flag for all matches
- awk `-F:` - set custom delimiter
- awk `{print $NF}` - NF means last column
- awk `/pattern/` - filter lines with pattern
- sed `-i` makes changes permanent
