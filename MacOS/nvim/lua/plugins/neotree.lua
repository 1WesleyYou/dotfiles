return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    vim.api.nvim_set_keymap("n", "<leader>rr", ":cd %:p:h <CR> Neotree dir=./<CR>", { noremap = true, silent = true }),
    vim.api.nvim_set_keymap("n", "<leader>rk", ":Neotree dir=../ <CR>", { noremap = true, silent = true }),
    vim.api.nvim_set_keymap("n", "<leader>rb", ":Neotree buffersb<CR>", { noremap = true, silent = true }),
  },
}
