#!/bin/bash

DAYS=(
"day-128-os-subprocess"
"day-129-requests"
"day-130-api-auth"
"day-131-json-xml"
"day-132-env-secrets"
"day-133-lab-healthcheck"
)

STAGE="05-python-api"

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
