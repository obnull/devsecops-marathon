#!/bin/bash

backup_dir="/tmp/backup_test"
source_file="/etc/passwd"

if [ -f "$source_file" ] && [ -w "$backup_dir" ]; then
    cp "$source_file" "$backup_dir/"
    echo "SUCCESS: Backup created"
elif [ -f "$source_file" ] && [ ! -w "$backup_dir" ]; then
    echo "WARNING: $backup_dir is not writable"
else
    echo "ERROR: $source_file not found"
fi