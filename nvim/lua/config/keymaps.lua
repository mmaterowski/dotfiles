-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "<leader>yd", function()
  local full_path = vim.fn.expand("%:p")
  local root = vim.fs.root(0, { "nx.json", ".git" }) or vim.fn.getcwd()
  local rel_path = vim.fs.relpath(root, full_path) or full_path
  vim.fn.setreg("+", rel_path)
  vim.notify("Copied path: " .. rel_path)
end, { desc = "Copy file path relative to project root" })

vim.keymap.set(
  "n",
  "<leader>c-",
  ":w | !clang-tidy % --fix<CR>:e<CR>",
  { desc = "C++: save and apply clang-tidy fixes" }
)
