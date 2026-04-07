# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration built on top of **AstroNvim v4+** as the base framework, using **Lazy.nvim** as the plugin manager. The config targets C++, Python, LaTeX, and Lua development.

## Architecture

### Entry Point & Load Order

`init.lua` bootstraps Lazy.nvim, sets a `VimEnter` autocmd (cd to current file's dir), then requires:
1. `lazy_setup` — configures Lazy.nvim with AstroNvim core + community + custom plugin specs
2. `polish` — post-setup customizations
3. `colorscheme` — Catppuccin theme setup
4. `options` — vim options + custom utility functions

### Plugin Organization

- `lua/lazy_setup.lua` — imports AstroNvim, community packs, and the `lua/plugins/` directory
- `lua/community.lua` — AstroCommunity packs (lua, catppuccin, copilot, cpp, noice, cmdline)
- `lua/plugins/*.lua` — one file per plugin or logical group; each returns a Lazy spec table

AstroNvim provides the foundation for LSP (`astrolsp`), completion, UI (`astroui`), and core mappings (`astrocore`). Custom plugins extend or override these via the `opts`/`specs` pattern.

### Key Plugin Files

- `lua/plugins/astrolsp.lua` — LSP config; format-on-save enabled for cpp/c/h/py/lua/go/java/etc; clangd/pyright/jdtls registered without Mason
- `lua/plugins/clangd.lua` — clangd with UTF-8 encoding + `clangd_extensions.nvim` (inlay hints)
- `lua/plugins/cmake.lua` — cmake-tools with `compile_commands.json` export, C++17/C11 flags, keymaps `<leader>mg/mb/mr`
- `lua/plugins/astrocore.lua` — core Neovim options and global keymaps
- `lua/plugins/debugger.lua` / `nvim-dap.lua` / `dapui.lua` — DAP setup with codelldb (C++) and debugpy (Python)
- `lua/plugins/vimtex.lua` — LaTeX with which-key descriptions
- `lua/plugins/overseer.lua` — task runner; templates in `lua/overseer/`

### Custom Utilities (`lua/options.lua`)

- `ReplaceChinesePunctuation()` — converts Chinese punctuation to ASCII equivalents
- `ReplaceGreekUnicodeWithLaTex()` — converts Greek Unicode characters to LaTeX macros
- `ReplaceUnicodePunctuation()` — converts Unicode math symbols to LaTeX commands
- `ReplaceAll()` — runs all three above; mapped to `<leader>rp`

### Lua Formatting

`.stylua.toml` is present — use `stylua` for Lua formatting (120-char column width, space indentation).

## Adding/Modifying Plugins

Add a new file in `lua/plugins/` returning a Lazy spec. To override an AstroNvim-managed plugin, use the same plugin name and merge via `opts = function(_, opts) ... end`. To disable a plugin, set `enabled = false`.

Guard disabled configs with `if true then return {} end` at the top of the file.

## C++ Development

CMake workflow:
- `<leader>mg` — CMakeGenerate (exports `compile_commands.json` to `build/`)
- `<leader>mb` — CMakeBuild
- `<leader>mr` — CMakeRun

clangd reads `compile_commands.json` from the build directory. The soft-link option in cmake.lua links it to the project root automatically.
