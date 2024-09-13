return {
    { 'airblade/vim-gitgutter' },
    { 'RRethy/vim-hexokinase', build = "make hexokinase" },
    {
        'altermo/ultimate-autopair.nvim',
        event = { 'InsertEnter', 'CmdlineEnter' },
        branch = 'v0.6', --recommended as each new version will have breaking changes
        opts = {
            --Config goes here
        },
    },
    -- { 'ThePrimeagen/vim-be-good' },
}
