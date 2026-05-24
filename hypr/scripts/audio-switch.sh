#!/usr/bin/env bash
# rofi audio sink switcher
# Lists all available audio output devices and lets you switch via rofi.
# Also migrates currently-playing streams to the new sink.

set -euo pipefail

# Build map: description -> sink name
declare -A sinks
while IFS=$'\t' read -r _ name _ _ _; do
    desc=$(pactl list sinks | awk -v n="$name" '
        /^Sink #/ { in_block=0 }
        $0 ~ "Name: " n { in_block=1 }
        in_block && /Description:/ {
            sub(/^[[:space:]]*Description: /, "")
            print
            exit
        }
    ')
    [[ -z "$desc" ]] && desc="$name"
    sinks["$desc"]="$name"
done < <(pactl list short sinks)

if [[ ${#sinks[@]} -eq 0 ]]; then
    notify-send -u critical "音频" "未找到任何输出设备" 2>/dev/null || true
    exit 1
fi

# Current default
current_name=$(pactl get-default-sink)
current_desc=""
for desc in "${!sinks[@]}"; do
    [[ "${sinks[$desc]}" == "$current_name" ]] && current_desc="$desc"
done

# Build menu with marker on current
menu=""
for desc in "${!sinks[@]}"; do
    if [[ "$desc" == "$current_desc" ]]; then
        menu+="● $desc"$'\n'
    else
        menu+="  $desc"$'\n'
    fi
done

selected=$(printf '%s' "$menu" | rofi -dmenu -i -p "🔊" -theme catppuccin-mocha)
[[ -z "$selected" ]] && exit 0

# Strip marker prefix
selected="${selected#● }"
selected="${selected#  }"

target="${sinks[$selected]:-}"
if [[ -z "$target" ]]; then
    notify-send -u critical "音频" "未知设备: $selected" 2>/dev/null || true
    exit 1
fi

# Switch default + migrate active streams
pactl set-default-sink "$target"
pactl list short sink-inputs | awk '{print $1}' | while read -r input_id; do
    pactl move-sink-input "$input_id" "$target" 2>/dev/null || true
done

notify-send -i audio-volume-high "音频输出" "$selected" 2>/dev/null || true
