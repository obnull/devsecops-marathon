#!/bin/bash

PROCESS_NAME="$1"

if [ -z "$PROCESS_NAME" ]; then
echo "Usage $0 <process_name>"
exit 1
fi

echo "Monitoring process $PROCESS_NAME"
echo "Press CTRL+C to stop"

while true; do 
if pgrep -x "$PROCESS_NAME" > /dev/null; then
PID=$(pgrep -x "$PROCESS_NAME")
echo "[$(date +%H:%M:%S)] $PROCESS_NAME is running (PID: $PID)"
else
echo "[$(date +%H:%M:%S)] $PROCESS_NAME is NOT running"
fi
sleep 2
done
