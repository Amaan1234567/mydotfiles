#!/bin/bash
# make_thumb.sh
input="$1"
output="$2"
size="$3"

# Resize image to cover a 1920x1080 canvas, center it, force it to a 16:9 aspect ratio,
# strip metadata, then crop a centered vertical slice that's 25% of 1920 (i.e., 480px)
magick "$input" -resize 1920x1080^ -gravity center -extent 1920x1080 -strip -density 72 \
    -gravity center -crop 680x1080+0+0 +repage "$output"
