#!/usr/bin/env bash
# Auto-disable the laptop's internal display (eDP-2) when any external
# monitor is connected. Re-enable when external is gone.

set -euo pipefail

INTERNAL="eDP-2"
INTERNAL_SPEC="${INTERNAL}, 2880x1800@120, 0x0, 1.6"
SOCK="${XDG_RUNTIME_DIR}/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock"

apply_state() {
  local external_count
  external_count=$(hyprctl monitors -j 2>/dev/null \
    | python3 -c "import json,sys; ms=json.load(sys.stdin); print(sum(1 for m in ms if m['name']!='${INTERNAL}'))")
  if [[ "${external_count}" -gt 0 ]]; then
    # External present → disable internal
    if hyprctl monitors -j | python3 -c "import json,sys; print(any(m['name']=='${INTERNAL}' and not m.get('disabled',False) for m in json.load(sys.stdin)))" | grep -q True; then
      hyprctl keyword monitor "${INTERNAL}, disable" >/dev/null
      logger -t monitor-hotplug "external detected (${external_count}) → disabled ${INTERNAL}"
    fi
  else
    # Only internal → make sure it's on
    hyprctl keyword monitor "${INTERNAL_SPEC}" >/dev/null
    logger -t monitor-hotplug "no external → re-enabled ${INTERNAL}"
  fi
}

# Apply once at startup so it works regardless of state when launched
apply_state

# Then react to hot-plug events
socat -u "UNIX-CONNECT:${SOCK}" - 2>/dev/null | while read -r line; do
  case "${line%%>>*}" in
    monitoradded|monitorremoved|monitoraddedv2|monitorremovedv2)
      sleep 0.3   # let Hyprland settle
      apply_state
      ;;
  esac
done
