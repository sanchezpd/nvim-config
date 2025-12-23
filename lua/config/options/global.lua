vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

for _, provider in ipairs({
  "node",
  "perl",
  "python3",
  "ruby",
}) do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
