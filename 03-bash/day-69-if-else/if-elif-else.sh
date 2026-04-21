#!/bin/bash

read -p "Enter %(0-100) " score

if [ $score -ge 90 ]; then
    echo "A — great!"
elif [ $score -ge 75 ]; then
    echo "B — well"
elif [ $score -ge 60 ]; then
    echo "C — done"
else
    echo "F — less"
fi