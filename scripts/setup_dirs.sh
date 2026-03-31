#!/bin/bash

DAYS=(
"day-48-firewall-basics"
"day-49-ufw-allow-rules"
"day-50-ufw-deny-rules"
"day-51-firewall-verification"
"day-52-attack-surface"
"day-53-lab-firewall-policy"
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
