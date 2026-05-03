#!/bin/bash

LOG="../day-78-log-processing/test-auth.log"

if [ ! -f "$LOG" ]; then
echo "Using test-auth.log file from day 78"
LOG="../day-78-log-processing/test-auth.log"
fi

echo "=== Failed passwords (any case) ==="
grep -i "failed" "$LOG" | head -5
echo ""

echo "=== Failed for root ==="
grep "Failed.*root" "$LOG" | head -5
echo ""

echo "=== All IP addresses in failure ==="
grep -i "failed" "$LOG" | grep -E -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq -c
