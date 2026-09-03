return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      setup = {
        ["*"] = function(server, opts)
          if opts.on_attach then
            local original_on_attach = opts.on_attach
            opts.on_attach = function(client, bufnr)
              -- Disable formatting capability for all LSP servers
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
              original_on_attach(client, bufnr)
            end
          else
            opts.on_attach = function(client, bufnr)
              -- Disable formatting capability for all LSP servers
              client.server_capabilities.documentFormattingProvider = false
              client.server_capabilities.documentRangeFormattingProvider = false
            end
          end
        end,
        vtsls = function(_, opts)
          opts.settings.javascript =
            vim.tbl_deep_extend("force", {}, opts.settings.typescript, opts.settings.javascript or {})
        end,
      },
      servers = {
        -- TypeScript/Angular
        vtsls = {
          settings = {
            vtsls = {
              autoUseWorkspaceTsdk = true,
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
        },
        tsserver = {
          globalPlugins = {
            {
              name = "@angular/language-server",
              location = require("mason-registry").get_package("angular-language-server"):get_install_path()
                .. "/node_modules/@angular/language-server",
              enableForWorkspaceTypeScriptVersions = false,
            },
          },
        },
        ts_ls = {
          settings = {
            typescript = {
              format = {
                enable = false, -- Use ESLint for formatting
              },
            },
            javascript = {
              format = {
                enable = false,
              },
            },
          },
        },
        -- Angular Language Server
        angularls = {
          filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx", "htmlangular" },
        },
        -- HTML Language Server
        html = {
          filetypes = { "html", "htmlangular" },
          settings = {
            html = {
              format = {
                enable = false, -- Use ESLint for formatting
              },
            },
          },
        },
        -- GraphQL
        graphql = {
          filetypes = { "graphql", "gql" },
        },
        -- SCSS/CSS
        cssls = {
          settings = {
            css = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
            scss = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
      },
    },
  },
}
