#!/bin/bash

LOG="auth.log"
REPORT="report_$(date +%Y%m%d_%H%M%S).txt"

{
    echo "=== SECURITY REPORT ==="
    echo "Date: $(date)"
    echo ""
    
    echo "Failed attempts: $(grep -c "Failed password" "$LOG")"
    echo "Successful logins: $(grep -c "Accepted password" "$LOG")"
    echo "Invalid users: $(grep -c "Invalid user" "$LOG")"
    echo ""
    
    echo "Top attacking IPs:"
    grep "Failed password" "$LOG" | grep -E -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" | sort | uniq -c | sort -rn | head -3
    echo ""
    
    echo "Suspicious (>=3 attempts):"
    grep "Failed password" "$LOG" | grep -E -o "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" | sort | uniq -c | while read count ip; do
        if [ $count -ge 3 ]; then
            echo "  $ip - $count attempts"
        fi
    done

} | tee "$REPORT"

echo ""
echo "Saved: $REPORT"
