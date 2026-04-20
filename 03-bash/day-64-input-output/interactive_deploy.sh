#!/bin/bash
# Можно передать окружение как аргумент, либо спросить

if [ -n "$1" ]; then
    ENV="$1"
else
    read -p "No environment specified. Enter environment (dev/staging/prod): " ENV
fi

case $ENV in
    dev)
        echo "🚀 Deploying to DEVELOPMENT"
        ;;
    staging)
        echo "🧪 Deploying to STAGING"
        ;;
    prod)
        echo "⚠️  Deploying to PRODUCTION - confirm!"
        read -p "Type 'yes' to continue: " CONFIRM
        if [ "$CONFIRM" != "yes" ]; then
            echo "Deploy cancelled"
            exit 1
        fi
        ;;
    *)
        echo "ERROR: Unknown environment '$ENV'"
        exit 1
        ;;
esac

echo "Deploying application..."
echo "Deploy to $ENV completed!"