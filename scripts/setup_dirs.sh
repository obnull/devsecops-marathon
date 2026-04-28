#!/bin/bash

DAYS=(
"day-76-for-loops"
"day-77-while-loops"
"day-78-log-processing"
"day-79-grep"
"day-80-sed-awk"
"day-81-lab-log-analysis"
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
