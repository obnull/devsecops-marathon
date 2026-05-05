# Stage 01: Linux & Networking Fundamentals
## Day 83: Functions in Bash

## Objective

Learn how to declare and call functions in bash scripts.

## Environment

Ubuntu 24.04, Oh My Zsh

## Path

/03-bash/day-83-functions/

## What Was Done

- simple_func.sh - basic function without arguments
- greet.sh - function with arguments ($1, $2)
- log_check.sh - function with local variables and return codes
- system_check.sh - modular system monitoring with multiple functions
- validate.sh - functions returning success/failure codes

## Commands Used

`function name() { commands; }`
`name() { commands; }`
`name "arg1" "arg2"`
`local var="value"`
`return 0`
`$1, $2, $@, $#`

## Verification

All scripts run without errors and produce expected output.

## Issues Encountered

None

## Key Concept

Functions allow code reuse and modularity. Arguments accessed via $1, $2. Local variables with 'local' keyword prevent global scope pollution.

## Takeaways

- Functions make scripts readable and maintainable
- Use local variables inside functions
- return for exit codes (0-255), echo for string output
- $@ passes all arguments, $# gives argument count
