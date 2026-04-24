#!/bin/bash

dir="/tmp/backup_$(date +%Y%m%d)"

if [ -d "$dir" ]; then
echo "Directory $dir already exists"
    
if [ -w "$dir" ]; then
echo "And it's writable. Ready to use."
else
echo "But it's NOT writable. Exiting."
exit 1
fi
else
echo "Directory $dir does not exist. Creating..."
mkdir -p "$dir"
    
if [ -d "$dir" ] && [ -w "$dir" ]; then
echo "Successfully created and writable"
else
echo "Failed to create directory"
exit 1
fi
fi

echo "Test file created at $(date)" > "$dir/test.txt"
echo "File saved to $dir/test.txt"