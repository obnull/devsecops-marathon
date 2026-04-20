#!/bin/bash
# Читает имена пользователей из stdin и создает их

echo "Enter usernames (one per line). Press Ctrl+D when done:"

while read -r USERNAME; do
    if [ -z "$USERNAME" ]; then
        continue
    fi
    echo "Creating user: $USERNAME"
    # sudo useradd "$USERNAME"  # раскомментируй если хочешь реально создать
done