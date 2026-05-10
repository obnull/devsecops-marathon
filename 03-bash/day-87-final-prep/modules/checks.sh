#!/bin/bash

check_disk() {
local usage=$(df -h / | tail -1 | awk '{print $5}' | sed 's/%//')

if [ "$usage" -gt 80 ]; then
log_warn "Disk usage: ${usage}% (>80%)"
return 1
else
log_info "Disk usage: ${usage}% - OK"
return 0
fi
}
