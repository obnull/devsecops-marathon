#!/bin/bash

LOG_FILE="app.log"

log_info() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [INFO] $1" >> "$LOG_FILE"
}

log_warn() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [WARN] $1" >> "$LOG_FILE"
}

log_error() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] [ERROR] $1" >> "$LOG_FILE"
}

log_info "Application started"
log_warn "Disk usage is 85%"
log_error "Failed to connect to database"
log_info "Application stopped"

cat "$LOG_FILE"
