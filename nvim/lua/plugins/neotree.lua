return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "s1n7ax/nvim-window-picker",
  },
  opts = {
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          -- auto close Neo-tree after opening a file
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },

    window = {
      width = 80, -- or whatever width you want
    },
  },
}
