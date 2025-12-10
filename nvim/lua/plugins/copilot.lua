return {
  -- Configure copilot for inline completion (ghost text)
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<Tab>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = false, -- Disable popup panel
      },
    },
  },

  -- Configure blink.cmp to not interfere with copilot inline
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          copilot = {
            enabled = false, -- Disable copilot in popup
          },
        },
      },
    },
  },
}
