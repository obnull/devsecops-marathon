#!/bin/bash

DAYS=(
"day-116-python-setup"
"day-117-variables-types"
"day-118-collections"
"day-119-conditions"
"day-120-loops"
"day-121-lab-log-parser"
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
