#!/bin/bash
# Простой имитатор логина

EXPECTED_USER="admin"
EXPECTED_PASS="secret123"

read -p "Username: " USERNAME
read -s -p "Password: " PASSWORD
echo

if [ "$USERNAME" = "$EXPECTED_USER" ] && [ "$PASSWORD" = "$EXPECTED_PASS" ]; then
    echo "✅ Login successful! Welcome $USERNAME"
    exit 0
else
    echo "❌ Login failed: Invalid credentials"
    exit 1
fi