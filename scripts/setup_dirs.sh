#!/bin/bash

DAYS=(
"day-96-reverse-proxy"
"day-97-proxy-flask"
"day-98-proxy-headers"
"day-99-load-balancing"
"day-100-redirects"
"day-101-lab-reverse-proxy"
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
