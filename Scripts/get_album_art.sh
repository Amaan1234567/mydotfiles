#!/usr/bin/env bash

# Subscribe to artUrl changes as the song changes
playerctl -p spotify metadata mpris:artUrl --format '{{mpris:artUrl}}' --follow |
while read -r arturl; do
  # Kick off the download in the background
  curl -s "$arturl" > "$HOME/Pictures/cover.jpeg" &
done
