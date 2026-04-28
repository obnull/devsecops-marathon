TARGET_FILE="/tmp/ready.flag"
TIMEOUT=30
COUNTER=0

echo "Waiting fot $TARGET_FILE..."

while [ ! -f "$TARGET_FILE" ]; do
sleep 1
COUNTER=$((counter + 1))

if [ $COUNTER -ge $TIMEOUT ]; then
echo "Timeout! File not found after ${TIMEOUT}s"
exit 1
fi

echo "Still waiting... (${COUNTER}s)"
done

echo "File detected!"
