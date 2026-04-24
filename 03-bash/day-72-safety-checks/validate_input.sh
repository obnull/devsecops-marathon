#!/bin/bash

read -p "Enter your name (at least 2 chars): " name

if [ -z "$name" ]; then
echo "ERROR: name cannot be empty"
exit 1
fi

if [ ${#name} -lt 2 ]; then
echo "ERROR: name must be at least 2 characters"
exit 1
fi

echo "OK: hello, $name!"

read -p "enter a number between 1 and 100: " num

if [ "$num" -ge 1 ] && [ "$num" -le 100 ] 2>/dev/null; then
echo "OK: $num is valid"
else
echo "ERROR: $num is not between 1 and 100"
exit 1
fi

