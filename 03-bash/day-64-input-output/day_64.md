# Stage 01: Linux & Networking Fundamentals
## Day 64: Input/Output (read, echo, arguments)

## Objective
Learn to read user input, handle command line arguments, and output data properly.

## Environment
Ubuntu, Bash, ~/devsecops-marathon/03-bash/day-64-input-output/

## Description
Explored three ways to pass data to scripts: arguments ($1, $2...), interactive input (read), and redirection. Combined them with conditions for robust scripts.

## What Was Done
1. Created args_demo.sh to understand $0, $#, $@, $1, $2
2. Created ask.sh with read -p (prompt) and read -s (silent password)
3. Created backup_with_check.sh validating arguments and directories
4. Created create_users.sh reading usernames in a loop
5. Created interactive_deploy.sh combining arguments and read
6. Compared echo vs printf formatting
7. Created simple_login.sh with credential validation

## Commands Used
cd ~/devsecops-marathon/03-bash/day-64-input-output/

# Arguments demo
cat > args_demo.sh << 'EOF'
#!/bin/bash
echo "Script: $0, Args count: $#"
echo "First: $1, Second: $2, All: $@"
EOF

# Interactive input
read -p "Name: " NAME
read -s -p "Password: " PASS

# Argument validation
if [ $# -ne 2 ]; then
    echo "Usage: $0 <arg1> <arg2>"
    exit 1
fi

# Read in loop
while read -r LINE; do
    echo "Processing: $LINE"
done

## Verification
./args_demo.sh hello world
./backup_with_check.sh /tmp /tmp/backup
./interactive_deploy.sh prod  (requires typing 'yes')
./simple_login.sh  (admin / secret123)

## Issues Encountered
- Forgot that read -s needs an extra echo to add newline after password
- Using [ $# -ne 2 ] without quotes works but [ "$#" -ne 2 ] is safer

## Key Concept
$1, $2... are positional arguments from command line. read captures user input from stdin. $# gives argument count. $@ gives all arguments.

## Takeaways
- Always validate number of arguments with $#
- Use read -p for prompts, read -s for passwords
- Combine arguments and read for flexible scripts (arg first, fallback to prompt)
- printf gives more formatting control than echo