#!/bin/bash

DAYS=(
"day-110-security-headers-1"
"day-111-hsts"
"day-112-csp-basics"
"day-113-referrer-policy"
"day-114-method-limit"
"day-115-final-lab-secure-website"
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
