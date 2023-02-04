-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- navigate buffers
vim.keymap.set("n", "<TAB>", ":bnext<cr>")
vim.keymap.set("n", "<S-TAB>", ":bprev<cr>")

-- nnn
vim.keymap.set("n", "<C-n>", ":NnnPicker %:p:h<cr>")

-- tmux navigator
vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
vim.keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
vim.keymap.set({ "n", "t" }, "<C-p>", "<CMD>NavigatorPrevious<CR>")

-- disable keymap
vim.api.nvim_del_keymap("n", "<leader>ww") -- should be vimwiki instead
