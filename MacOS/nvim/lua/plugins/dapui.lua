return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  event = "VeryLazy", -- 延迟加载（可按需调整）
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"

    -- DAP UI 布局设置
    dapui.setup {
      layouts = {
        {
          position = "left",
          size = 0.4,
          elements = {
            { id = "stacks", size = 0.2 },
            { id = "scopes", size = 0.5 },
            { id = "breakpoints", size = 0.15 },
            { id = "watches", size = 0.15 },
          },
        },
        {
          position = "bottom",
          size = 0.2,
          elements = {
            { id = "repl", size = 0.3 },
            { id = "console", size = 0.7 },
          },
        },
      },
    }

    -- 自动打开 / 关闭 UI
    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    -- 自定义断点图标
    vim.fn.sign_define(
      "DapBreakpoint",
      { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
    )
    vim.fn.sign_define(
      "DapBreakpointCondition",
      { text = "", texthl = "DapBreakpointCondition", linehl = "", numhl = "DapBreakpointCondition" }
    )
    vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "DapStopped" })

    -- 快捷键映射
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<leader>du", dapui.toggle, { desc = "DAP: Toggle UI" })
    map("n", "<leader>ds", dap.continue, { desc = " Start/Continue" })
    map("n", "<F1>", dap.continue, { desc = " Start/Continue" })
    map("n", "<leader>di", dap.step_into, { desc = " Step into" })
    map("n", "<F2>", dap.step_into, { desc = " Step into" })
    map("n", "<leader>do", dap.step_over, { desc = " Step over" })
    map("n", "<F3>", dap.step_over, { desc = " Step over" })
    map("n", "<leader>dO", dap.step_out, { desc = " Step out" })
    map("n", "<F4>", dap.step_out, { desc = " Step out" })
    map("n", "<leader>dq", dap.close, { desc = "DAP: Close session" })
    map("n", "<leader>dQ", dap.terminate, { desc = " Terminate session" })
    map("n", "<leader>dr", dap.restart_frame, { desc = "DAP: Restart" })
    map("n", "<F5>", dap.restart_frame, { desc = "DAP: Restart" })
    map("n", "<leader>dc", dap.run_to_cursor, { desc = "DAP: Run to Cursor" })
    map("n", "<leader>dR", dap.repl.toggle, { desc = "DAP: Toggle REPL" })
    map("n", "<leader>dh", require("dap.ui.widgets").hover, { desc = "DAP: Hover" })
    map("n", "<leader>db", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
    map(
      "n",
      "<leader>dB",
      function() dap.set_breakpoint(vim.fn.input "Condition for breakpoint: ") end,
      { desc = "DAP: Conditional Breakpoint" }
    )
    map("n", "<leader>dD", dap.clear_breakpoints, { desc = "DAP: Clear Breakpoints" })
  end,
}
