-- ~/.config/nvim/lua/plugins/bufferline.lua
return {
  "akinsho/bufferline.nvim",
  keys = {
    -- Buffer switching with <leader>b[0-9]
    { "<leader>b0", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to buffer 0" },
    { "<leader>b1", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to buffer 1" },
    { "<leader>b2", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to buffer 2" },
    { "<leader>b3", "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to buffer 3" },
    { "<leader>b4", "<Cmd>BufferLineGoToBuffer 5<CR>", desc = "Go to buffer 4" },
    { "<leader>b5", "<Cmd>BufferLineGoToBuffer 6<CR>", desc = "Go to buffer 5" },
    { "<leader>b6", "<Cmd>BufferLineGoToBuffer 7<CR>", desc = "Go to buffer 6" },
    { "<leader>b7", "<Cmd>BufferLineGoToBuffer 8<CR>", desc = "Go to buffer 7" },
    { "<leader>b8", "<Cmd>BufferLineGoToBuffer 9<CR>", desc = "Go to buffer 8" },
    { "<leader>b9", "<Cmd>BufferLineGoToBuffer 10<CR>", desc = "Go to buffer 9" },
  },
  opts = {
    options = {
      -- Show buffer numbers (0-indexed to match keymaps)
      numbers = function(opts)
        return string.format("%s", opts.ordinal - 1)
      end,

      -- Make tabs wider
      max_name_length = 25,
      max_prefix_length = 20,
      tab_size = 25,

      -- Better separation between buffers
      separator_style = "slant", -- or "thick", "thin", "padded_slant"

      -- Always show bufferline
      always_show_bufferline = true,

      -- Show close button
      show_close_icon = true,
      show_buffer_close_icons = true,

      -- Diagnostics
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level)
        local icon = level:match("error") and " " or " "
        return " " .. icon .. count
      end,
    },
  },
}
