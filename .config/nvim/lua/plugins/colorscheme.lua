return {

  -- tokyonight
  {
    "tokyonight.nvim",
    config = function()
      local tokyonight = require("tokyonight")
      tokyonight.setup({
        style = "night",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
    end,
  },

  -- tokyonight
  {
    "catppuccin/nvim",
    config = function()
      local catppuccin = require("catppuccin")
      catppuccin.setup({
        flavour = "mocha",
        transparent_background = true,
        term_colors = true,
      })
    end,
  },

  -- onedark
  {
    "navarasu/onedark.nvim",
    config = function()
      local onedark = require("onedark")
      onedark.setup({
        style = "darker",
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      })
    end,
  },

  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      local gruvbox = require("gruvbox")
      gruvbox.setup({
        transparent_mode = true,
      })
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
