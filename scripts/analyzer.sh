#!/bin/bash

#Easy analized logs from DevSecOps

LOG_DIR="./logs/nginx"
REPORT="security-report-$(date +%Y%m%d)".txt

echo "[L] Security Analysis Report - $(date)" > $REPORT
echo "======================================" >> $REPORT
echo -e "\n[F] Top attacking IPs:" >> $REPORT
grep -E "401|403|404|500|400" $LOG_DIR/access.log | awk '{print $1}' | sort | uniq -c | sort -rn | head -5 >> $REPORT
echo -e "\n⚠️ Suspicious requests:" >> $REPORT
grep -E "\.\./|etc/passwd|union|select|1=1" $LOG_DIR/access.log >> $REPORT
echo -e "\n❌ Application errors:" >> $REPORT
grep -E "error|crit|alert" $LOG_DIR/error.log >> $REPORT
echo -e "\n🔑 Brute force attempts:" >> $REPORT
grep "Failed password" logs/security/auth.log | awk '{print $1,$2,$3,$11}' >> $REPORT
echo -e "\n✅ Report saved to: $REPORT"

