#!/bin/bash

echo "=== Method 1: {1..5} ==="

for i in {1..5}; do
echo "Number $i"
done

echo "=== Method 2: seq ==="

for i in $(seq 1 3 10); do
echo "Step 3: $i"
done


echo "=== Method 3: C-style ==="

for ((i=0; i<=10; i+=2)); do
echo "Even: $i"
done
