#!/bin/bash

timeuot_cmd() {
local timeout=$1
shift
"$@" &
pid=$!

(
sleep "$timeout"
kill -9 $pid 2>/dev/null
echo "TIMEOUT: Command killed after ${timeout}s"
) &
killer=$!

wait $pid 2>/dev/null
kill -9 $killer 2>/dev/null
}

echo "Running 'sleep 10' with 3 second timeout..."
timeout 3 sleep 10
