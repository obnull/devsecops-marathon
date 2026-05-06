#!/bin/bash

LOG_FILE="script.log"

log() {
local message="$1"
local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
echo "[$timestamp] $message" >> "$LOG_FILE"
}

log "Script started"
log "Checking system..."
log "Script finished"

echo "Logs written to $LOG_FILE"
cat "$LOG_FILE"
