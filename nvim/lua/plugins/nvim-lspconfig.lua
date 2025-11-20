return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- TypeScript/Angular
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
