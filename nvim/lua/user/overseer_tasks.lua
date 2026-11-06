local overseer = require("overseer")

overseer.register_template({
  name = "npm build with Angular error parsing",
  builder = function()
    return {
      cmd = { "npm", "run", "build" },
      components = {
        "default",
        { "on_output_quickfix", open = true, errorformat = "%f:%l:%c: %m" },
      },
    }
  end,
})
