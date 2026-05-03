#!/bin/bash

echo "=== First column (username) ==="
awk -F':' '{print $1}' data.txt
echo ""

echo "=== Last column (shell) ==="
awk -F':' '{print $NF}' data.txt
echo ""

echo "=== Username and shell ==="
awk -F':' '{print $1 " -> " $NF}' data.txt

echo "=== Users with UID > 100 ==="
awk -F':' '$3>100 {print $1, $3}' data.txt
echo ""

echo "=== Lines containing ERROR in log ==="
awk '/ERROR/ {print $0}' log.txt
echo ""

echo "=== Error mennages with timestamp ==="
awk '/ERROR/ {print $1, $2, $4, $5}' log.txt
