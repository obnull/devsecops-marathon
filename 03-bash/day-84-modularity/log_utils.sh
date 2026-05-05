#!/bin/bash

LOG_FILE="$HOME/script.log"

log_message() {
    local msg="$1"
    local level="$2"
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [$level] $msg" >> "$LOG_FILE"
}

log_info() {
    log_message "$1" "INFO"
}

log_error() {
    log_message "$1" "ERROR"
}
