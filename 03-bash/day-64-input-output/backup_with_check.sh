#!/bin/bash
# Usage: ./backup_with_check.sh <source_dir> <dest_dir>

if [ $# -ne 2 ]; then
    echo "ERROR: Need exactly 2 arguments"
    echo "Usage: $0 <source_dir> <dest_dir>"
    exit 1
fi

SOURCE="$1"
DEST="$2"

if [ ! -d "$SOURCE" ]; then
    echo "ERROR: Source directory '$SOURCE' does not exist"
    exit 1
fi

if [ ! -d "$DEST" ]; then
    echo "Creating destination directory: $DEST"
    mkdir -p "$DEST"
fi

echo "Backing up $SOURCE to $DEST..."
cp -r "$SOURCE"/* "$DEST"/ 2>/dev/null
echo "Backup complete!"