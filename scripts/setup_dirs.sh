#!/bin/bash

DAYS=(
"day-34-osi-tcpip"
"day-35-ip-routing"
"day-36-connectivity"
"day-37-ports-sockets"
"day-38-dns-basics"
"day-39-lab-network-audit"
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
