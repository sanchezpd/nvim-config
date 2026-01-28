-- File explorer
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { silent = true })

-- Native comment
vim.keymap.set("n", "<leader>}", "gcc", { remap = true, silent = true, desc = "Comment line" })
vim.keymap.set("x", "<leader>}", "gc", { remap = true, silent = true, desc = "Comment selection" })

-- Window navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", { silent = true, desc = "Window: left" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { silent = true, desc = "Window: down" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { silent = true, desc = "Window: up" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { silent = true, desc = "Window: right" })

-- Move selected lines up/down (visual)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection down" })

-- Keep cursor centered / preserve positon
vim.keymap.set("n", "J", "mzJ`z", { silent = true, desc = "Join lines (keep cursor)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Half-page down (center)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Half-page up (center)" })
vim.keymap.set("n", "n", "nzzzv", { silent = true, desc = "Next search (center + unfold)" })
vim.keymap.set("n", "N", "Nzzzv", { silent = true, desc = "Prev search (center + unfold)" })

-- Paste without overwriting default register (visual)
vim.keymap.set("x", "<leader>p", [["_dP]], { silent = true, desc = "Paste (keep yank)" })

-- Clipboard yanks/pastes
vim.keymap.set({ "n", "x" }, "<leader>y", [["+y]], { silent = true, desc = "Yank to system clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>v", [["+p]], { silent = true, desc = "Paste from system clipboard" })

-- Delete without yanking
vim.keymap.set({ "n", "x" }, "<leader>d", [["_d]], { silent = true, desc = "Delete (no yank)" })

-- Rename in file without LSP
-- vim.keymap.set("n", "<leader>s", "<cmd>%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Repeat ], [ movements
vim.api.nvim_create_user_command("BindBracketsToComma", function()
  vim.notify("Press selector for ]x/[x (d/q/c/f/])")
  local x = vim.fn.getcharstr()
  if x == nil or x == "" then return end
  vim.keymap.set("n", ",", "]" .. x, { silent = true, remap = true })
  vim.keymap.set("n", ";", "[" .. x, { silent = true, remap = true })
end, {})

vim.keymap.set("n", "<leader>]", "<cmd>BindBracketsToComma<CR>", { silent = true })
