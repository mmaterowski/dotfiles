return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- Set up angularls server config
    opts.servers = opts.servers or {}
    opts.servers.angularls = {}

    -- Set up ESLint
    opts.servers.eslint = {
      settings = {
        format = { enable = true },
        autoFixOnSave = true,
      },
    }

    -- Set up angularls-specific setup function
    opts.setup = opts.setup or {}
    opts.setup.angularls = function()
      Snacks.util.lsp.on({ name = "angularls" }, function(_, client)
        --HACK: disable angular renaming capability due to duplicate rename popping up
        client.server_capabilities.renameProvider = false
      end)
    end

    -- Extend vtsls config with Angular plugin
    LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
      {
        name = "@angular/language-server",
        location = LazyVim.get_pkg_path("angular-language-server", "/node_modules/@angular/language-server"),
        enableForWorkspaceTypeScriptVersions = false,
      },
    })
  end,
}
