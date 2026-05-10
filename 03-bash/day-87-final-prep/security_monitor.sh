#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/modules/colors.sh"
source "$SCRIPT_DIR/modules/logging.sh"
source "$SCRIPT_DIR/modules/checks.sh"
source "$SCRIPT_DIR/modules/alerts.sh"

main() {
log_info "=== Security Monitor Started ==="

check_disk
check_memory
check_failed_logins

log_info "=== Security Monitor Finished ==="
}

main
