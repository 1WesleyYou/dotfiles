# arch/

Arch Linux (Hyprland) 专用的本地覆盖配置。

主路径里的 `.tmux.conf` / `kitty/kitty.conf` / `nvim/lua/plugins/*.lua`
保留了跨平台 / macOS 版，这个目录放的是这台 Arch 上做过个性化调整的版本。

## 部署方式

在 Arch 上把这里的文件软链或复制到对应位置即可覆盖：

```bash
ln -sf ~/dotfiles/arch/.tmux.conf       ~/.tmux.conf
ln -sf ~/dotfiles/arch/kitty/kitty.conf ~/.config/kitty/kitty.conf

for f in debugger nvim-dap rainbow_bracket sniprun; do
  ln -sf ~/dotfiles/arch/nvim/lua/plugins/$f.lua \
         ~/.config/nvim/lua/plugins/$f.lua
done
```

> macOS 上跳过这个目录，使用主路径的配置即可。
