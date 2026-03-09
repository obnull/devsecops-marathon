#!/bin/bash

DAYS=(
"day-27-git-branching"
"day-28-git-merge-strategies"
"day-29-git-conflict-resolution"
"day-30-git-rebase-workflow"
"day-31-git-history-recovery"
"day-32-git-hooks-security"
"day-33-lab-git-team-workflow"
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
