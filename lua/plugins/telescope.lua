return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "debugloop/telescope-undo.nvim"
    },
    config = function()
      local builtin = require("telescope.builtin")
      local telescope = require("telescope")

      vim.keymap.set("n", "<leader>pf", builtin.find_files, { silent = true, desc = "Telescope: find files" })
      vim.keymap.set("n", "<leader>pg", builtin.git_files, { silent = true, desc = "Telescope: git files" })
      vim.keymap.set("n", "<leader>pb", builtin.buffers, { silent = true, desc = "Telescope: buffers" })
      vim.keymap.set("n", "<leader>ps", builtin.live_grep, { silent = true, desc = "Telescope: live grep" })
      vim.keymap.set("n", "<leader>pw", builtin.grep_string, { silent = true, desc = "Telescope: grep word under cursor" })
      vim.keymap.set("n", "<leader>ts", builtin.treesitter, { silent = true, desc = "Telescope: Treesitter symbols" })
      vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, { silent = true, desc = "Telescope: buffer fuzzy find" })

      telescope.load_extension("undo")
      vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { silent = true, desc = "Telescope: undo history" })

      telescope.setup {
        defaults = {
          path_display = { "truncate" },
        },
        -- pickers = {
        --     find_files = {
        --         hidden = true,
        --         no_ignore = true,
        --     },
        --     live_grep = {
        --         hidden = true,
        --         no_ignore = true,
        --     },
        -- },
      }
    end,
  },
}
