# Stage 01: Linux & Networking Fundamentals

## Day 72: Defensive Scripting & Safety Checks

## Objective

Learn write to defensived scripts: arguments checks, file exists, dependencies, validation user prompts and timeouts.

## Environment

Ubuntu 24.04, Oh My Zsh.

## Description

Defensive scripting - this is script checks all before action. Dont trust user, dont trust environment. Worked in this day: `set -euo pipefail`, check dependencies, timeouts and prompt validation.

## What Was Done

Created a 5 scripts:

- **safe_template.sh** - template with `set -euo pipefail` and error_exit function
- **check_dependencies.sh** - checked installed commands (curl, jq, grep, awk, sed)
- **safe_remove.sh** - deleted with confirmed and size showing
- **timeout_example.sh** - forced termination command via N seconds
- **validate_input.sh** - check name length (>=2) and range number (1-100)

## Commands Used

- `set -euo pipefail`
- `command -v "$cmd"`
- `[ -n "$missing" ]`
- `du -sh "$target" | cut -f1`
- `[ ${#name} -lt 2 ]`
- `[ "$num" -ge 1 ] && [ "$num" -le 100 ]`
- `kill -9 $pid`
- `$!` - PID last background proccess
- `2>/dev/null` — hide errors

## Verification

| Script                | Result                                              |
| --------------------- | --------------------------------------------------- |
| safe_template.sh      | copied /etc/passwd with /tmp/ after checks          |
| check_dependencies.sh | displays a list of missing packages                 |
| safe_remove.sh        | shows size and asked (yes/no)                       |
| timeout_example.sh    | kill sleep 10 via 3 seconds                         |
| validate_input.sh     | rejection "A" and "200", confirmed "John" and "100" |

## Issues Encountered

Error in check_dependencies.sh: writed `for cmd in deps` instead of `for cmd in $deps`. Script verified a command `deps` instead of `curl`, `jq`, etc. Fixed it added $.

## Key Concept

Defensive scriptig = all check. Arguments, file exists, rights, dependencies, input. `set -euo pipefail` in every script - stopped for any error.

## Takeaways

- always in quotes: "$var"
- `command -v` better `which`
- `$!` catches PID background process
- `${var}` - string length
- `2>/dev/null` - hide errors
- timeouts needeed to prevent internal loading scripts/