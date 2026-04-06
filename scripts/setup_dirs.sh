#!/bin/bash

DAYS=(
"day-55-dns-records"
"day-56-http-basics"
"day-57-https-tls"
"day-58-http-diagnostics"
"day-59-service-path-analysis"
"day-60-final-lab-network-hardening"
)

STAGE="02-networking"

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
