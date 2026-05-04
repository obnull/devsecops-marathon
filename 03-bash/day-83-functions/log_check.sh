#!/bin/bash

check_failed() {
local log_file="$1"
local count=$(grep -c "Failed" "$log_file" 2>/dev/null)
echo "Failed attempts: $count"
}

check_auth() {
local log_file="$1"

if [ ! -f "$log_file" ]; then
echo "error: $log_file not found"
return 1
fi

echo "=== Auth log analysis ==="
check_failed "$log_file"
}

check_auth "/var/log/auth.log"
