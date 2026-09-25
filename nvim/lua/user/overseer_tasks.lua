local overseer = require("overseer")

overseer.register_template({
  name = "npm build with Angular error parsing",
  builder = function()
    return {
      cmd = { "npm", "run", "build" },
      components = {
        "default",
        { "on_output_quickfix", open = true },
      },
      on_output_quickfix = {
        on_line = function(line)
          -- parse Angular NG errors from HTML files
          local file, lnum, col, msg = line:match("(%S+%.html):(%d+):(%d+):%s*(.*)")
          if file and lnum then
            return {
              filename = fil,
              lnum = tonumber(lnum),
              col = tonumber(col) or 1,
              text = msg,
              type = "E",
            }
          end
        end,
      },
    }
  end,
})
