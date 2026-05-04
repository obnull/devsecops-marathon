#!/bin/bash

is_root() {
    if [ "$(whoami)" = "root" ]; then
        return 0
    else
        return 1
    fi
}

check_service() {
    local service="$1"
    systemctl is-active "$service" &>/dev/null
    return $?
}

if is_root; then
    echo "✓ Running as root"
else
    echo "✗ Not running as root"
fi

if check_service "ssh"; then
    echo "✓ SSH service is running"
else
    echo "✗ SSH service is stopped"
fi
