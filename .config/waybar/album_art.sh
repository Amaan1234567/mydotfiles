#!/bin/zsh
album_art=
curl "$(playerctl -p spotify metadata mpris:artUrl)">~/Pictures/cover.jpeg
echo "/tmp/cover.jpeg"