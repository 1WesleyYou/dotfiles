return {
  {
    "michaelb/sniprun",
    display = "Terminal",
    vim.api.nvim_set_keymap("n", "<leader>rs", ":'<,'>SnipRun <CR>", { noremap = true, silent = true }),
  },
}
