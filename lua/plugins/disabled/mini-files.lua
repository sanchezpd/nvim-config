return {
  -- Trying mini.files occasionally
  'nvim-mini/mini.files',
  version = false,
  keys = { { "<leader>pt", function() MiniFiles.open() end, mode = "n", } }
}
