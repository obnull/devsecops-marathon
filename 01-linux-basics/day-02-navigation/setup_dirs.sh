#!/bin/bash

DAYS=(
"day-01-setup"
"day-02-navigation"
"day-03-files"
"day-04-inspection"
"day-05-git-basics"
"day-06-lab"
)

STAGE="01-linux-basics"

mkdir -p $STAGE

for DAY in "${DAYS[@]}"; do
if [ ! -d "$STAGE/$DAY" ]; then
mkdir -p "$STAGE/$DAY"
echo "📁 Создана папка: $STAGE/$DAY"
touch "$STAGE/$DAY/.geetkeep"
else
echo "✅ Папка уже существует: $DAY"
fi
done
echo "🚀 Структура актуализирована!"
