local map = vim.api.nvim_set_keymap

-- maps the leader key
map('n', '<Space>', '', {})
vim.g.mapleader = ' ' -- 'vim.g' sets global variables

options = { noremap = true }
map('n', '<esc><esc>', ':nohlsearch<cr>', options)
map('n', '<TAB>', ':bnext<cr>', options)
map('n', '<S-TAB>', ':bprev<cr>', options)
map('n', 'ss', ':vsplit<Return><C-w>w', options)
map('n', 'S', ':%s///gc<Left><Left><Left><Left>', options)
map("n", "<leader>xx", "<cmd>LspTroubleToggle<cr>", options)
map("n", "<C-s>", ':w<cr>', options)

-- vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true}) -- Y yank until the end of line
map("n", "<C-n>", ":NnnPicker %:p:h<cr>", { noremap = true, silent = true })
map("n", "<C-e>", ":NnnExplorer %:p:h<cr>", { noremap = true, silent = true })

-- SnipRun
map('v', 'f', '<Plug>SnipRun', {silent = true})
map('n', '<leader>f', '<Plug>SnipRunOperator', {silent = true})
map('n', '<leader>ff', '<Plug>SnipRun', {silent = true})
