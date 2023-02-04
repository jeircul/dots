return {

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local tokyonight = require("tokyonight")
      tokyonight.setup({
        style = "night",
        transparent = true,
      })
      tokyonight.load()
    end,
  },

  -- onedark
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local onedark = require("onedark")
      onedark.setup({
        style = "darker",
        transparent = true,
        lualine = {
          transparent = true,
        },
      })
      -- onedark.load()
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
