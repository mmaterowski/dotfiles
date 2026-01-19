-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
-- Performance optimizations
vim.opt.updatetime = 300 -- Faster CursorHold events (default 4000)
vim.opt.timeoutlen = 300 -- Faster key sequence completion
vim.opt.redrawtime = 1500 -- Time in ms for redrawing the screen
vim.opt.ttimeoutlen = 10 -- Time in ms to wait for key code sequence

-- Disable some built-in plugins for better startup time
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
