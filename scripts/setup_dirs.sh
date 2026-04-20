#!/bin/bash

DAYS=(
"day-69-if-else"
"day-70-comparisons"
"day-71-file-checks"
"day-72-safety-checks"
"day-73-exit-codes"
"day-74-lab-system-check"
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
