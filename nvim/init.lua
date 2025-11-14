-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          layout = {
            layout = {
              width = 100,
            },
          },
        },
      },
    },
  },
}
