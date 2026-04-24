#!/bin/bash

file1="$1"
file2="$2"

if [ ! -e "$file1" ] || [ ! -e "$file2" ]; then
echo "ERROR: Both files must exist"
echo "Usage: $0 <file1> <file2>"
exit 1
fi

if [ "$file1" -nt "$file2" ]; then
echo "$file1 is newer than $file2"
elif [ "$file1" -ot "$file2" ]; then
echo "$file1 is older than $file2"
else
echo "Both files have the same modification time"
fi