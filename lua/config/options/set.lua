vim.opt.number = true
vim.opt.relativenumber = true
vim.o.showcmd = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt_global.wrap = false
vim.opt.linebreak = true
-- vim.opt.showbreak = "↪\\"
vim.opt.breakindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = { vim.fn.stdpath("data") .. "/undodir/" }
-- vim.g.null_ls_temp_dir = vim.fn.stdpath("cache") .. "null-ls"
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.winborder = "rounded"

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.scrolloff = 10
-- vim.opt.sidescrolloff = 48
vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")
-- vim.opt.cmdheight = 0

vim.opt.updatetime = 50
vim.opt.colorcolumn = "121"
vim.opt.textwidth = 120

vim.opt.grepprg="rg --vimgrep --smart-case -P"

vim.filetype.add({
  filename = {
    ["docker-compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["docker-compose.dev.yaml"] = "yaml.docker-compose",
    ["compose.yml"] = "yaml.docker-compose",
    ["compose.yaml"] = "yaml.docker-compose",
  },
})
