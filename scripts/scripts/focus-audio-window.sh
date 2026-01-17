#!/usr/bin/env bash

# Ensure something is playing or paused
status=$(playerctl status 2>/dev/null)

# If no media is playing or paused, exit
[ -z "$status" ] && exit 0

# Get the current media title
media_title=$(playerctl metadata --format '{{title}}' 2>/dev/null | tr '[:upper:]' '[:lower:]')

[ -z "$media_title" ] && exit 0

# Matching on both title and class
class=$(hyprctl clients -j | jq -r --arg mt "$media_title" '
  .[]
  | select(.class | startswith("brave-"))
  | select((.title | ascii_downcase) | contains($mt))
  | .class
' | head -n 1)

[ -z "$class" ] && exit 0

# Focus the window with the correct class
omarchy-launch-or-focus "$class"
