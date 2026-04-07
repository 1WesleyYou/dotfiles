# dotfiles

> [English](./README.md)

个人配置文件，适用于 **Arch Linux (Hyprland)** 和 **macOS** 环境。

## 目录结构

```
dotfiles/
├── MacOS/                  # macOS 配置
│   ├── nvim/               # Neovim (AstroNvim + Lazy.nvim)
│   ├── kitty/              # Kitty 终端
│   ├── ghostty/            # Ghostty 终端
│   ├── wezterm/            # WezTerm 终端
│   ├── claude/             # Claude Code（设置、代理、规则、命令、钩子）
│   ├── sketchybar/         # macOS 状态栏
│   ├── skhd/               # macOS 快捷键守护进程
│   ├── yabai/              # macOS 平铺窗口管理器
│   ├── yazi/               # Yazi 文件管理器
│   ├── btop/               # Btop 系统监控
│   ├── neofetch/           # Neofetch 系统信息
│   ├── starship/           # Starship 提示符
│   ├── .zshrc              # Zsh 配置
│   ├── .tmux.conf          # Tmux 配置
│   └── .ideavimrc          # IdeaVim（JetBrains）
│
├── hypr/                   # Hyprland（Arch Linux）
├── waybar/                 # Waybar 状态栏（Arch Linux）
├── dunst/                  # Dunst 通知（Arch Linux）
├── rofi/                   # Rofi 启动器（Arch Linux）
├── fcitx5/                 # Fcitx5 输入法（Arch Linux）
│
├── nvim/                   # Neovim 配置（Arch Linux 版本）
├── kitty/                  # Kitty 配置（Arch Linux 版本）
├── btop/                   # Btop 配置（Arch Linux 版本）
├── yazi/                   # Yazi 配置（Arch Linux 版本）
├── neofetch/               # Neofetch 配置（Arch Linux 版本）
├── sketchybar/             # Sketchybar（共享）
├── skhd/                   # Skhd（共享）
├── yabai/                  # Yabai（共享）
├── wezterm/                # WezTerm（共享）
├── .zshrc                  # Zsh 配置（Arch Linux 版本）
├── .tmux.conf              # Tmux 配置（Arch Linux 版本）
├── .ideavimrc              # IdeaVim（共享）
└── update.sh               # 旧版同步脚本
```

## macOS 环境

### 窗口管理

- **[yabai](https://github.com/koekeishiya/yabai)** — 平铺窗口管理器
- **[skhd](https://github.com/koekeishiya/skhd)** — 快捷键守护进程（yabai 键位绑定）
- **[sketchybar](https://github.com/FelixKratz/SketchyBar)** — 自定义状态栏

### 终端

- **[Kitty](https://sw.kovidgoyal.net/kitty/)** — GPU 加速终端
- **[Ghostty](https://ghostty.org/)** — 原生 macOS 终端
- **[WezTerm](https://wezfurlong.org/wezterm/)** — 跨平台终端

### Shell 与提示符

- **Zsh** 自定义 `.zshrc`
- **[Starship](https://starship.rs/)** — 跨 Shell 提示符
- **[Tmux](https://github.com/tmux/tmux)** — 终端复用器（含 TPM）

### 编辑器

- **[Neovim](https://neovim.io/)** — 基于 AstroNvim 的配置，使用 Lazy.nvim，Catppuccin 主题
- **[IdeaVim](https://github.com/JetBrains/ideavimrc)** — JetBrains IDE 的 Vim 模拟

### 工具

- **[Yazi](https://github.com/sxyazi/yazi)** — 终端文件管理器（Catppuccin 主题）
- **[Btop](https://github.com/aristocratos/btop)** — 系统监控（Catppuccin 主题）
- **[Neofetch](https://github.com/dylanaraps/neofetch)** — 系统信息展示
- **[Claude Code](https://claude.ai/code)** — AI 编程助手配置

### 主题

全局使用 **Catppuccin Mocha** — Neovim、Kitty、Ghostty、Btop、Yazi、Sketchybar。

## Arch Linux 环境

### 桌面

- **[Hyprland](https://hyprland.org/)** — Wayland 合成器，支持动画
- **[Waybar](https://github.com/Alexays/Waybar)** — Wayland 状态栏
- **[Rofi](https://github.com/davatorium/rofi)** — 应用启动器
- **[Dunst](https://dunst-project.org/)** — 通知守护进程
- **[Fcitx5](https://fcitx-im.org/)** — 输入法框架（中文输入）

### 与 macOS 共享

Neovim、Kitty、Zsh、Tmux、Yazi、Btop、Neofetch、IdeaVim。

## 安装

### macOS

```bash
# 克隆
git clone https://github.com/wesleyyou/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 创建符号链接（按需调整路径）
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

## 许可证

MIT
