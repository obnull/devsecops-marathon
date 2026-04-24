#!/bin/bash

target="$1"

if [ -z "$target" ]; then
echo "Usage: $0 <file/directory>"
exit 1
fi

if [ ! -e "$target" ]; then
echo "ERROR: $target does not exist"
exit 1
fi

echo "Warning: you are about to delete: $target"
echo "Size: $(du -sh '$target' 2>/dev/null | cut -f1"

read -p "Are your sure (yes/no): " confirm

if [ "$confirm" = "yes" ]; then
rm -rf "$target"
echo "DELETED: $target"
else
echo "CANCELLED: Nothing was deleted"
fi
