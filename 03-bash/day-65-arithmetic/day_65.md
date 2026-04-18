# Stage 01: Linux & Networking Fundamentals
## Day 65: Arithmetic and Basic Operations

## Objective
Learn integer arithmetic and numeric comparisons in Bash.

## Environment
Ubuntu, Bash, ~/devsecops-marathon/03-bash/day-65-arithmetic/

## Description
Explored $(( )) for math operations and numeric conditions with -eq, -gt, -ge.

## What Was Done
- Basic math: +, -, *, /, %
- Numeric comparison with if-else
- Simple calculator with arguments

## Commands Used
`a=10; b=3; sum=$((a + b))`
`if [ $age -ge 18 ]; then`
`result=$(( $1 $2 $3 ))`

## Verification
- ./math.sh
- ./check.sh
- ./calc.sh 15 / 4

## Issues Encountered
- Integer division truncates (15/4 = 3, not 3.75)
- Multiplication needs quotes or backslash: "*"
- Spaces around [ ] are critical

## Key Concept
$((a + b)) for integer math. Use -eq, -ne, -gt, -lt, -ge, -le for numeric comparisons.

## Takeaways
- Bash only does integer math natively
- Use bc for floating point
- Always quote variables in comparisons