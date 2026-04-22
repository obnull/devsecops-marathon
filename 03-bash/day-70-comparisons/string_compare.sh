#!/bin/bash

read -p "Enter first word " str1
read -p "Enter second word " str2

if [ $str1 = $str2 ]; then
    echo "strings equal"
else
    echo "strings not equal"
fi

if [ -z "$str1" ] || [ -z "$str2" ]; then
echo "string is empty"
exit 1
fi