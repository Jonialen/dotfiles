#!/usr/bin/env bash
class=$(playerctl metadata --player=spotify --format '{{lc(status)}}' 2>/dev/null)
icon=" "

if [[ $class == "playing" ]]; then
  info=$(playerctl metadata --player=spotify --format '{{artist}} - {{title}}' 2>/dev/null)
  max=${WAYBAR_SPOTIFY_MAX:-40}
  [[ ${#info} -gt $max ]] && info="${info:0:$max}…"
  text="$icon  $info"
elif [[ $class == "paused" ]]; then
  text="$icon"
else
  text=""
fi

jq -nc --arg text "$text" --arg class "$class" '{text:$text, class:$class}'
