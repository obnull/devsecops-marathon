#!/bin/bash

LOG_FILE="test-auth.log"
DATE=$(date +%Y%m%d_%H%M%S)
REPORT="report_$DATE.txt"

{
    echo "=== SECURITY REPORT ==="
    echo "Date: $(date)"
    echo "Log file: $LOG_FILE"
    echo ""
    
    echo "1. TOTAL FAILED: $(grep -c "Failed" "$LOG_FILE")"
    echo ""
    
    echo "2. FAILED BY USER:"
    echo "   root: $(grep -c "Failed password for root" "$LOG_FILE")"
    echo "   other: $(grep "Failed password" "$LOG_FILE" | grep -v "root" | grep -v "invalid" | wc -l)"
    echo "   invalid: $(grep -c "invalid user" "$LOG_FILE")"
    echo ""
    
    echo "3. SUCCESSFUL LOGINS:"
    grep "Accepted" "$LOG_FILE" | while read line; do
        echo "   $line"
    done
    echo ""
    
    echo "4. LAST 5 FAILED ATTEMPTS:"
    grep "Failed" "$LOG_FILE" | tail -5
} > "$REPORT"

echo "Report saved: $REPORT"
cat "$REPORT"
