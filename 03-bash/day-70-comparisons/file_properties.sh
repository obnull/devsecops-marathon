#!/bin/bash

target="$1"

if [ ! -e "$target" ]; then
    echo "Error! $target not exist!"
    exit 1
fi

echo "Checking: $target"
echo ""

[ -f "$target" ] && echo "    - Default file"
[ -d "$target" ] && echo "    - Directory"
[ -r "$target" ] && echo "    - Readable"
[ -w "$target" ] && echo "    - Recordable"
[ -x "$target" ] && echo "    - Executable"
[ -s "$target" ] && echo "    - Not empty"