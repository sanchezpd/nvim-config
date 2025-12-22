return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  cmd = { "NvimTreeToggle", "NvimTreeFindFile", "NvimTreeFindFileToggle" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>pv", "<cmd>NvimTreeFindFile<CR>",       mode = "n", silent = true, desc = "NvimTree: find current file" },
    { "<leader>pt", "<cmd>NvimTreeFindFileToggle<CR>", mode = "n", silent = true, desc = "NvimTree: toggle + find current file" },
  },
  opts = {
    view = {
      width = 30,
    },
    -- filters = {
    --     dotfiles = false,
    --     git_ignored = false,
    -- },
  },
  -- Trying mini.files occasionally
  -- 'nvim-mini/mini.files',
  -- version = false,
  -- keys = { { "<leader>pt", function() MiniFiles.open() end, mode = "n", } }
}
