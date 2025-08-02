#!/bin/sh

# Current space info
CURRENT_SPACE=$(yabai -m query --spaces --space | jq -r '.index')
THIS_SPACE=$(echo "$NAME" | cut -d'.' -f2)

# Update all spaces
for i in {1..12}; do
  if [ "$i" -eq "$THIS_SPACE" ]; then
    # Highlight current space
    sketchybar --set "space.$i" \
      background.color=0x40ffffff \
      icon.color=0xff000000
  else
    # Reset other spaces
    sketchybar --set "space.$i" \
      background.color=0x20ffffff \
      icon.color=0xff888888
  fi
done

# Force redraw
sketchybar --trigger space_change