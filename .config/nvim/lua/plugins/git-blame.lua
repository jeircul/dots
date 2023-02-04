return {

  -- gitblame
  "f-person/git-blame.nvim",
  event = "BufRead",
  cmd = {
    "GitBlameToggle",
    "GitBlameEnable",
    "GitBlameDisable",
  },
  lazy = true,
  keys = {
    { "<leader>gb", "<cmd>GitBlameToggle<cr>", desc = "Git Blame toggle" },
  },
}
