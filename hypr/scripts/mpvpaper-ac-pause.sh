#!/usr/bin/env bash
# Pause mpvpaper when on battery, resume when on AC.
# Talks to mpv via its JSON IPC socket. Polls /sys every few seconds —
# negligible CPU cost (single byte read), survives suspend/resume.

set -u

SOCKET="${MPVPAPER_SOCKET:-/tmp/mpvpaper-socket}"
AC="${AC_ONLINE_PATH:-/sys/class/power_supply/ACAD/online}"
INTERVAL="${POLL_INTERVAL:-3}"

# Wait up to 60s for mpvpaper to create its IPC socket
for _ in $(seq 1 60); do
  [ -S "$SOCKET" ] && break
  sleep 1
done
[ -S "$SOCKET" ] || { echo "mpvpaper socket not found at $SOCKET" >&2; exit 1; }

set_pause() {
  # $1 = "true" | "false"
  printf '{"command":["set_property","pause",%s]}\n' "$1" \
    | socat - "$SOCKET" >/dev/null 2>&1
}

last=""
while :; do
  if [ -r "$AC" ]; then
    cur=$(cat "$AC")
    if [ "$cur" != "$last" ]; then
      case "$cur" in
        1) set_pause false ;;   # plugged in → play
        0) set_pause true  ;;   # on battery → pause
      esac
      last=$cur
    fi
  fi
  # If mpvpaper died, exit so we don't spin forever
  [ -S "$SOCKET" ] || exit 0
  sleep "$INTERVAL"
done
