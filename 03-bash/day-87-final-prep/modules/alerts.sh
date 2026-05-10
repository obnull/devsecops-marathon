#!/bin/bash

ALERTS=()

add_alert() {
ALERTS+=("$1")
}

send_alerts() {
if [ ${ALERTS[@]} -gt 0 ]; then
echo "=== ALERTS ==="
for alert in "${ALERTS[@]}"; do
echo "  ⚠️  $alert"
done
fi
}
