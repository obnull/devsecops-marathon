#!/bin/bash

check_disk() {
echo "=== DISK USAGE ==="
df -h | grep -E "^/dev"
}

check_memory() {
echo "=== MEMORY ==="
free -h | grep -E "Mem|Swap"
}

check_users() {
echo "=== LOGGED IN USERS ==="
who | wc -l
}

check_failed_logins() {
    local log="/var/log/auth.log"
    if [ -f "$log" ]; then
        echo "=== FAILED LOGINS ==="
        grep "Failed password" "$log" | tail -3
    fi
}

check_disk
echo ""
check_memory
echo ""
check_users
echo ""
check_failed_logins
