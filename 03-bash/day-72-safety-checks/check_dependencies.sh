#!/bin/bash

deps="curl jq grep awk sed"

mising=""

for cmd in $deps; do
if ! command -v "$cmd" >/dev/null 2>&1; then
missing="$missing $cmd"
fi
done

if [ -n "$missing" ]; then
echo "ERROR: Missing dependencies:$missing"
echo "Install them with: sudo apt install $missing"
exit 1
fi

echo "OK: all deps installed"
