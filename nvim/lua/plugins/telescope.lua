return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function()
    local builtin = require("telescope.builtin")

    vim.api.nvim_create_user_command("FindIn", function(opts)
      builtin.find_files({ cwd = opts.args })
    end, { nargs = 1, complete = "dir" })

    vim.api.nvim_create_user_command("FindType", function(opts)
      builtin.find_files({
        find_command = { "rg", "--files", "--glob", "*." .. opts.args },
      })
    end, { nargs = 1 })

    vim.api.nvim_create_user_command("GrepIn", function(opts)
      builtin.live_grep({ cwd = opts.args })
    end, { nargs = 1, complete = "dir" })

    vim.api.nvim_create_user_command("GrepType", function(opts)
      builtin.live_grep({
        glob_pattern = "*." .. opts.args,
      })
    end, { nargs = 1 })
  end,
}
