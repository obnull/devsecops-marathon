#!/bin/bash

SERVERS="servers.txt"

if [ ! -f "$SERVERS" ]; then
echo "ERROR: $SERVERS not found"
exit 1
fi

while read -r server; do
if [ -z "$server" ]; then
continue
fi

echo -n "Checking $server"

if ping -c 1 -W 1 "$server" &>/dev/null; then
echo "OK"
else
echo "FAILED"
fi

done < "$SERVERS"
