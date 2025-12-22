return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    keys = {
      { "<leader>a" },
      { "<leader>e" },
      { "<C-j>" },
      { "<C-k>" },
      { "<C-l>" },
      { "<C-ñ>" },
      { "<C-S-P>" },
      { "<C-S-N>" },
    },
    config = function()
      local harpoon = require("harpoon")

      harpoon:setup()

      -- Add current file to Harpoon list
      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { silent = true, desc = "Harpoon: add file" })

      -- Toggle Harpoon quick menu
      vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { silent = true, desc = "Harpoon: quick menu" })

      -- Jump to Harpoon entries
      vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end, { silent = true, desc = "Harpoon: go to 1" })
      vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end, { silent = true, desc = "Harpoon: go to 2" })
      vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end, { silent = true, desc = "Harpoon: go to 3" })
      vim.keymap.set("n", "<C-ñ>", function() harpoon:list():select(4) end, { silent = true, desc = "Harpoon: go to 4" })

      -- Cycle through Harpoon entries
      vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { silent = true, desc = "Harpoon: previous" })
      vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { silent = true, desc = "Harpoon: next" })
    end,
  },
}
