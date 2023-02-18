-- disable alpha
return {
  { "goolord/alpha-nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- disable a keymap
      keys[#keys + 1] = { "gt", false }
    end,
  },
}
