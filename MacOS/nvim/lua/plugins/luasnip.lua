return {
  "L3MON4D3/LuaSnip",
  dependencies = { "rafamadriz/friendly-snippets" },
  config = function(plugin, opts)
    -- include the default astronvim config that calls the setup call
    require "astronvim.plugins.configs.luasnip"(plugin, opts)
    -- load snippets paths
    require("luasnip.loaders.from_lua").load {
      paths = { vim.fn.stdpath "config" .. "/snippets" },
    }
    -- make cpp snippets available in c and h files
    require("luasnip").filetype_extend("c", { "cpp" })
  end,
}
