local root_files = {
  ".git",
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        --@type vim.lsp.Config
        ["rust_analyzer"] = {
          filetypes = { "rust" },
          root_dir = (function()
            return vim.fs.root(0, root_files)
          end)(),
        },
      },
    },
  },
}
