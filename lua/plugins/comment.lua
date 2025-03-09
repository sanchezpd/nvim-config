return {
    {
        'terrortylor/nvim-comment',
        lazy = true,
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            require('nvim_comment').setup({ create_mappings = false })
            vim.keymap.set({ 'n', 'v' }, "<leader>}", ":CommentToggle<cr>")
        end
    },
}
