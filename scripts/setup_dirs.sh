#!/bin/bash

DAYS=(
"day-83-functions"
"day-84-modularity"
"day-85-logging"
"day-86-cron"
"day-87-final-prep"
"day-88-final-security-monitor"
)

STAGE="03-bash"

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
