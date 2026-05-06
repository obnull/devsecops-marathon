#!/bin/bash

LOG_FILE="app.log"
MAX_SIZE=1000

rotate_log() {
if [ -f "$LOG_FILE" ]; then
local size=$(stat -c%s "$LOG_FILE" 2>/dev/null || stat -f%z "$LOG_FILE" 2>/dev/null)

if [ "$size" -gt "$MAX_SIZE" ]; then
echo "Log file too big ($size bytes). Rotating..."
echo "[$(date)] Log rotated" > "$LOG_FILE"
fi

fi
}

log() {
rotate_log
echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

for i in {1..50}; do
log "Test message $i"
done

ls -la *.log*
