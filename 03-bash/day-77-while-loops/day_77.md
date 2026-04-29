# Stage 01: Linux & Networking Fundamentals 
## Day 77: `while` Loops (monitoring & waiting)

## Objective 

Learned a `while` cycles for monitoring, waiting actions and read files.

## Environment 

Ubuntu 24.04, Oh My Zsh

## Description

Learning a `while` syntax, `for` different, wait appearance file, line-by-line reading, process monitoring, create progress bar and interactive menu.

## What Was Done 

Creates scripts:

- counter.sh - counter with condition
- ping_check.sh - line-by-line verification found
- wait_for_file.sh - wait file with timeout 
- monitor_process.sh - a realtime process monitoring 
- progress.sh - progress bar animation
- menu.sh - interactive menu with cycles

## Commands Used

- `while [ condition ]; do commands; done` - basic syntax
- `while [ $count - le 5 ]; do count=$((count + 1)); done` - counter
- `while read -r line; do echo "$line"; < file.txt` - read file
- `while true; do sleep 1; done`
- `pgrep -x "process_name"`
- `while [ ! -f /tmp/file ]; do sleep 1; done`

## Key Concept

`while` - cycle of pre-check condition, running null and more once.
In different of `for` (famous number iteration), `while` used when count iteration depends with internal action.

## Takeaways 

- `while read -r line` - securely way of read file
- `while [ ! -f "$file" ] - classic waiting recource
- `break` - exit for cycle, `continue` - pass operation
- `while true` + `sleep` - monitoring no load CPU
- `pgrep -x`- exact math process