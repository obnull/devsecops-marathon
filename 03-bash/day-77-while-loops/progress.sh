#!/bin/bash

TOTAL=20
CURRENT=0

echo -n "Loading: ["

while [ $CURRENT -le $TOTAL ]; do

PERCENT=$((CURRENT * 100 / TOTAL))

FILLED=$((CURRENT * 20 / TOTAL))
BAR=$(printf "%${FILLED}s" | tr ' ' '=')
SPACE=$(printf "%$((20 - FILLED))s")

printf "\rLoading: [%s%s] %d%%" "$BAR" "$SPACE" "$PERCENT"
sleep 0.2
CURRENT=$((CURRENT + 1))
done

echo -e "\nComplete!"
