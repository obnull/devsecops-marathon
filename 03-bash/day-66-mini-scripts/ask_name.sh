#1/bin/bash

read -p "What is your name? " name

if [ -z "$name" ]; then 
    echo "You didn't enter a name!"
    exit 1
fi

echo "Nice to meet you, $name!"