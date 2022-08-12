-- Install packer
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '.. install_path)
end

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]], false)

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim'       -- Package manager
  -- Tools
  use 'mcchrish/nnn.vim'
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


  -- UI to select things (files, grep results, open buffers...)
  --use {'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}} }
  -- Add indentation guides even on blank lines
  -- Add git related info in the signs columns and popups
  --use {'lewis6991/gitsigns.nvim', requires = {'nvim-lua/plenary.nvim'} }
end)
