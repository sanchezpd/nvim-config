require("config.set")
require("config.lazy")

vim.cmd.colorscheme "catppuccin"
vim.g.null_ls_temp_dir = vim.fn.stdpath('cache') .. 'null-ls'
