#!/bin/bash

SOURCE_DIR="$HOME/Documents"
BACKUP_DIR="$HOME/backups"
MAX_BACKUPS=5

mkdir -p "$BACKUP_DIR"

TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_NAME="backup_$(basename $SOURCE_DIR)_$TIMESTAMP.tar.gz"

echo "Creating backup: $BACKUP_NAME"
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "Backup created successfully"
else
    echo "Backup failed"
    exit 1
fi

echo "Rotating backups (keeping last $MAX_BACKUPS)..."

COUNT=0
for backup in $(ls -t "$BACKUP_DIR"/backup_*.tar.gz 2>/dev/null); do
    COUNT=$((COUNT + 1))
    if [ $COUNT -gt $MAX_BACKUPS ]; then
        echo "  Removing old: $(basename $backup)"
        rm "$backup"
    fi
done

echo "Done. Current backups:"
ls -lh "$BACKUP_DIR" | tail -5
