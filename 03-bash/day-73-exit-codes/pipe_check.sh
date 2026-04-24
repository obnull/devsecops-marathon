#!/bin/bash

echo "=== Without pipefail ==="
cat /fakefile | grep test | wc -l
echo "Exit code: $?"

set -o pipefail
echo "=== With pipefail ==="
cat /fakefile | grep test | wc -l
echo "Exit code: $?"