# Stage 01: Linux & Networking Fundamentals
## Day 87: Final Project Preparation

## Objective

Create project structure and skeleton for the final security monitoring script.

## Environment

Ubuntu 24.04, Oh My Zsh

## What Was Done

- Created project directory structure (modules/, logs/, config/)
- Created main script security_monitor.sh with main() function
- Created module skeletons:
  - colors.sh - color definitions for output
  - checks.sh - system check functions (disk, memory, failed logins)
  - logging.sh - logging with levels (INFO, WARN, ERROR)
  - alerts.sh - alert collection and sending

## Commands Used

`mkdir -p modules logs config` - create directory structure
`touch file.sh` - create empty files
`chmod +x script.sh` - make executable
`source ./modules/file.sh` - import modules
`tree` - view directory structure

## Verification

Project structure created. Main script runs without errors (functions are stubs).

## Issues Encountered

None

## Key Concept

Project preparation is designing architecture before coding. Separate concerns into modules: colors, checks, logging, alerts.

## Takeaways

- Plan structure before writing code
- Use modules for separation of concerns
- Main script orchestrates, modules do the work
- Test skeleton before adding logic
