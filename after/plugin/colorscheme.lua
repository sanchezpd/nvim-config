require("everforest").setup({
    background = "hard",
    transparent_background_level = 1,
})

require("catppuccin").setup({
    flavour = "macchiato",
    transparent_background = true,
    integrations = {
        harpoon = true,
        mason = true,
        cmp = true,
        treesitter = true,
        telescope = { enabled = true, },
        gitgutter = true,
    },
})

vim.cmd.colorscheme "catppuccin"
