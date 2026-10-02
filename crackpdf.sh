#!/usr/bin/env bash

pdf="$1"

for width in {1..8}; do
    for ((n=0; n<10**width; n++)); do
        password=$(printf "%0${width}d" "$n")

        qpdf --password="$password" --requires-password "$pdf" \
            >/dev/null 2>&1

        if [ $? -eq 3 ]; then
            echo "PASSWORD FOUND: $password"
            exit 0
        fi
    done
done

echo "No numeric password found."
