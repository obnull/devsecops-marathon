#!/bin/bash

file="$1"

if [ -z "$file" ]; then
echo "Usage: $0 <filename>"
exit 1
fi

if [ ! -e "$file" ]; then
echo "ERROR: $file does not exist"
exit 1
fi

echo "Checking: $file"
echo ""

[ -f "$file" ] && echo "  - Regular file"
[ -d "$file" ] && echo "  - Directory"
[ -L "$file" ] && echo "  - Symbolic link"
[ -s "$file" ] && echo "  - Not empty" || echo "  - Empty"
[ -r "$file" ] && echo "  - Readable"
[ -w "$file" ] && echo "  - Writable"
[ -x "$file" ] && echo "  - Executable"
[ -O "$file" ] && echo "  - Owned by you"
[ -G "$file" ] && echo "  - Same group as you"