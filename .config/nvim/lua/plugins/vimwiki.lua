return {
  {
    "vimwiki/vimwiki",
    cmd = "VimwikiIndex",
    keys = { "<leader>w" },
    init = function()
      vim.g.vimwiki_list = {
        { path = "~/vimwiki/", syntax = "markdown", ext = ".md" },
      }
      vim.g.vimwiki_conceallevel = 0
      vim.g.vimwiki_use_calendar = 1
      vim.g.vimwiki_hl_headers = 1
      vim.g.vimwiki_hl_cb_checked = 1
      vim.g.vimwiki_autowriteall = 0
      -- vim.g.vimwiki_map_prefix = "<F12>"
      vim.g.vimwiki_table_mappings = 0
    end,
  },
}
