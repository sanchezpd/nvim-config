return {
    {
        "neanias/everforest-nvim",
        name = 'everforest',
        lazy = false,
        version = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        opts = {
            background = hard,
            transparent_background_level = 1,
        },
    },

    {
        "catppuccin/nvim",
        name = 'catppuccin',
        lazy = false,
        priority = 1000,
        opts = {
            flavour = "macchiato",
            transparent_background = true,
            integrations = {
                cmp = true,
                gitgutter = true,
                harpoon = true,
                mason = true,
                telescope = { enabled = true, },
                treesitter = true,
            },
        },
    },
    {
        "Mofiqul/vscode.nvim",
        name = 'vscode',
        priority = 1000,
        opts = {
            transparent = true,
        }
    }
}
