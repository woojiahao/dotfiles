local root_files = {
  "package.json",
  ".git",
}

vim.g.lazyvim_prettier_needs_config = true

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "css-lsp",
        "html-lsp",
        "htmlbeautifier",
        "tailwindcss-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        --@type vim.lsp.Config
        html = {
          filetypes = { "html" },
          root_dir = (function()
            return vim.fs.root(0, root_files)
          end)(),
        },
        --@type vim.lsp.Config
        vtsls = {
          root_dir = function()
            return vim.fs.root(0, root_files)
          end,
          settings = {
            typescript = {
              preferences = {
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
                importModuleSpecifier = "non-relative",
              },
            },
          },
        },
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    opts = {},
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {}, -- your configuration
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        astro = {
          "prettier",
        },
      },
    },
  },
}
