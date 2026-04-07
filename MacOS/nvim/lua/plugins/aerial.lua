return {
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    vim.api.nvim_set_keymap("n", "<leader>rl", ":AerialToggle float<CR>", { noremap = true, silent = true }),
  },
}
