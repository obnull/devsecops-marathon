#!/bin/bash

DAYS=(
"day-134-datetime"
"day-135-regex"
"day-136-sockets"
"day-137-argparse"
"day-138-threading"
"day-139-final-port-scanner"
)

STAGE="05-python-api"

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
