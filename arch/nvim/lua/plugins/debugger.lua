-- 仅当系统提供 lldb-dap (或 lldb) 时再注册 lldb 适配器,避免 healthcheck 报错。
-- 现代 nvim-dap 应该使用 lldb-dap 二进制 (lldb 本身不再支持 DAP 协议)。
local ok, dap = pcall(require, "dap")
if not ok then return {} end

local lldb_cmd
if vim.fn.executable "lldb-dap" == 1 then
  lldb_cmd = vim.fn.exepath "lldb-dap"
elseif vim.fn.executable "/usr/bin/lldb-dap" == 1 then
  lldb_cmd = "/usr/bin/lldb-dap"
end

if lldb_cmd then
  dap.adapters.lldb = {
    type = "executable",
    command = lldb_cmd,
    name = "lldb",
  }

  dap.configurations.cpp = dap.configurations.cpp or {}
  table.insert(dap.configurations.cpp, {
    name = "Launch (lldb-dap)",
    type = "lldb",
    request = "launch",
    program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file") end,
    cwd = "${workspaceFolder}",
    stopOnEntry = true,
    args = {},
  })
end

return {}
