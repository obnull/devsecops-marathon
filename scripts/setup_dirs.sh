#!/bin/bash

DAYS=(
"day-103-tls-basics"
"day-104-certbot-issue"
"day-105-nginx-https"
"day-106-cert-renewal"
"day-107-ssl-test"
"day-108-lab-ssl-site"
)

STAGE="04-web"

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
