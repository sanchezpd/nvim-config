return {
    { 'windwp/nvim-ts-autotag' },
    { 'ThePrimeagen/harpoon', branch = "harpoon2" },
    { 'airblade/vim-gitgutter' },
    { 'RRethy/vim-hexokinase', build = "make hexokinase" },
    { 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" }
    },
    {
        'terrortylor/nvim-comment',
        config = function ()
            require('nvim_comment').setup({ create_mappings = false })
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = {
                         'nvim-lua/plenary.nvim',
                         'BurntSushi/ripgrep',
                         'debugloop/telescope-undo.nvim'
                       }
    },
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
    {
        'altermo/ultimate-autopair.nvim',
        event={'InsertEnter','CmdlineEnter'},
        branch='v0.6', --recommended as each new version will have breaking changes
        opts={
            --Config goes here
        },
    },
    -- { 'ThePrimeagen/vim-be-good' },
}
