return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  init = function()
    if vim.g.colors_name ~= "catppuccin" then
      vim.cmd.colorscheme("catppuccin")
    end
  end,
  opts = {
    flavour = "macchiato",
    transparent_background = true,
    float = {
      transparent = true,
      solid = false
    },
    integrations = {
      alpha = true,
      cmp = true,
      gitsigns = { enabled = true, transparent = true },
      harpoon = true,
      mason = true,
      nvim_surround = true,
      nvimtree = true,
      telescope = { enabled = true },
      treesitter = true,
    },

  },
}
