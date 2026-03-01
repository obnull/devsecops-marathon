#!/bin/bash

DAYS=(
"day-21-apt-trust-model"
"day-22-process-lifecycle"
"day-23-systemd-deep-dive"
"day-24-logging-observability"
"day-25-network-basics-security"
"day-26-secure-service-lab"
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
