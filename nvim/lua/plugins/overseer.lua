return {
  "stevearc/overseer.nvim",
  opts = {
    templates = { "npm" },
    task_list = {
      direction = "bottom",
      min_height = 10,
      max_height = 40,
      height = 20,
      bindings = {},
    },
    task_launcher = {
      bindings = {},
    },
    -- Handle failed tasks gracefully instead of crashing
    on_complete_notify = {
      statuses = { "FAILURE", "SUCCESS" },
    },
    strategy = {
      "job",
    },
  },
  config = function(_, opts)
    require("overseer").setup(opts)
    require("user.overseer_tasks")
  end,
  keys = {
    { "<leader>ct", "<cmd>OverseerRun<cr>", desc = "Run task" },
    { "<leader>cT", "<cmd>OverseerToggle<cr>", desc = "Toggle tasks" },
    { "<leader>cq", "<cmd>OverseerQuickAction<cr>", desc = "Task action" },
  },
}
