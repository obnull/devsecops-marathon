#!/bin/bash

cleanup() {
    echo ""
    echo "interrupted! cleaning..."
    rm -f /tmp/temp_$$.txt
    exit 130
}

trap cleanup SIGINT

echo "PID: $$"
echo "Data" > /tmp/temp_$$.txt
echo "Temp file created. Press CTRL+C to stop"

while true; do
echo "running..."
sleep 2
done