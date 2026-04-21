#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Error! Please, enter a argument"
    echo "Example: $0 hello world"
    exit 1
else
    echo "Enter args: $#"
    echo "First arg: $1"
fi
