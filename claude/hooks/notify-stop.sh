#!/usr/bin/env bash
ICON="/home/whoami/.local/share/icons/claude-code.png"

INPUT=$(cat)

SUMMARY=$(python3 - "$INPUT" <<'PY'
import json, sys, re

try:
    payload = json.loads(sys.argv[1])
    path = payload.get("transcript_path")
    if not path:
        print("任务完成")
        sys.exit(0)

    last_text = ""
    with open(path, "r", encoding="utf-8") as f:
        for line in f:
            try:
                entry = json.loads(line)
            except json.JSONDecodeError:
                continue
            if entry.get("type") != "assistant":
                continue
            msg = entry.get("message", {})
            content = msg.get("content", [])
            if isinstance(content, str):
                last_text = content
                continue
            chunks = []
            for c in content:
                if isinstance(c, dict) and c.get("type") == "text":
                    chunks.append(c.get("text", ""))
            joined = "\n".join(chunks).strip()
            if joined:
                last_text = joined

    if not last_text:
        print("任务完成")
        sys.exit(0)

    # 取第一段非空文字，去掉 markdown 标记
    first_line = ""
    for ln in last_text.splitlines():
        ln = ln.strip()
        if ln:
            first_line = ln
            break

    first_line = re.sub(r"^#+\s*", "", first_line)         # 去掉 # 标题
    first_line = re.sub(r"^[*_>\-]+\s*", "", first_line)   # 去掉列表/引用
    first_line = re.sub(r"[*_`]", "", first_line)           # 去掉强调标记

    if len(first_line) > 120:
        first_line = first_line[:117] + "…"

    print(first_line or "任务完成")
except Exception as e:
    print("任务完成")
PY
)

# 转义引号防止 notify-send 出问题
SUMMARY=${SUMMARY//\"/\\\"}

notify-send -a 'Claude Code' -i "$ICON" 'Claude Code ✅' "$SUMMARY"
