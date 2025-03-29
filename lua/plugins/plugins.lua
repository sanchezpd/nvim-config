return {
    {
        'airblade/vim-gitgutter',
        event = { 'BufReadPre', 'BufNewFile' },
    },
    -- { 'RRethy/vim-hexokinase', build = "make hexokinase" },
    {
        'altermo/ultimate-autopair.nvim',
        event = { 'InsertEnter', 'CmdlineEnter' },
        branch = 'v0.6', --recommended as each new version will have breaking changes
        opts = {
            --Config goes here
        },
    },
    -- {
    --     'lukas-reineke/indent-blankline.nvim',
    --     event = { 'BufReadPre', 'BufNewFile' },
    --     main = 'ibl',
    --     opts = {},
    -- },
    -- { 'ThePrimeagen/vim-be-good' },
}
