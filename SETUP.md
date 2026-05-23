# GA403WP Hyprland 环境配置笔记

> 记录这台 ASUS ROG Flow Z13 (GA403WP) + Arch Linux + Hyprland 的关键配置和软件清单。
> 重装时按这份文档过一遍即可恢复到现在的状态。

## 系统软件清单

### 已通过 pacman / AUR 安装的核心包

| 包 | 来源 | 说明 |
|---|---|---|
| `hyprland` | extra | Wayland 窗口管理器 |
| `hyprpanel` | AUR | 顶部状态栏（替代 waybar） |
| `nwg-dock-hyprland` | AUR | macOS 风格 dock |
| `rofi-wayland` | extra | 应用启动器 |
| `kitty` | extra | 终端 |
| `dolphin` | extra | 文件管理器 |
| `fcitx5` | extra | 中文输入法 |
| `hypridle` / `hyprlock` / `hyprshot` | extra | 锁屏 / 自动锁 / 截图 |
| `hyprsunset` | extra | 蓝光过滤 |
| `mpvpaper` | AUR | 视频壁纸 |
| `cliphist` + `wl-clipboard` | extra | 剪贴板历史 |
| `asusctl` | **AUR**（≥ 6.3.7） | ROG 笔记本控制 daemon + CLI |
| `supergfxctl` | extra | 混合显卡切换 |
| `rog-control-center` | AUR | asusctl 的图形界面 |
| `tailscale` | extra | VPN（已 enable + 等管理员审批） |
| `notification (libnotify)` | extra | `notify-send` 桌面通知 |

### 安装命令（重装时一键过）

```bash
# 官方仓库
sudo pacman -S hyprland kitty dolphin rofi-wayland fcitx5 fcitx5-chinese-addons \
  hypridle hyprlock hyprshot hyprsunset cliphist wl-clipboard \
  libnotify supergfxctl tailscale

# AUR（先装 yay 或 paru）
yay -S hyprpanel nwg-dock-hyprland mpvpaper asusctl rog-control-center

# 注意：官方仓库的 asusctl 6.1.x 会和 AUR 的 rog-control-center 冲突。
# 必须同时升 asusctl 到 AUR 版（yay 会自动重建两个包，记得一起装）：
yay -S rog-control-center asusctl
# 如果包冲突，把缓存里两个包一起 -U：
# sudo pacman -U ~/.cache/yay/asusctl/*.pkg.tar.zst
```

---

## 系统级配置（需要 sudo / 重登）

### 1. 加入必要的用户组

asusd 的 D-Bus 策略只允许 `adm` / `sudo` / `users` / `wheel` 组访问。Arch 默认不会把用户加进 `users`/`wheel`。

```bash
sudo usermod -aG wheel,users $USER
# 必须登出 Hyprland 重新登录才生效
```

### 2. 启用 daemon

```bash
sudo systemctl enable --now asusd supergfxd tailscaled
```

> 注意：`asus-shutdown.service` 是 oneshot，跑一次后会卡在 "start running"，是设计如此（关机时才退出）。重启时 `systemctl restart` 会显得卡住，加 `--no-block`：
> ```bash
> sudo systemctl restart --no-block asusd supergfxd
> ```

### 3. Tailscale 首次接入

```bash
sudo tailscale up
# 浏览器登录后到 admin 控制台审批本机
```

---

## 这次会话新增的配置点

### Hyprland (`hypr/hyprland.conf`)

新增 exec-once 启动 rog-control-center 到托盘：
```conf
exec-once = rog-control-center --start-in-tray
```

### Hyprpanel (`hyprpanel/config.json`)

通知缩放放大 + 已有的 systray 模块支持托盘图标：
```json
"notifications.scaling": 160,
"bar.menus.menu.notifications.scaling": 150
```

### Claude Code 通知 (`claude/`)

- `settings.json` — 注册 `Stop` / `Notification` 两个 hook
- `hooks/notify-stop.sh` — 读取 transcript 提取最后一句作为通知正文
- `assets/claude-code.png` / `.svg` — 通知 logo

部署方法：
```bash
mkdir -p ~/.claude/hooks ~/.local/share/icons
cp claude/settings.json        ~/.claude/settings.json
cp claude/hooks/notify-stop.sh ~/.claude/hooks/notify-stop.sh
chmod +x ~/.claude/hooks/notify-stop.sh
cp claude/assets/claude-code.* ~/.local/share/icons/
```

### `.zshrc` 微调

删除了多余的 `alias asusctl='sudo asusctl'`（新版 asusctl 通过 D-Bus + polkit 工作，不需要 sudo 包装）。

---

## 重装顺序建议

1. 装系统 + 基础包（pacman 那条）
2. 装 AUR 包（asusctl + rog-control-center 一起装）
3. `sudo usermod -aG wheel,users $USER` 然后**重新登录**
4. `sudo systemctl enable --now asusd supergfxd`
5. 把 dotfiles 软链到 `~/.config/`：
   ```bash
   ln -sf ~/dotfiles/hypr        ~/.config/hypr
   ln -sf ~/dotfiles/hyprpanel   ~/.config/hyprpanel
   ln -sf ~/dotfiles/kitty       ~/.config/kitty
   ln -sf ~/dotfiles/rofi        ~/.config/rofi
   # ... 其他按需
   ```
6. 部署 Claude Code 配置（见上一节）
7. 进 Hyprland，验证 rog-control-center 托盘 + Claude Code 通知

---

## 常见问题速查

| 问题 | 排查 |
|---|---|
| `rog-control-center` 启动崩溃 `Zbus(NotFound)` | 没加入 `wheel`/`users` 组，或忘了重登 |
| `asusctl` 报 `AccessDenied` | 同上 |
| 通知 logo 糊 | SVG 用了 `width="1em"`，要改成像素尺寸或导出 PNG |
| hyprpanel 蓝牙脚本进程泄漏 | `pkill -f 'hyprpanel/scripts/bluetooth.py'` 然后重启 hyprpanel |
| systemctl restart asusd 卡住 | `sudo systemctl cancel`，下次用 `--no-block` |
