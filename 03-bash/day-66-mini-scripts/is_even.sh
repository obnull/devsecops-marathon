#!/bin/bash
# Usage: ./is_even.sh <number>

if [ -z "$1" ]; then
    echo "Usage: $0 <number>"
    exit 1
fi

if [ $(( $1 % 2 )) -eq 0 ]; then
    echo "$1 is even"
else
    echo "$1 is odd"
fi