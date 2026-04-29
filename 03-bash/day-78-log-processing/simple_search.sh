#!/bin/bash

LOG_FILE="test-auth.log"

if [ ! -f "$LOG_FILE" ]; then
echo "ERROR: log file not found"
exit 1
fi

echo "=== ALL FAILED ATTEMPTS ==="
echo ""

grep "Failed" "$LOG_FILE"
echo ""

echo "=== COUNT: $(grep -c "Failed" "$LOG_FILE") attempts"
echo ""

grep "Failed password for root" "$LOG_FILE"
