#!/bin/zsh

# Set the wallpaper directory
WALLPAPER_DIR="$HOME/Pictures/backgrounds"

# Select a random wallpaper
WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' -o -iname '*.jpeg' \) | shuf -n 1)

# Check if a wallpaper was found
if [[ -n "$WALLPAPER" ]]; then
    # Set the wallpaper using swww
    wallust run "$WALLPAPER" -C ~/.config/wallust/wallust.toml
    x=$(seq 0 .01 1 | shuf | head -n1);
    y=$(seq 0 .01 1 | shuf | head -n1);
    THUMBNAIL="/tmp/wallpaper_thumb.png"
    swww img -o eDP-1 --transition-type outer --transition-pos "$x","$y" --transition-step 60 --transition-duration 1.5 --transition-fps 144 "$WALLPAPER"
    pywalfox update
    swww img -o HDMI-A-1 --transition-type outer --transition-pos "$x","$y" --transition-step 60 --transition-duration 1.5 --transition-fps 60 "$WALLPAPER"
    convert "$WALLPAPER" -resize 1280x720 "$THUMBNAIL"
    asusctl aura static -c $(cat ~/rog_colors.txt)
    # Send notification with thumbnail using swaync
    swaync-client -rs
    #notify-send "Wallpaper Changed" "New wallpaper: $(basename "$WALLPAPER")" -i "$THUMBNAIL"
    notify-send --hint=string:image-path:$THUMBNAIL  "Wallpaper changed" "Wallpaper changed to $(basename "$WALLPAPER")"
    # Any other commands that need the wallpaper path can go here
    echo "$(date) - Changed wallpaper to: $wallpaper" >> $HOME/wallpaper_log.txt
fi
