#!/bin/bash

LOG="/tmp/script_errors.log"

log_error() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] ERROR: $1" >> "$LOG"
}

backup() {
    cp "$1" "$2" 2>/dev/null
    if [ $? -ne 0 ]; then
    log_error "backup failed: $1 -> $2"
    return 1
    fi
    echo "Backup OK"
}

backup /fakefile /tmp/
echo "Log:"
cat "$LOG" 2>/dev/null