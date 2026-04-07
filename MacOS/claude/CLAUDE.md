# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Directory Is

This is the `~/.claude` configuration directory for Claude Code. It is **not** a software project — it contains Claude Code's settings, hooks, agents, plugins, and the GSD (Get Shit Done) workflow system (v1.28.0).

## Directory Structure

- `settings.json` — Global Claude Code settings: permissions, model config, hooks, status line
- `agents/` — Subagent definitions (all GSD-related: executor, planner, verifier, etc.)
- `commands/gsd/` — Slash command entry point for GSD
- `get-shit-done/` — GSD plugin: commands, workflows, templates, references
- `hooks/` — JS hooks for session start, pre/post tool use (GSD context monitor, prompt guard, update checker, status line)
- `plugins/` — Plugin management (blocklist, config, marketplace registry)
- `projects/` — Per-project settings and memory (keyed by filesystem path with dashes)
- `sessions/` — Session data
- `todos/` — Persistent todo items

## GSD Workflow System

GSD is the primary workflow plugin installed. It provides structured project management via `/gsd:*` slash commands. Key workflows:

- **Project lifecycle**: `/gsd:new-project` → `/gsd:new-milestone` → `/gsd:plan-phase` → `/gsd:execute-phase` → `/gsd:verify-work`
- **Quick tasks**: `/gsd:fast` (inline, no agents) or `/gsd:quick` (atomic commits, skip optional agents)
- **Navigation**: `/gsd:progress` (status), `/gsd:next` (auto-advance), `/gsd:resume-work` (context restore)

GSD uses `.planning/` directories within target project repos (not in this config dir).

## Hooks Architecture

All hooks are Node.js scripts in `hooks/`. They are registered in `settings.json` under the `hooks` key:

- `gsd-check-update.js` — Runs on SessionStart to check for GSD updates
- `gsd-context-monitor.js` — PostToolUse hook on Bash/Edit/Write/Agent/Task tools
- `gsd-prompt-guard.js` — PreToolUse hook on Write/Edit operations
- `gsd-statusline.js` — Powers the status line display

## Editing Guidelines

- Changes to `settings.json` affect all Claude Code sessions globally
- Agent definitions in `agents/` use markdown frontmatter format with tool restrictions
- GSD plugin files under `get-shit-done/` are managed by the GSD update system — local edits may be overwritten by `/gsd:update`
- Per-project CLAUDE.md files live in `projects/<path-key>/CLAUDE.md`, not here
