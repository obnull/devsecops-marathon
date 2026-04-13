#!/bin/bash

DAYS=(
"day-62-bash-intro"
"day-63-variables"
"day-64-input-output"
"day-65-arithmetic"
"day-66-mini-scripts"
"day-67-lab-backup"
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
