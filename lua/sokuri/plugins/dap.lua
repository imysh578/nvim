return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui", -- DAP UI for better visualization
      "nvim-neotest/nvim-nio", -- Dependency required for dap-ui
      -- "simrat39/rust-tools.nvim", -- Rust tools integration
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Setup dap-ui
      dapui.setup()

      -- Configure Rust DAP adapter using CodeLLDB
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          -- Adjust this path to your codelldb extension location
          command = "/Users/seokhunyoon/codelldb/adapter/codelldb",
          args = { "--port", "${port}" },
          -- For Windows, you may need to uncomment the following line
          -- detached = false,
        },
      }

      dap.configurations.rust = {
        {
          name = "Launch",
          type = "codelldb",
          request = "launch",
          -- program = function()
          --   return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          -- end,
          program = function()
            local path = vim.fn.input({
              prompt = "Path to executable: ",
              default = vim.fn.getcwd() .. "/target/aarch64-apple-darwin/debug/",
              completion = "file",
            })
            return (path and path ~= "") and path or dap.ABORT
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
          runInTerminal = false, -- Change to true if needed
        },
      }

      -- -- Open dap-ui when debugging session starts
      -- dap.listeners.after.event_initialized["dapui_config"] = function()
      --   dapui.open()
      -- end
      --
      -- -- Close dap-ui when debugging session ends
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
      --   dapui.close()
      -- end
      --
      -- dap.listeners.before.event_exited["dapui_config"] = function()
      --   dapui.close()
      -- end

      -- Keybindings for DAP actions
      vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
      vim.keymap.set("n", "<leader>dx", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Terminate debugging" })
      vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Step over" })
      vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Step into" })
      vim.keymap.set("n", "<leader>du", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Step out" })
      vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", { desc = "Start/Continue debugging" })
      vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", { desc = "Toggle REPL" })
      vim.keymap.set("n", "<leader>dus", function()
        local widgets = require("dap.ui.widgets")
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end, { desc = "Open DAP sidebar" })
    end,
  },
}
