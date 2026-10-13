return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "clang-format" },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang_format" },
        cpp = { "clang_format" },
        objc = { "clang_format" },
        objcpp = { "clang_format" },
      },
    },
  },
  {
    "LazyVim/LazyVim",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "c", "cpp" },
        callback = function()
          vim.opt_local.makeprg = "cmake --build build"
        end,
      })
    end,
  },
}
