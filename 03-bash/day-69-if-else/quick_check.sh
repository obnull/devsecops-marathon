#!/bin/bash

# && executes only on success (exit 0)
[ -d "/var/log" ] && echo "OK: /var/log exists"

# || executes on failure
[ -f "/fake/file" ] || echo "WARNING: File not found, creating fallback..."
touch "/tmp/fallback.log"