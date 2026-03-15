return {
  {
    "catppuccin/nvim",
    opts = {
      transparent_background = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      transparent_mode = true,
    },
  },
  {
    "rebelot/kanagawa.nvim",
    opts = {
      transparent = true,
      dimInactive = false,
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            },
          },
        },
      },
      on_highlights = function(hl, colors)
        local theme = colors
        hl.NormalFloat = { bg = "none" }
        hl.FloatBorder = { bg = "none" }
        hl.FloatTitle = { bg = "none" }
        hl.NormalDark = { fg = theme.fg_dark, bg = "none" }
        hl.LazyNormal = { fg = theme.fg_dark, bg = "none" }
        hl.MasonNormal = { fg = theme.fg_dark, bg = "none" }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "TokyoNight",
    },
  },
}
