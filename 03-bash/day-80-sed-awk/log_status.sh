#!/bin/bash
# Статистика по логу

LOG="log.txt"

echo "=== LOG STATISTICS ==="
echo ""

echo "1. Total lines: $(wc -l < $LOG)"
echo ""

echo "2. Count by level:"
awk '{print $4}' "$LOG" | sort | uniq -c
echo ""

echo "3. ERROR messages only:"
awk '/ERROR/ {print $0}' "$LOG"
echo ""

echo "4. Time of first and last ERROR:"
echo -n "   First: "
awk '/ERROR/ {print $1, $2; exit}' "$LOG"
echo -n "   Last:  "
awk '/ERROR/ {time=$1" "$2} END {print time}' "$LOG"
