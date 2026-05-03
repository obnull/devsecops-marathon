#!/bin/bash

echo "=== Lines with 'root' ==="
grep "root" test.txt
echo ""
echo "=== Lines starting with 'root' ==="
grep "^root" test.txt
echo ""
echo "=== Lines ending with '5' ==="
grep "5$" test.txt
echo ""
echo "=== Any digit ==="
grep "[0-9]" test.txt
echo ""
echo "=== Exactly 3 digits ==="
grep -E "[0-9]{3}" test.txt
