#!/bin/bash

DAYS=(
"day-08-users-deep"
"day-09-permissions-deep"
"day-10-sudo-deep"
"day-11-special-perms"
"day-12-ssh-hardening"
"day-13-lab-rbac"
)

STAGE="01-linux-basics"

mkdir -p $STAGE

for DAY in "${DAYS[@]}"; do
if [ ! -d "$STAGE/$DAY" ]; then
mkdir -p "$STAGE/$DAY"
echo "📁 Создана папка: $STAGE/$DAY"
touch "$STAGE/$DAY/.gitkeep"
else
echo "✅ Папка уже существует: $DAY"
fi
done
echo "🚀 Структура актуализирована!"
