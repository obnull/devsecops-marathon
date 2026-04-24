#!/bin/bash

ls /etc/passwd
echo "exit code: $?"

ls /fakefile 2>/dev/null
echo "exit code: $?"

true
echo "exit code: $?"

false
echo "exit code: $?"