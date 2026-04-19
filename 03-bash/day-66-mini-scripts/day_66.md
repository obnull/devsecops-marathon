# Stahe 01: Linux & Networking Fundamentals
## Day 66: Mini Scripts (Practice)

## Objective
Reinforce variables, arguments, conditions, and arithmetic through small scripts.

## Environment
Ubuntu, Bash, ~/devsecops-marathon/03-bash/day-66-mini-scripts/

## Description
Six small scripts covering basic Bash patterns.

## What Was Done
- hello.sh: greet with argument
- sum.sh: add two numbers
- is_even.sh: check odd/even
- ask_name.sh: interactive input
- multiply.sh: multiply two numbers
- compare.sh: compare two numbers

## Commands Used
- `if [ -z "$1" ]`
- `if [ $# -ne 2 ]`
- `result=$(( $1 + $2 ))`
- `if [ $(( $1 % 2 )) -eq 0 ]`
- `read -p "prompt" var`
- `if [ $1 -eq $2 ]; elif [ $1 -gt $2 ]; else`

## Verification
All scripts run successfully with valid and invalid inputs.

## Issues Encountered
- Forgot to quote variables in comparisons
- Multiplication without quotes works inside $(( )) fine

## Key Concept
Small focused scripts are easier to debug and reuse. Always validate inputs.

## Takeaways
- Check arguments before using them
- Use meaningful variable names
- Exit with error code 1 on invalid input
- Test scripts with both valid and invalid inputs