#!/bin/bash

DAYS=(
"day-122-functions"
"day-123-modules"
"day-124-files"
"day-125-exceptions"
"day-126-logging"
"day-127-lab-audit"
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
