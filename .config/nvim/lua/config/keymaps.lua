-- navigate buffers
vim.keymap.set("n", "<TAB>", ":bnext<cr>")
vim.keymap.set("n", "<S-TAB>", ":bprev<cr>")

-- Move Lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Easier pasting
vim.keymap.set("n", "[p", ":pu!<cr>")
vim.keymap.set("n", "]p", ":pu<cr>")

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
vim.keymap.set("n", "gw", "*N")
vim.keymap.set("x", "gw", "*N")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
-- vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
-- vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- save in insert mode
vim.keymap.set("i", "<C-s>", "<cmd>:w<cr><esc>")
vim.keymap.set("n", "<C-s>", "<cmd>:w<cr><esc>")

-- better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- lazygit
vim.keymap.set("n", "<leader>lg", function()
  require("lazy.util").open_cmd({ "lazygit" }, {
    terminal = true,
    close_on_exit = true,
    enter = true,
    float = {
      size = { width = 0.9, height = 0.9 },
      margin = { top = 0, right = 0, bottom = 0, left = 0 },
    },
  })
end, { desc = "Lazygit" })

-- nnn
vim.keymap.set("n", "<C-n>", ":NnnPicker %:p:h<CR>")
vim.keymap.set("n", "<C-e>", ":NnnExplorer %:p:h<CR>")

-- tmux navigator
vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
vim.keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")
vim.keymap.set({ "n", "t" }, "<C-p>", "<CMD>NavigatorPrevious<CR>")
