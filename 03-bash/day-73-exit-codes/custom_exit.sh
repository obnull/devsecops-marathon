#!/bin/bash

check_file() {
    
    if [ ! -f "$1" ]; then
    echo "ERROR: $1 not found:"
    return 1
    fi
    
    if [ ! -r "$1" ]; then 
    echo "ERROR: $1 is not readable"
    return 2 
    fi

    echo "OK: $1 exist and readable"
    return 0

}

check_file /etc/passwd
echo "code: $?"

check_file /fakefile
echo "code: $?"