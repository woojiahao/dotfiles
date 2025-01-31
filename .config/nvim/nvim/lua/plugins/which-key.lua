return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>v",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "venv (py)",
    },
  },
}
