#!/bin/bash

DAYS=(
"day-140-threadpoolexecutor"
"day-141-queue"
"day-142-multiprocessing"
"day-143-file-processing"
"day-144-progress"
"day-145-lab-log-analyzer"
)

STAGE="06-python-automation"

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
