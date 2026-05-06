# Stage 01: Linux & Networking Fundamentals
## Day 85: Logging

## Objective

Learn how to write logs with timestamps and rotate log files.

## Environment

Ubuntu 24.04, Oh My Zsh

## Path

/03-bash/day-85-logging/

## What Was Done

- basic_logger.sh - simple logging with timestamp
- level_logger.sh - logging with levels INFO, WARN, ERROR
- rotate_logger.sh - log rotation by line count
- monitor_with_log.sh - monitoring script with separate log and error log

## Commands Used

`date '+%Y-%m-%d %H:%M:%S'` - generate timestamp
`wc -l < file` - count lines in file
`mv file file.old` - rotate log file
`>>` - append to file
`mkdir -p` - create directory if not exists

## Verification

All scripts create log files with proper timestamps and levels.

## Issues Encountered

stat command was not covered before - simplified to use wc -l instead of file size.

## Key Concept

Log rotation prevents log files from growing indefinitely. Different log levels (INFO, WARN, ERROR) help filter messages by importance.

## Takeaways

- Timestamp format: `[2025-01-15 14:30:22]`
- Use `>>` to append, `>` to overwrite
- Rotate by line count: `wc -l`
- Separate error log from main log
- Levels: DEBUG < INFO < WARN < ERROR < CRITICAL
