# Stage 01: Linux & Networking Fundamentals
## Day 84: Modular Scripts

## Objective

Split scripts into multiple files and connect them with source.

## Environment

Ubuntu 24.04, Oh My Zsh

## Path

/03-bash/day-84-modularity/

## What Was Done

- colors.sh - colors and print functions
- checks.sh - file, directory, root checks
- log_utils.sh - logging functions
- main.sh - main script that sources all modules

## Commands Used

- `source file.sh`
- `. file.sh`
- `SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"`
- `local var="value"`
- `return 0 / return 1`

## Verification

main.sh runs and produces colored output with logging.

## Issues Encountered

1. Function name mismatch: check_file_exist vs check_file_exists
2. Wrong parameter: check_dir_exists used $2 instead of $1
3. Permission denied on /tmp/script.log with sudo - fixed by using $HOME

## Key Concept

Modularity is splitting code into small files, each responsible for one task. Source command imports functions from other files.

## Takeaways

- Use source or . to import modules
- Always use SCRIPT_DIR to get current directory
- Check function names match exactly
- Use $HOME instead of /tmp for user logs
- Modules can be reused across different projects
