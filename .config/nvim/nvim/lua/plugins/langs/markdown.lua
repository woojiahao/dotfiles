vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.md" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.colorcolumn = "80"
  end,
})

return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        markdown = {
          "prettier",
        },
      },
    },
  },
  {
    "jxnblk/vim-mdx-js",
    {
      "instant-markdown/vim-instant-markdown",
      ft = { "markdown", "markdown.mdx", "mdx" },
      build = "yarn install",
      config = function()
        vim.g.instant_markdown_autostart = 0
      end,
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local capabilities = cmp_nvim_lsp.default_capabilities()

        lspconfig["mdx_analyzer"].setup({
          filetypes = { "markdown.mdx", "mdx" },
          capabilities = capabilities,
        })
      end,
    },
  },
}
