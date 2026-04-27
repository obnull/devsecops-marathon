#!/bin/bash

USERLIST="users.txt"

if [ ! -f "$USERLIST" ]; then
echo "ERROR: $USERLIST not found"
exit 1
fi

while IFS= read -r user; do
echo "checking user $user"

if id "$user" &>/dev/null; then
echo " $user already exists"
else
echo "can create: $user"
fi
done < "$USERLIST"
