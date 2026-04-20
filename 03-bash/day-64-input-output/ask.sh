#!/bin/bash
echo "=== User Interaction ==="

read -p "Enter your name: " NAME
read -p "Enter your age: " AGE
read -s -p "Enter password: " PASSWORD
echo  # пустая строка после скрытого ввода

echo ""
echo "Hello $NAME, age $AGE"
echo "Password length: ${#PASSWORD} characters"