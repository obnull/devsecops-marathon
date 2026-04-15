# Day 63 — Variables and Environment ($VAR, export, env)

## Objective
Understand difference between local variables and environment variables. Learn export, env, and variable scope.

## Environment
Ubuntu, Bash, ~/devsecops-marathon/03-bash/day-63-variables/

## Description
Explored variable types in Bash: local vs environment. Learned that exported variables are visible to child processes, local ones are not.

## What Was Done
1. Created local variable, verified it's NOT visible in child shell
2. Used export to make variable visible to child processes
3. Compared env (only environment) vs set (all variables)
4. Created config_check.sh that reads USER, HOME, SHELL, custom vars
5. Created deploy.sh with arguments and timestamp
6. Created secure_app.sh that requires API_KEY environment variable
7. Tested variable passing in one line: VAR=value ./script.sh

## Commands Used
cd ~/devsecops-marathon/03-bash/day-63-variables/

# Local vs export
MY_NAME="DevSecOps"
bash -c 'echo $MY_NAME'  # empty
export MY_NAME="DevSecOps"
bash -c 'echo $MY_NAME'  # DevSecOps

# env vs set
LOCAL_VAR="local"
export ENV_VAR="env"
env | grep VAR      # shows only ENV_VAR
set | grep VAR      # shows both

# config_check.sh
cat > config_check.sh << 'EOF'
#!/bin/bash
echo "User: $USER"
echo "App environment: $APP_ENV"
EOF
chmod +x config_check.sh
APP_ENV="prod" ./config_check.sh

# secure_app.sh
cat > secure_app.sh << 'EOF'
#!/bin/bash
if [ -z "$API_KEY" ]; then
    echo "ERROR: API_KEY not set"
    exit 1
fi
echo "API_KEY loaded (length: ${#API_KEY})"
EOF
chmod +x secure_app.sh
API_KEY="secret123" ./secure_app.sh

## Verification
./secure_app.sh without API_KEY -> ERROR
API_KEY="secret123" ./secure_app.sh -> "API_KEY loaded (length: 9)"

## Issues Encountered
Forgot that spaces around = are not allowed. VAR = value fails.

## Key Concept
Local variables exist only in current shell. export promotes them to environment variables, making them available to child processes. env shows only environment vars, set shows everything.

## Takeaways
- Use export to pass variables to child processes
- Never hardcode secrets — use environment variables
- Check for required vars with [ -z "$VAR" ]
- One-line assignment: VAR=value ./script.sh