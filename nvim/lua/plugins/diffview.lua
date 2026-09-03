return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local actions = require("diffview.actions")

      require("diffview").setup({
        view = {
          merge_tool = {
            layout = "diff3_mixed",
            disable_diagnostics = true,
            winbar_info = true,
          },
        },

        keymaps = {
          view = {
            { "n", "<leader>e", actions.focus_files, { desc = "Focus file panel" } },
            { "n", "<leader>b", actions.toggle_files, { desc = "Toggle file panel" } },
            { "n", "g<C-x>", actions.cycle_layout, { desc = "Cycle layout" } },

            { "n", "[x", actions.prev_conflict, { desc = "Previous conflict" } },
            { "n", "]x", actions.next_conflict, { desc = "Next conflict" } },

            { "n", "<leader>co", actions.conflict_choose("ours"), { desc = "Choose OURS" } },
            { "n", "<leader>ct", actions.conflict_choose("theirs"), { desc = "Choose THEIRS" } },
            { "n", "<leader>cb", actions.conflict_choose("base"), { desc = "Choose BASE" } },
            { "n", "<leader>ca", actions.conflict_choose("all"), { desc = "Choose ALL" } },

            { "n", "<leader>cO", actions.conflict_choose_all("ours"), { desc = "Choose OURS (file)" } },
            { "n", "<leader>cT", actions.conflict_choose_all("theirs"), { desc = "Choose THEIRS (file)" } },
          },

          diff3 = {
            { { "n", "x" }, "2do", actions.diffget("ours") },
            { { "n", "x" }, "3do", actions.diffget("theirs") },
          },
        },
      })

      vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<cr>", {
        desc = "Open Diffview",
      })

      vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<cr>", {
        desc = "Close Diffview",
      })
    end,
  },
}
