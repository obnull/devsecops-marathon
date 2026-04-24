#!/bin/bash

set -euo pipefail

error_exit() {
echo "ERROR: $1" >&2
exit 1
}

if [ $# -ne 2 ]; then 
error_exit "Usage: $0 <source> <destination>"
fi

source="$1"
dest="$2"

[ -e "$source" ] || error_exit "Source does not exist: $source"


dest_dir=$(dirname "$dest")
[ -w "$dest_dir" ] || error_exit "Destination directory not writable: $dest_dir"

cp "$source" "$dest" && echo "SUCCESS: Copied $source to $dest"
