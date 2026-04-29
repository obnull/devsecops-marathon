#!/bin/bash

LOG_FILE="test-auth.log"

echo "Monitoring: $LOG_FILE"
echo "Press CTRL+C to stop"

tail -f "$LOG_FILE" | while read line; do

case "$line" in
*"Failed"*)
echo "[!] ALERT: Failed login detected"
;;
*"Accepted"*)
echo "[+] OK: Successful login"
;;
*"sudo"*)
echo "[*] INFO: Sudo command executed"
;;
esac
done
