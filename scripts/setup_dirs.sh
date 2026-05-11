#!/bin/bash

DAYS=(
"day-89-nginx-install"
"day-90-nginx-config"
"day-91-nginx-logs"
"day-92-static-site"
"day-93-nginx-reload"
"day-94-lab-static-site"
)

STAGE="04-web"

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
