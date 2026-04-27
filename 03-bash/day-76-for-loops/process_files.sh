#!/bin/bash

for file in *.txt; do
echo "Processing: $file"
echo "Size: $(stat -c %s $file 2>/dev/null || echo 0) bytes"
echo "---"
done

for item in *; do
if [ -f "$item" ]; then
echo "FILE: $item"
elif [ -d "$item" ]; then
echo "DIR: $item"
fi
done
