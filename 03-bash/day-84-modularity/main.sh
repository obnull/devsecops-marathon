#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/colors.sh"
source "$SCRIPT_DIR/checks.sh"
source "$SCRIPT_DIR/log_utils.sh"

main() {
    print_ok "Starting security check..."
    log_info "Script started"
    
    # Проверка прав
    if is_root; then
        print_ok "Running as root"
    else
        print_warning "Not running as root. Some checks may fail"
        log_error "Script not running as root"
    fi
    
    # Проверка файлов
    if check_file_exists "/var/log/auth.log"; then
        print_ok "Auth log exists"
        log_info "Auth log found"
        
        # Подсчет failed попыток
        failed=$(grep -c "Failed password" /var/log/auth.log 2>/dev/null || echo 0)
        print_ok "Failed attempts: $failed"
        log_info "Failed attempts count: $failed"
    else
        print_error "Auth log not found"
        log_error "Auth log missing"
    fi
    
    print_ok "Check complete"
    log_info "Script finished"
}

main
