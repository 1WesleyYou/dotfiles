#!/usr/bin/env bash
# Toggle hyprpanel bar on whichever monitor is currently focused.
# Uses the active monitor's ID so it works with any monitor layout.

set -euo pipefail
MON_ID=$(hyprctl activeworkspace -j | python3 -c "import json,sys; print(json.load(sys.stdin)['monitorID'])")
exec hyprpanel toggleWindow "bar-${MON_ID}"
