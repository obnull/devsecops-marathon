# Stage 01: Linux & Networking Fundamentals
## Day 76: `for` Loops (iterating files & lists)

## Objective

Master `for` cycles with automation for iterate over files, lists and numbers.

## Environment

Ubuntu 24.04, Oh My Zsh

## Description

Learn four syntax a `for` cycle, processing files in drectories, filter to type, create backup rotation script.

## What Was Done

Created scripts:

- `fruits.sh` - enumerate string list
- `counter.sh` - three methods enumerate numbers
- `process_files.sh` - shows files/folders
- `create_users.sh` - read in file and inspect users
- `backup_rotate.sh` - backup with deleted old copies
- `replace_in_files.sh` - search and replace text with `find`

## Commands Used

- `for i in 1 2 3; do echo $i; done` - basic syntax
- `for i in {1..10}; do echo $i; done` - range
- `for file in *.txt; do echo "processing $file"; done` - enumerate files
- `for ((i=0; i<10; i+=2)); do echo $i; done` - C-style
- `ls -t backups/*.tar.gz` - sorting backups by time
- `find . -name "*.txt" - type f` - search files

## Verification

All scripts meet their functional requirements.

## Issues Encountered

None. 

## Key Concept

A `for` cycle - iteration a fixed set of elements. In different of `while` (work while true condition), `for` used then count of iteration known in advance.

## Takeaways

- Always verified exists file before processing
- `ls -t` + cycle = easy backup rotation
- `find` more securely `*` with recursive search
- Quotes around variable.