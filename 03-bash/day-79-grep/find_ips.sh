#!/bin/bash

echo "=== IP ADDRESSES ==="
grep -E "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" test.txt
echo ""
echo "=== Only IP (withou surrounding text) ==="
grep -E -o "[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" test.txt
