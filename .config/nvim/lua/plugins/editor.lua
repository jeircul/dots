vim.g.neo_tree_remove_legacy_commands = 1

return {

  -- file explorer
  {
    "luukvbaal/nnn.nvim",
    cmd = { "NnnPicker", "NnnExplorer", },
    config = function()
      local nnn = require("nnn")
      local builtin = require("nnn").builtin
      nnn.setup({
        picker = {
          fullscreen = false,
          cmd = "nnn -H",
          style = { border = "rounded" },
        },
        explorer = {
          fullscreen = false,
        },
        replace_netrw = "picker",
        mappings = {
          { "<C-t>", builtin.open_in_tab }, -- open file(s) in tab
          { "<C-s>", builtin.open_in_split }, -- open file(s) in split
          { "<C-v>", builtin.open_in_vsplit }, -- open file(s) in vertical split
          { "<C-p>", builtin.open_in_preview }, -- open file in preview split keeping nnn focused
          { "<C-y>", builtin.copy_to_clipboard }, -- copy file(s) to clipboard
          { "<C-w>", builtin.cd_to_path }, -- cd to file directory
          { "<C-e>", builtin.populate_cmdline }, -- populate cmdline (:) with file(s)
        },
      })
    end,
  },

  -- fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find Git Files" },
      { "<leader>fr", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Show help tags" },
      { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "Show commands" },
      { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Find in Files (Grep)" },
    },
    config = true,
  },

  -- which-key
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({
        show_help = false,
        plugins = { spelling = true },
        key_labels = { ["<leader>"] = "SPC" },
      })
      wk.register({
        ["g"] = { name = "+goto" },
        ["]"] = { name = "+next" },
        ["["] = { name = "+prev" },
        ["<leader>b"] = { name = "+buffer" },
        ["<leader>c"] = { name = "+code" },
        ["<leader>f"] = { name = "+file" },
        ["<leader>g"] = { name = "+git" },
        ["<leader>x"] = { name = "+diagnostics" },
      })
    end,
  },

  -- git signs
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = {
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "契" },
        topdelete = { text = "契" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },
    },
  },

  -- references
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost",
    config = function()
      require("illuminate").configure({ delay = 200 })
    end,
    keys = {
      {
        "]]",
        function()
          require("illuminate").goto_next_reference(false)
        end,
        desc = "Next Reference",
      },
      {
        "[[",
        function()
          require("illuminate").goto_prev_reference(false)
        end,
        desc = "Prev Reference",
      },
    },
  },

  -- buffer remove
  {
    "echasnovski/mini.bufremove",
    keys = {
      {
        "<leader>bd",
        function()
          require("mini.bufremove").delete(0, false)
        end,
        desc = "Delete Buffer",
      },
      {
        "<leader>bD",
        function()
          require("mini.bufremove").delete(0, true)
        end,
        desc = "Delete Buffer (Force)",
      },
    },
  },
}
