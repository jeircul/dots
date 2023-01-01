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
  -- Explorer
  use 'luukvbaal/nnn.nvim'
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
}
  -- Tools
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
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
})
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
  use 'lukas-reineke/indent-blankline.nvim'
  use 'vimwiki/vimwiki'
  use { 'michaelb/sniprun', run = 'bash ./install.sh'}
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

  use 'glepnir/lspsaga.nvim'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

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

  if packer_bootstrap then
    require('packer').sync()
  end
end)
