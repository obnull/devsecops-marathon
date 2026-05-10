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

check_memory() {

local usage=$(free -m | awk 'NR==2 {print $4}')

if [ "$usage" -lt 500 ]; then
log_warn "Memory usage: ${usage} megabytes, its bad!"
else
log_info "Memory usage: ${usage} - OK"
fi
}

check_failed_logins() {
local logins=$(sudo grep -c "Failed password" /var/log/auth.log)
local logins_h=$(sudo grep "Failed password" /var/log/auth.log | grep "$(date '+%b %e')" | wc -l)

if [ "$logins" -gt 5 ]; then
log_warn "Warning! Very logins failed! (${logins})"
elif [ "$logins" -gt 0 ]; then
log_info "Failed logins: ${logins}"
else
log_info "No failed logins - OK"
fi
}
