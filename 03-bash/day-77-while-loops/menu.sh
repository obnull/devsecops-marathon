#!/bin/bash

OPTION=""

while [ "$OPTION" != "4" ]; do
    clear
    echo "========== MENU =========="
    echo "1. Show date"
    echo "2. Show disk usage"
    echo "3. Show memory info"
    echo "4. Exit"
    echo "=========================="
    read -p "Choose [1-4]: " OPTION
    
    case $OPTION in
        1)
            echo "Date: $(date)"
            read -p "Press Enter..."
            ;;
        2)
            df -h
            read -p "Press Enter..."
            ;;
        3)
            free -h
            read -p "Press Enter..."
            ;;
        4)
            echo "Goodbye!"
            ;;
        *)
            echo "Invalid option"
            read -p "Press Enter..."
            ;;
    esac
done
