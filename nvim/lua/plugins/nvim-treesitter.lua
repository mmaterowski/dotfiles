return {
  "nvim-treesitter",
  opts = function(_, opts)
    if type(opts.ensure_installed) == "table" then
      vim.list_extend(
        opts.ensure_installed,
        { "svelte", "typescript", "javascript", "angular", "scss", "gdscript", "godot_resource", "gdshader" }
      )
    end

    opts.highlight = opts.highlight or {}
    opts.highlight.enable = true


  end,
}
