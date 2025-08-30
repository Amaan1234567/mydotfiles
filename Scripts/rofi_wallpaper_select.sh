#!/bin/bash
# Replace with your actual absolute path
path="~/Pictures/backgrounds/"

files="";
filenames=""
i=0
for file in "$path"*.jpg "$path"*.png "$path"*.jpeg; do
    [ -e "$file" ] || continue
    filename=$(basename "$file")
    filenames+="${filename}\n"
    if [ "$i" -eq 0 ]; then
        files+="${filename}\0icon\x1fthumbnail://$file"
    else
        files+="\n${filename}\0icon\x1fthumbnail://$file"
    fi
    i=$((i+1))
done
files = echo "$files"
if [ -z "$files" ]; then
    notify-send "No images found" "Check your wallpaper directory: $path"
    exit 1
fi

echo -e "$filenames";

x=$(seq 0 .01 1 | shuf | head -n1);
y=$(seq 0 .01 1 | shuf | head -n1);
wall=$(echo -e "$files" | rofi -dmenu -show-icons -theme gen_theme.rasi \
    -p "Select Wallpaper" -preview-cmd '~/Scripts/make_thumb.sh "{input}" "{output}" ')

if [ -z "$wall" ]; then
    exit 0
else
    fullpath="${path}${wall}"
    # Replace these with your wallpaper-setting commands
    wallust run "$fullpath" -C ~/.config/wallust/wallust.toml -w
    pywalfox update
    swww img --transition-type grow --transition-pos "$x","$y" --transition-step 25 --transition-fps 144 --transition-duration 1.5 "$fullpath"
    asusctl aura static -c "$(cat ~/rog_colors.txt)"
    THUMBNAIL="/tmp/wallpaper_thumb.png"
    convert "$fullpath" -resize 1280x720 "$THUMBNAIL"
    #notify-send "Wallpaper Changed" "New wallpaper: $(basename "$wall")" -i "$THUMBNAIL"
    notify-send --hint=string:image-path:$THUMBNAIL  "Wallpaper changed" "Wallpaper changed to $(basename "$wall")"
fi
