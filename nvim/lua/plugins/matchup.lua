-- ~/.config/nvim/lua/plugins/matchup.lua
return {
  "andymass/vim-matchup",
  event = "BufReadPost",
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
