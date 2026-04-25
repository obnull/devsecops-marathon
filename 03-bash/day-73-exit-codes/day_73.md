# Stage 01: Linux & Networking Fundamentals
## Day 73: Exit Codes & Error Handling

## Objective

Learn exit codes, how to check and handle them, use trap to catch signals, understand the difference between pipefail and default pipe behavior.

## Environment

Ubuntu 22.04, Oh My Zsh

## Description

Every command returns a code from 0 to 255. 0 = success, any other number = error. This day is about checking these codes, returning your own from functions, logging errors, and catching Ctrl+C.

## What Was Done

Created 5 scripts:

- **show_exit_codes.sh** — shows exit codes of commands (ls, true, false)
- **custom_exit.sh** — function returns 1, 2 or 0 depending on checks
- **trap_example.sh** — catches Ctrl+C and cleans up temp file-4.
- **pipe_check.sh** — demonstrates difference with and without pipefail
- **error_logger.sh** — logs errors to file with timestamp

## Commands Used

`echo $?`                      # show last command exit code
`return 0/1/2`                 # return code from function
`trap cleanup SIGINT`          # catch Ctrl+C
`set -o pipefail`              # error if any command in pipe fails
`$$`                           # current script PID
`$? -ne 0`                     # check for error
`>> "$LOG"`                    # append to file

## Verification

| Script | Result |
|--------|--------|
| show_exit_codes.sh | ls /etc/passwd → 0, ls /fake → 2, true → 0, false → 1 |
| custom_exit.sh | /etc/passwd → 0, /fakefile → 1 |
| trap_example.sh | on Ctrl+C shows "Interrupted! Cleaning..." |
| pipe_check.sh | without pipefail → 0, with pipefail → error |
| error_logger.sh | writes to /tmp/script_errors.log with date |

## Issues Encountered

None. All scripts worked as expected.

## Key Concept

Exit code is Bash's main way to know if a command succeeded. `if` checks exit codes, not true/false. trap allows graceful script termination on interruption.

## Takeaways

- Always check exit codes of critical operations
- Use different codes for different error types (1, 2, 3...)
- trap is needed for cleaning temp files on Ctrl+C
- pipefail catches errors in the middle of a pipe, not just at the end
- $? stores the last command's code — gets overwritten after any command
