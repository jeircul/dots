local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- need to translate to lua
vim.cmd [[filetype indent plugin on]]
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]

-- global options
o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
o.smartcase = true
o.splitright = true -- Vertical splits will automatically be to the right
o.splitbelow = true -- Horizontal splits will automatically be below
o.ignorecase = true
o.expandtab = true -- Converts tabs to spaces
o.mouse = "a" -- Enable your mouse
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4

-- window-local options
wo.number = true -- display line numbers
wo.relativenumber = true -- display relative line numbers

-- buffer-local options
