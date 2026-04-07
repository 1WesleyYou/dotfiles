return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" }, -- 确保 plenary 已声明（Telescope 的依赖）
  config = function()
    require("telescope").setup {
      defaults = {
        -- 配置内容搜索（live_grep/grep_string）使用 ripgrep
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",   -- 智能大小写
          "--hidden",       -- 包含隐藏文件
          "--no-ignore",    -- 忽略 .gitignore
          "--glob=!.git/*", -- 排除 .git 目录
          "--follow"        -- 跟踪符号链接
        }
      },
      pickers = {
        -- 文件搜索配置（已存在的 find_files 配置）
        find_files = {
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--no-ignore",
            "--follow",
            "--glob=!.git/*"
          },
        },
        -- 可选：为 live_grep 添加额外配置（若需要覆盖 defaults）
        live_grep = {
          additional_args = function(_)
            return { "--hidden", "--no-ignore" } -- 可添加额外参数
          end
        }
      },
    }

    -- 配置快捷键 <space>fr 调用 lsp_references
    vim.keymap.set('n', '<space>fr', function()
      require('telescope.builtin').lsp_references()
    end, { noremap = true, silent = true })
  end,
}
