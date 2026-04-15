# Stage 01: Linux & Networking Fundamentals
## Day 62: Bash Intro (shebang, script execution)

## Objective
Understand shebang and different ways to execute scripts.

## Environment
Ubuntu, Bash, ~/devsecops-marathon/03-bash/day-62-bash-intro/

## Description
First day of Bash scripting. Created simple scripts with shebang, learned execution methods.

## What Was Done
- Created first.sh with shebang, username, date, shell info
- Made executable with chmod +x
- Ran script with ./first.sh, bash first.sh, source first.sh
- Created greet.sh with argument support
- Tested script without shebang

## Commands Used
"cat > first.sh << 'EOF'
#!/bin/bash
echo "=== Day 62: Bash Intro ==="
echo "Current user: $(whoami)"
echo "Current date: $(date)"
echo "Shell: $SHELL"
EOF"

'chmod +x first.sh'
'./first.sh'

"cat > greet.sh << 'EOF'
#!/bin/bash
echo "Hello, $1! Today is $(date +%A)"
EOF"

'chmod +x greet.sh'
'./greet.sh "DevSecOps"'

## Verification
./first.sh -> shows user, date, shell
./greet.sh "DevSecOps" -> "Hello, DevSecOps! Today is Tuesday"

## Issues Encountered
Forgot chmod +x -> permission denied. Fixed.

## Key Concept
Shebang (#!) tells the kernel which interpreter to use. Without it, script may run in wrong shell.

## Takeaways
- Always start scripts with #!/bin/bash
- chmod +x needed for direct execution
- Three ways: ./script, bash script, source script
