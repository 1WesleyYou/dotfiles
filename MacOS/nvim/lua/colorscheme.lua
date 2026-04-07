vim.g.catppuccin_flavour = "mocha" -- 选择你喜欢的 Catppuccin 配色，如 "latte", "frappe", "macchiato", 或 "mocha"
require("catppuccin").setup()

-- 设置 Catppuccin 为默认主题
vim.cmd [[colorscheme catppuccin]]
