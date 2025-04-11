#!/bin/bash

result=0
first_number=true

while true; do
    echo
    echo "Enter the operation to perform : "
    echo "1. Addition"
    echo "2. Subtraction"
    echo "3. Multiplication"
    echo "4. Division"
    echo "5. Reset"
    echo "6. Exit"

    read choice
    if [[ "$choice" == 6 ]]; then
        echo "Exiting Calculator"
        exit 0
    fi

    if [[ "$choice" -le 0 || "$choice" -ge 7 ]]; then
        echo "Invalid Choice"
        continue
    fi

    if [[ "$choice" == 5 ]]; then
        echo "Resetting Calculator..."
        result=0
        first_number=true
        continue
    fi

    if $first_number; then
        echo "Enter first number: "
        read result
        first_number=false
    fi

    echo "Enter next number: "
    read num

    case "$choice" in
        1) result=$(($result+$num)) ;;
        2) result=$(($result-$num)) ;;
        3) result=$(($result*$num)) ;;
        4) 
            if [ "$num" -eq 0 ]; then
                echo "Error: Division by zero!"
                continue
            fi
            result=$(echo "scale=10; $result / $num" | bc) ;;
    esac
    echo "Result : $result"
done
