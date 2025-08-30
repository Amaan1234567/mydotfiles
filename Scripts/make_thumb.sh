#!/bin/bash
# make_thumb.sh
input="$1"
output="$2"
size="$3"


magick "$input" -resize 1920x1080^ -gravity center -extent 1920x1080 -strip -density 72 \
    -gravity center -crop 680x1080+0+0 +repage "$output"
