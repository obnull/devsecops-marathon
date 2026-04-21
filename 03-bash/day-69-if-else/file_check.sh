#!/bin/bash

target="$1"

if [ -z "$target" ]; then
    echo "Usage: $0 <file/directory>"
    exit 1
fi

if [ -f "$target" ]; then
    echo "FILE: Regular file"
    echo "