return {

  -- measure startuptime
  {
    "dstein64/vim-startuptime", cmd = "StartupTime"
  },

  -- navigator for tmux
  {
    "numToStr/Navigator.nvim",
    cmd = { "NavigatorLeft", "NavigatorRight", "NavigatorUp", "NavigatorDown", "NavigatorPrevious" },
    config = true,
  }
}
