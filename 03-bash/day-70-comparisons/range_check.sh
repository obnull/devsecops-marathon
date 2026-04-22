#!/bin/bash

read -p "Enter port number " port

if [ $port -ge 1 ] && [ $port -le 1024 ]; then
    echo "This is a system port (1-1024)"
elif [ $port -ge 1025 ] && [ $port -le 49151 ]; then 
    echo "This is a registered port (1025-49151)"
elif [ $port -ge 49152 ] && [ $port -le 65535 ]; then
    echo "This is a dynamic port (49152-65535)"
else
    echo "Wrong port number"
fi