return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "codelldb",
      },
    },
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
      ensure_installed = {
        "codelldb",
      },
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function() end,
    keys = {
      { "<leader>db", "<cmd> DapToggleBreakpoint <CR>", desc = "Add breakpoint at line" },
      { "<leader>dc", "<cmd> DapContinue <CR>", desc = "Start or continue the debugger" },
      { "<leader>dr", "<cmd> DapToggleRepl <CR>", desc = "Toggle the REPL" },
      { "<leader>di", "<cmd> DapStepInto <CR>", desc = "Step into" },
      { "<leader>d0", "<cmd> DapStepOver <CR>", desc = "Step over" },
      { "<leader>do", "<cmd> DapStepOut <CR>", desc = "Step out" },
    },
  },
}
