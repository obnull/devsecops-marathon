#!/bin/bash

LOG_FILE="test-auth.log"

echo "========== LOG SUMMARY =========="
echo ""
echo "Total lines: $(wc -l < "$LOG_FILE")"
echo ""
echo "Failed attempts: $(grep -c "Failed" "$LOG_FILE")"
echo "Successful logins: $(grep -c "Accepted" "$LOG_FILE")"
echo "Sudo commands: $(grep -c "sudo" "$LOG_FILE")"
echo ""
echo "================================="
