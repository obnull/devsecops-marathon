#!/bin/bash

cmd="$1"

if [ -z "$cmd" ]; then
    echo "Usage: $0 <command>"
    exit 1
fi

# Проверяем, существует ли команда в PATH
path=$(which "$cmd" 2>/dev/null)

if [ -z "$path" ]; then
    echo "ERROR: $cmd not found in PATH"
    exit 1
fi

echo "Found: $path"

if [ -x "$path" ]; then
    echo "Status: Executable"
    
    if [ -O "$path" ]; then
        echo "Owner: You own this file"
    else
        echo "Owner: Not you"
    fi
else
    echo "Status: NOT executable"
fi