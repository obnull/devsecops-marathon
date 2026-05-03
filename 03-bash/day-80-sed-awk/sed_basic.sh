#!/bin/bash

echo "=== Original ==="
cat data.txt
echo ""

echo "=== Replace with first 'bash' with 'zsh' ==="
sed 's/bash/zsh/' data.txt
echo ""

echo "=== Replace all 'x' with '*' (global) ==="
sed 's/x/*/g' data.txt
echo ""

echo "=== Replace second 'bin' in each line ==="
sed 's/bin/OPT/2' data.txt

cp data.txt data_copy.txt

sed -i 's/bin/zsh/g' data_copy.txt
echo "After sed -i:"
cat data_copy.txt

sed '/false/d' data.txt
