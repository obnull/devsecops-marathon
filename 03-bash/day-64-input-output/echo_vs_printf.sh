#!/bin/bash

echo "=== echo examples ==="
echo "Simple text"
echo -n "No newline at end"
echo " -> continues here"
echo "User: $USER, Date: $(date)"

echo ""
echo "=== printf examples ==="
printf "Just text\n"
printf "With format: %s\n" "Hello"
printf "Number: %d, String: %s\n" 42 "Bash"
printf "%-10s | %5s\n" "Name" "Age"
printf "%-10s | %5d\n" "Alice" 25
printf "%-10s | %5d\n" "Bob" 30