return { -- Rainbow pair colorization
  "hiphish/rainbow-delimiters.nvim",
  lazy = false,
  config = function()
    vim.g.rainbow_delimiters = {
      blacklist = { "notify", "noice", "snacks_notif", "TelescopePrompt", "lazy", "mason" },
    }
    require "highlight"
  end,
}
