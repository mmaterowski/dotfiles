return {
  "rgroli/other.nvim",
  config = function()
    require("other-nvim").setup({
      mappings = {
        "angular", -- built-in Angular support
      },
    })
  end,
  keys = {
    { "<leader>fo", "<cmd>Other<cr>", desc = "Other file" },
    { "<leader>fO", "<cmd>OtherClear<cr>", desc = "Clear other" },
  },
}
