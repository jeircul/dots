local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'       -- Package manager
  -- Tools
  use {
    'luukvbaal/nnn.nvim',
    config = function()
      local builtin = require("nnn").builtin
      require('nnn').setup {
        picker = {
          fullscreen = false,
        },
        explorer = {
          fullscreen = false,
        },
        mappings = {
          { "<C-t>", builtin.open_in_tab },       -- open file(s) in tab
          { "<C-s>", builtin.open_in_split },     -- open file(s) in split
          { "<C-v>", builtin.open_in_vsplit },    -- open file(s) in vertical split
          { "<C-p>", builtin.open_in_preview },   -- open file in preview split keeping nnn focused
          { "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
        }
      }
    end
  }
  use 'kdheepak/lazygit.nvim'
  use 'tpope/vim-surround'           -- "Surround text with" actions
  use 'tpope/vim-fugitive'           -- Git commands in nvim
  use 'tpope/vim-rhubarb'            -- Fugitive-companion to interact with github
  use 'tpope/vim-sleuth'             -- Detects and sets indentation settings from the current file
  use 'b3nj5m1n/kommentary'
  use 'windwp/nvim-autopairs'
  use 'lambdalisue/suda.vim'
  use 'christoomey/vim-tmux-navigator'
  use 'melonmanchan/vim-tmux-resizer'
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}
  use 'lukas-reineke/indent-blankline.nvim'
  use 'vimwiki/vimwiki'
  -- Beautify
  use {
    'hoob3rt/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
}
  use 'navarasu/onedark.nvim'
  use 'folke/tokyonight.nvim'
  use {'dracula/vim', as = 'dracula'}
  use 'dylanaraps/wal.vim'
  use 'norcalli/nvim-colorizer.lua'
  -- Fuzzyfy
  use {
  'ojroques/nvim-lspfuzzy',
  requires = {
    {'junegunn/fzf'},
    {'junegunn/fzf.vim'},  -- to enable preview (optional)
  },
}
  -- Completion, snippets, syntax and LSP
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    "MunifTanjim/prettier.nvim",
}
  use 'hrsh7th/nvim-compe'           -- Autocompletion plugin
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use "rafamadriz/friendly-snippets"

  -- use 'honza/vim-snippets'
  use 'sheerun/vim-polyglot'         -- Collection of sensible settings for various languages
  use 'pearofducks/ansible-vim'
  use {
  "folke/lsp-trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("trouble").setup {
    }
  end
}
  -- new test
  use 'glepnir/lspsaga.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
