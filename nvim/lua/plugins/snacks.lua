return {
  "folke/snacks.nvim",
  opts = {
    notifier = {
      enabled = false,
      history = false, -- disable history to see if crashes stop
    },
    picker = {
      sources = {
        explorer = {
          layout = {
            layout = {
              width = 80,
            },
          },
        },
      },
    },
  },
}
