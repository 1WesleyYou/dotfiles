# dotfiles

> [简体中文](./README_CN.md)

Personal dotfiles for **Arch Linux (Hyprland)** and **macOS** environments.
<!-- test commit -->

## Structure

```
dotfiles/
├── MacOS/                  # macOS configurations
│   ├── nvim/               # Neovim (AstroNvim + Lazy.nvim)
│   ├── kitty/              # Kitty terminal
│   ├── ghostty/            # Ghostty terminal
│   ├── wezterm/            # WezTerm terminal
│   ├── claude/             # Claude Code (settings, agents, rules, commands, hooks)
│   ├── sketchybar/         # macOS status bar
│   ├── skhd/               # macOS hotkey daemon
│   ├── yabai/              # macOS tiling window manager
│   ├── yazi/               # Yazi file manager
│   ├── btop/               # Btop system monitor
│   ├── neofetch/           # Neofetch system info
│   ├── starship/           # Starship prompt
│   ├── .zshrc              # Zsh configuration
│   ├── .tmux.conf          # Tmux configuration
│   └── .ideavimrc          # IdeaVim (JetBrains)
│
├── hypr/                   # Hyprland (Arch Linux)
├── waybar/                 # Waybar status bar (Arch Linux)
├── dunst/                  # Dunst notifications (Arch Linux)
├── rofi/                   # Rofi launcher (Arch Linux)
├── fcitx5/                 # Fcitx5 input method (Arch Linux)
│
├── nvim/                   # Neovim config (Arch Linux version)
├── kitty/                  # Kitty config (Arch Linux version)
├── btop/                   # Btop config (Arch Linux version)
├── yazi/                   # Yazi config (Arch Linux version)
├── neofetch/               # Neofetch config (Arch Linux version)
├── sketchybar/             # Sketchybar (shared)
├── skhd/                   # Skhd (shared)
├── yabai/                  # Yabai (shared)
├── wezterm/                # WezTerm (shared)
├── .zshrc                  # Zsh config (Arch Linux version)
├── .tmux.conf              # Tmux config (Arch Linux version)
├── .ideavimrc              # IdeaVim (shared)
└── update.sh               # Legacy sync script
```

## macOS Setup

### Window Management

- **[yabai](https://github.com/koekeishiya/yabai)** — Tiling window manager
- **[skhd](https://github.com/koekeishiya/skhd)** — Hotkey daemon (keybindings for yabai)
- **[sketchybar](https://github.com/FelixKratz/SketchyBar)** — Custom status bar

### Terminal

- **[Kitty](https://sw.kovidgoyal.net/kitty/)** — GPU-accelerated terminal
- **[Ghostty](https://ghostty.org/)** — Native macOS terminal
- **[WezTerm](https://wezfurlong.org/wezterm/)** — Cross-platform terminal

### Shell & Prompt

- **Zsh** with custom `.zshrc`
- **[Starship](https://starship.rs/)** — Cross-shell prompt
- **[Tmux](https://github.com/tmux/tmux)** — Terminal multiplexer (with TPM)

### Editor

- **[Neovim](https://neovim.io/)** — AstroNvim-based config with Lazy.nvim, Catppuccin theme
- **[IdeaVim](https://github.com/JetBrains/ideavimrc)** — Vim emulation for JetBrains IDEs

### Tools

- **[Yazi](https://github.com/sxyazi/yazi)** — Terminal file manager (Catppuccin theme)
- **[Btop](https://github.com/aristocratos/btop)** — System monitor (Catppuccin theme)
- **[Neofetch](https://github.com/dylanaraps/neofetch)** — System info display
- **[Claude Code](https://claude.ai/code)** — AI coding assistant config

### Theme

**Catppuccin Mocha** across the board — Neovim, Kitty, Ghostty, Btop, Yazi, Sketchybar.

## Arch Linux Setup

### Desktop

- **[Hyprland](https://hyprland.org/)** — Wayland compositor with animations
- **[Waybar](https://github.com/Alexays/Waybar)** — Status bar for Wayland
- **[Rofi](https://github.com/davatorium/rofi)** — Application launcher
- **[Dunst](https://dunst-project.org/)** — Notification daemon
- **[Fcitx5](https://fcitx-im.org/)** — Input method framework (Chinese input)

### Shared with macOS

Neovim, Kitty, Zsh, Tmux, Yazi, Btop, Neofetch, IdeaVim.

## Installation

### macOS

```bash
# Clone
git clone https://github.com/wesleyyou/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Symlink configs (adjust paths as needed)
ln -sf ~/dotfiles/MacOS/nvim ~/.config/nvim
ln -sf ~/dotfiles/MacOS/kitty ~/.config/kitty
ln -sf ~/dotfiles/MacOS/ghostty ~/.config/ghostty
ln -sf ~/dotfiles/MacOS/wezterm ~/.config/wezterm
ln -sf ~/dotfiles/MacOS/yazi ~/.config/yazi
ln -sf ~/dotfiles/MacOS/btop ~/.config/btop
ln -sf ~/dotfiles/MacOS/neofetch ~/.config/neofetch
ln -sf ~/dotfiles/MacOS/sketchybar ~/.config/sketchybar
ln -sf ~/dotfiles/MacOS/skhd ~/.config/skhd
ln -sf ~/dotfiles/MacOS/yabai ~/.config/yabai
ln -sf ~/dotfiles/MacOS/starship/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/MacOS/.zshrc ~/.zshrc
ln -sf ~/dotfiles/MacOS/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/MacOS/.ideavimrc ~/.ideavimrc
```

### Arch Linux

```bash
git clone https://github.com/wesleyyou/dotfiles.git ~/dotfiles
cd ~/dotfiles

ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/kitty ~/.config/kitty
ln -sf ~/dotfiles/hypr ~/.config/hypr
ln -sf ~/dotfiles/waybar ~/.config/waybar
ln -sf ~/dotfiles/dunst ~/.config/dunst
ln -sf ~/dotfiles/rofi ~/.config/rofi
ln -sf ~/dotfiles/yazi ~/.config/yazi
ln -sf ~/dotfiles/btop ~/.config/btop
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.ideavimrc ~/.ideavimrc
```

## License

MIT
