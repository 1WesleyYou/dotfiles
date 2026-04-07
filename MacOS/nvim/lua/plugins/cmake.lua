return {
  "Civitasv/cmake-tools.nvim",
  config = function()
    local osys = require "cmake-tools.osys"
    require("cmake-tools").setup {
      cmake_command = "cmake", -- 指定 cmake 命令路径
      ctest_command = "ctest", -- 指定 ctest 命令路径
      cmake_use_preset = true, -- 使用 CMake Presets
      cmake_regenerate_on_save = true, -- 保存 CMakeLists.txt 时自动生成
      cmake_generate_options = {
        "-DCMAKE_EXPORT_COMPILE_COMMANDS=1",
      },
      cmake_build_options = {},
      cmake_build_directory = function()
        if osys.iswin32 then return "build\\${variant:buildType}" end
        return "build/${variant:buildType}"
      end,
      cmake_soft_link_compile_commands = true,
      cmake_compile_commands_from_lsp = false,
      cmake_kits_path = nil,
      cmake_variants_message = {
        short = { show = true },
        long = { show = true, max_length = 40 },
      },
      cmake_dap_configuration = {
        name = "cpp",
        type = "codelldb",
        request = "launch",
        stopOnEntry = false, -- 开局先停止一次
        runInTerminal = true,
        console = "integratedTerminal",
      },
      cmake_executor = {
        name = "quickfix", -- 可以根据需要修改 executor 名称，如 "overseer"、"toggleterm" 或 "terminal"
        opts = {},
        default_opts = {
          quickfix = {
            show = "always",
            position = "belowright",
            size = 10,
            encoding = "utf-8",
            auto_close_when_success = true,
          },
          toggleterm = {
            direction = "float",
            close_on_exit = false,
            auto_scroll = true,
            singleton = true,
          },
          overseer = {
            new_task_opts = {
              strategy = {
                "toggleterm",
                direction = "horizontal",
                auto_scroll = true,
                quit_on_exit = "success",
              },
            },
            on_new_task = function(task) require("overseer").open { enter = false, direction = "right" } end,
          },
          terminal = {
            name = "Main Terminal",
            prefix_name = "[CMakeTools]: ",
            split_direction = "horizontal",
            split_size = 11,
            single_terminal_per_instance = true,
            single_terminal_per_tab = true,
            keep_terminal_static_location = true,
            auto_resize = true,
            start_insert = false,
            focus = false,
            do_not_add_newline = false,
          },
        },
      },
      cmake_runner = {
        name = "terminal", -- 同上，根据需要选择 runner 类型
        opts = {},
        default_opts = {
          quickfix = {
            show = "always",
            position = "belowright",
            size = 10,
            encoding = "utf-8",
            auto_close_when_success = true,
          },
          toggleterm = {
            direction = "float",
            close_on_exit = false,
            auto_scroll = true,
            singleton = true,
          },
          overseer = {
            new_task_opts = {
              strategy = {
                "toggleterm",
                direction = "horizontal",
                auto_scroll = true,
                quit_on_exit = "success",
              },
            },
            on_new_task = function(task)
              -- 这里可以添加额外的任务处理逻辑
            end,
          },
          terminal = {
            name = "Main Terminal",
            prefix_name = "[CMakeTools]: ",
            split_direction = "horizontal",
            split_size = 11,
            single_terminal_per_instance = true,
            single_terminal_per_tab = true,
            keep_terminal_static_location = true,
            auto_resize = true,
            start_insert = false,
            focus = false,
            do_not_add_newline = false,
          },
        },
      },
      cmake_notifications = {
        runner = { enabled = true },
        executor = { enabled = true },
        spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
        refresh_rate_ms = 100,
      },
      cmake_virtual_text_support = true,
    }
    vim.api.nvim_set_keymap("n", "<leader>mg", ":CMakeGenerate<CR>", { noremap = true, silent = false })
    vim.api.nvim_set_keymap("n", "<leader>mb", ":CMakeBuild<CR>", { noremap = true, silent = false })
    vim.api.nvim_set_keymap("n", "<leader>mr", ":CMakeRun<CR>", { noremap = true, silent = false })
  end,
}
