#!/bin/bash

echo "Log analysis script"

echo "Start..."

grep -r -E -i --include="*.{txt,log}" "error|warning" /var/log

echo "Finished"
