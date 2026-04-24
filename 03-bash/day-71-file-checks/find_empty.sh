#!/bin/bash

search_dir="${1:-.}"

if [ ! -d "$search_dir" ]; then
    echo "ERROR: $search_dir is not a directory"
    exit 1
fi

echo "Searching for empty files in: $search_dir"
echo ""

count=0

for file in "$search_dir"/*; do
    if [ -f "$file" ] && [ ! -s "$file" ]; then
        echo "  - Empty file: $file"
        ((count++))
    fi
done

if [ $count -eq 0 ]; then
    echo "No empty files found"
else
    echo ""
    echo "Total empty files: $count"
fi