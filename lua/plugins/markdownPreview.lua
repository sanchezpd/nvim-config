return {
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    keys = {
      { "<leader>mdp", "<cmd>MarkdownPreviewToggle<CR>", mode = "n", ft = "markdown", silent = true, desc = "Markdown: preview toggle" }
    },
  },
}
