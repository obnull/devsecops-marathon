#!/bin/bash

DAYS=(
"day-41-ssh-architecture"
"day-42-ssh-keys"
"day-43-ssh-hardening"
"day-44-ssh-access-control"
"day-45-ssh-troubleshooting"
"day-46-lab-secure-ssh"
)

STAGE="02-networking"

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
