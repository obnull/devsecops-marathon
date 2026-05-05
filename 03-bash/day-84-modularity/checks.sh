#!/bin/bash

check_file_exists() {
if [ -f "$1" ]; then
return 0
else
return 1
fi
}

check_dir_exists() {
if [ -d "$2" ]; then
return 0
else
return 1
fi
}

is_root() {
if [ "$(whoami)" = "root" ]; then
return 0
else
return 1
fi
}
