-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "kanagawa*",
  callback = function()
    vim.cmd([[
      highlight Normal guibg=NONE
      highlight NormalFloat guibg=NONE
      highlight FloatBorder guibg=NONE
      highlight FloatTitle guibg=NONE
      highlight NormalNC guibg=NONE
      highlight SignColumn guibg=NONE
      highlight MsgArea guibg=NONE
      highlight WinSeparator guibg=NONE
      highlight NormalDark guibg=NONE
      highlight LazyNormal guibg=NONE
      highlight MasonNormal guibg=NONE
    ]])
  end,
})
