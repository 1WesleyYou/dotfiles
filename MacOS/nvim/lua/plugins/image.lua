-- lua/plugins/image.lua 或直接放在 plugins 配置块中
return {
  {
    "3rd/image.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter", -- 必须的 Markdown/Neorg 解析依赖
    },
    opts = {
      backend = "kitty",
      kitty_method = "unicode-placeholders",
      max_width_window_percentage = 80,
      max_height_window_percentage = 70,
      window_overlap_clear_enabled = true,
      editor_only_render_when_focused = true,
      integrations = {
        markdown = {
          enabled = true,
          download_remote_images = true,
          filetypes = { "markdown", "quarto", "vimwiki" }
        },
        neorg = {
          enabled = true,
          filetypes = { "norg" }
        },
        typst = { enabled = true }
      },
      hijack_file_patterns = {
        "*.png", "*.jpg", "*.jpeg",
        "*.gif", "*.webp", "*.avif"
      }
    },
    config = function(_, opts)
      -- 字体预校验
      vim.g.gui_font_face = "JetBrainsMono Nerd Font"
      vim.o.guifont = vim.g.gui_font_face .. ":h14"

      require("image").setup(opts)

      -- 为 JetBrains Mono 优化的渲染参数
      vim.api.nvim_create_autocmd("User", {
        pattern = "ImageSetupDone",
        callback = function()
          vim.schedule(function()
            require("image.api").set_render_option("font_metrics_scale", 0.92) -- 字体系数校准
          end)
        end
      })
    end
  }
}
