#!/bin/bash

read -p "Enter first number " a
read -p "Enter second number " b

if [ $a -eq $b ]; then
    echo "$a equal $b"
elif [ $a -gt $b ]; then
    echo "$a greater $b"
else
    echo "$a less $b"
fi