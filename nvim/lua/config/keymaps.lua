-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<Esc>")

vim.keymap.set("n", "<leader>yd", function()
  -- Get the full path of the current file
  local full_path = vim.fn.expand("%:p")

  -- Get the workspace root (you can adjust this to your Nx workspace root)
  local workspace_root = "/Users/Michal.Materowski/Projects/backoffice"

  -- Make path relative to workspace root
  local rel_path = full_path:sub(#workspace_root + 2) -- +2 to remove trailing slash

  -- Copy to system clipboard
  vim.fn.setreg("+", rel_path)
  vim.notify("Copied workspace-relative path: " .. rel_path)
end, { desc = "Copy file path relative to Nx workspace root" })
