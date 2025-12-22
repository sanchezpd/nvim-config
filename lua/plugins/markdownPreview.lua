return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    keys = {
      { "<leader>mdp", "<cmd>MarkdownPreviewToggle<CR>", mode = "n", silent = true, desc = "Markdown: preview toggle" }
    },
  },
}
