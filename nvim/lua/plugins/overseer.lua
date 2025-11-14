return {
  "stevearc/overseer.nvim",
  opts = {
    templates = { "npm" },
  },
  keys = {
    { "<leader>ct", "<cmd>OverseerRun<cr>", desc = "Run task" },
    { "<leader>cT", "<cmd>OverseerToggle<cr>", desc = "Toggle tasks" },
    { "<leader>cq", "<cmd>OverseerQuickAction<cr>", desc = "Task action" },
  },
}
