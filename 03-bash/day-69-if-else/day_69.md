# Day 69 Report — Conditional Statements

## What Was Done
- Created 5 scripts: argument check, grade calculator, file type detector, backup checker, quick checks
- Practiced if, elif, else, &&, ||
- Used file operators: -f, -d, -w
- Used string check: -z

## Commands Used

if [ $# -eq 0 ]; then
if [ -f "$file" ]; then
if [ -z "$var" ]; then
[ condition ] && command
[ condition ] || command

## Verification Results

| Script | Input | Output |
|--------|-------|--------|
| check_args.sh | (none) | ERROR: Please provide at least one argument |
| check_args.sh | hello | OK: Received 1 argument(s) |
| grade.sh | 85 | B — Good |
| grade.sh | 50 | F — Need improvement |
| file_check.sh | /etc/passwd | FILE: Regular file |
| file_check.sh | /tmp | DIRECTORY: Folder |
| backup_check.sh | - | WARNING: /tmp/backup_test is not writable |
| quick_check.sh | - | OK: /var/log exists + fallback created |

## Issues Encountered
None. All scripts executed as expected.

## Key Concepts
- if checks exit codes, not boolean values
- Always quote variables in [ ] to prevent word splitting
- Use [[ ]] for regex and internal &&/||
- Short form && and || replaces simple if statements

## Takeaways
Conditions are the foundation of defensive scripting. Tomorrow: comparison operators (-eq, -ne, -f, -d in depth)
