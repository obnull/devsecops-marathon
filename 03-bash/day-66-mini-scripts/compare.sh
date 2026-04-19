#!/bin/bash
# Usage: ./comape.sh <num1> <num2>

if [ $# -ne 2 ]; then
    echo "Usage: $0 <num1> <num2>"
    exit 1
fi

if [ $1 -eq $2 ]; then
    echo "$1 equals $2"
elif [ $1 -gt $2 ]; then
    echo "$1 greater than $2"
else
    echo "$1 is less than $2" 
fi