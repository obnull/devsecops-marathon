#!/bin/bash

LOG="../day-78-log-processing/test-auth.log"

echo "=== Brute force suspects (multiple attempts per minute) ==="
echo "Looking >2 attempts from same IP"
echo ""

grep -i "failed" "$LOG" | grep -E -o "[0-9]{2}:[0-9]{2}.*[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort | uniq -c | grep -E "^ *[0-9]"

echo ""
echo "=== External IPs ==="
grep -i "failed" "$LOG" | grep -E -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | \
grep -v -E "^(192\.168\.|10\.|172\.16\.)" | sort | uniq -c
