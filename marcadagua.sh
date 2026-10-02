#!/bin/bash

logo="$1"

for file in *.jpeg; do
    height=$(magick identify -format "%h" "$file")
    wm_height=$((height * 10 / 100))

    magick "$file" \
        \( "$logo" -resize "x${wm_height}" \) \
        -gravity northwest \
        -geometry +50+50 \
        -composite "logo$file"
done

