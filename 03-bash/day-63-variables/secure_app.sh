#!/bin/bash

if [ -z "$API_KEY" ]; then
    echo "❌ ERROR: API_KEY not set in environment"
    exit 1
fi

echo "✅ API_KEY loaded (length: ${#API_KEY} chars)"
echo "Calling API with key: ${API_KEY:0:4}...****"