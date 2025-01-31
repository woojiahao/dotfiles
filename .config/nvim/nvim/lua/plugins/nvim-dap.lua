return {
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
}
