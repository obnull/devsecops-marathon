#!/bin/bash

DAYS=(
"day-14-docker-install"
"day-15-dockerfile"
"day-16-docker-compose"
"day-17-docker-security"
"day-18-trivy-scan"
"day-19-docker-monutoring"
"day-20-lab-final"
)

STAGE="01-linux-basics"

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
