#!/bin/bash

LOG_DIR="$SCRIPT_DIR/logs"
LOG_FILE="$LOG_DIR/monitor_$(date +%Y%m%d).log"
ERROR_LOG="$LOG_DIR/errors.log"

mkdir -p "$LOG_DIR"

log_info() {
    local msg="[$(date '+%Y-%m-%d %H:%M:%S')] [INFO] $1"
    echo "$msg" >> "$LOG_FILE"
    echo -e "${GREEN}$msg${NC}"
}

log_warn() {
    local msg="[$(date '+%Y-%m-%d %H:%M:%S')] [WARN] $1"
    echo "$msg" >> "$LOG_FILE"
    echo -e "${YELLOW}$msg${NC}"
}

log_error() {
    local msg="[$(date '+%Y-%m-%d %H:%M:%S')] [ERROR] $1"
    echo "$msg" >> "$LOG_FILE"
    echo "$msg" >> "$ERROR_LOG"
    echo -e "${RED}$msg${NC}"
}
