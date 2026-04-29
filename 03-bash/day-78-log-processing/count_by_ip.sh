#!/bin/bash

LOG_FILE="test-auth.log"
TEMP_FILE="/tmp/ips.txt"

grep "Failed" "$LOG_FILE" | while read line; do
for word in $line; do
if [ "$word" = from ]; then 
read next_word
echo "$next_word"
break
fi
done
done > "$TEMP_FILE"

echo "=== IP attack statistics ==="
sort "$TEMP_FILE" | uniq -c | sort -nr

rm -rf "$TEMP_FILE"
