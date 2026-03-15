#!/bin/bash

echo "System monitoring script"

echo "CPU checking..."
uptime

echo "RAM checking..."
free -h

echo "Disk checking..."
df

echo "Done"
