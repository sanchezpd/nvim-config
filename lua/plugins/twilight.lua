return {
  "folke/twilight.nvim",
  keys = {
    { "<leader>tw", "<cmd>Twilight<CR>", mode = "n", desc = "Twilight: toggle", silent = true },
  },
  opts = {
    context = 10,
    treesitter = true,
    expand = {
      "function_definition",
    },
  },
}
