#!/bin/bash

if [ -f /var/log/auth.log ] ; then
echo "OK: logs directory is exists"

failed=$(grep -i "failed password" /var/log/auth.log 2>/dev/null | tail -20 | wc -l || true)

if [ $failed -gt 0 ]; then
echo "Found $failed failed login attempts (last 20 lines)"
else
echo "OK: no failed login founds"
fi

else
echo "WARN: /var/log/auth.log not found (no SSH logs)"
fi


echo ""


ps aux | grep sshd | grep -v grep > /tmp/ssh_check.txt
if [ -s /tmp/ssh_check.txt ]; then
echo "OK: SSH service is running"
else
echo "WARN: SSH servise is not running"
fi


rm -f /tmp/ssh_check.txt
