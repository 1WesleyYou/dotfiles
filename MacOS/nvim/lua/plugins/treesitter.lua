-- Customize Treesitter

---@type LazySpec
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "vim",
        "python",
        "c",
        "cpp",
        "javascript",
        "json",
        "html",
        "markdown",
        -- add more arguments for adding more treesitter parsers
      },
      highlight = {
        enable = true,
      },
      textobjects = {
        highlight_definitions = { enable = true },
      },
    },
  },
  { -- Sticky scroll
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },
}
