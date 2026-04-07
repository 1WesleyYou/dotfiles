if true then return {} end
-- 把这里改成你自己的图片路径，支持 png/jpg/webp 等
local image_path = vim.fn.expand "~/.config/nvim/assets/dashboard.jpeg"
local has_image = vim.fn.filereadable(image_path) == 1

-- 图片下方 / ASCII art 下方的文字
local subtitle = {
  "",
  "  Yuchen You  ·  Shanghai Jiao Tong University  ",
  "",
}

-- 没有图片时用的 ASCII art
local ascii_header = {
  "",
  "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ",
  "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ",
  "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ",
  "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ",
  "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ",
  "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ",
}

-- 有图片时用空行占位（行数 = 图片渲染高度，根据效果调整）
local image_placeholder = {}
for _ = 1, 20 do
  table.insert(image_placeholder, "")
end

local header = {}
if has_image then
  for _, line in ipairs(image_placeholder) do table.insert(header, line) end
else
  for _, line in ipairs(ascii_header) do table.insert(header, line) end
end
for _, line in ipairs(subtitle) do table.insert(header, line) end

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons", "3rd/image.nvim" },
  config = function()
    require("dashboard").setup {
      theme = "doom",
      config = {
        header = header,
        center = {
          { icon = "  ", desc = "New File",     key = "n", action = "enew" },
          { icon = "  ", desc = "Find File",    key = "f", action = "Telescope find_files" },
          { icon = "  ", desc = "Recent Files", key = "r", action = "Telescope oldfiles" },
          { icon = "  ", desc = "Find Word",    key = "g", action = "Telescope live_grep" },
          { icon = "  ", desc = "Quit",         key = "q", action = "qa" },
        },
        footer = function()
          local stats = require("lazy").stats()
          return { "⚡ " .. stats.loaded .. "/" .. stats.count .. " plugins loaded" }
        end,
      },
    }

    -- 有图片时，dashboard 打开后渲染图片
    if has_image then
      local _img = nil
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "dashboard",
        callback = function()
          local buf = vim.api.nvim_get_current_buf()
          local win = vim.api.nvim_get_current_win()
          vim.defer_fn(function()
            local ok, image = pcall(require, "image")
            if not ok then return end
            -- 清除上一次渲染，防止重复
            if _img then
              _img:clear()
              _img = nil
            end
            local img_width = 40
            local img_height = 20
            local win_width = vim.api.nvim_win_get_width(win)
            local x = math.floor((win_width - img_width) / 2)
            local img = image.from_file(image_path, {
              buffer = buf,
              window = win,
              x = x,
              y = 0,
              width = img_width,
              height = img_height,
              with_virtual_padding = false,
            })
            if img then
              img:render()
              _img = img
              vim.cmd("redraw")
            end
          end, 50)
        end,
      })
    end
  end,
}
