vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.html" },
  callback = function()
    local bufname = vim.api.nvim_buf_get_name(0)
    local ext = vim.fn.fnamemodify(bufname, ":e")
    if ext == "html" then
      for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
        if line:match("{{") then
          vim.bo.filetype = "gohtmltmpl"
          break
        end
      end
    end
  end,
})

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        -- "htmx-lsp",
      },
    },
  },
  -- {
  --   "phelipetls/vim-hugo",
  --   config = function() end,
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {
          filetypes = { "gohtmltmpl", "htmlhugo" },
        },
      },
    },
  },
  -- {
  --   "fatih/vim-go",
  --   config = function() end,
  -- },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        gohtmltmpl = {
          "prettier",
        },
        html = {
          "prettier",
        },
      },
    },
  },
}
