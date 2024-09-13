return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            'debugloop/telescope-undo.nvim'
        },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
            vim.keymap.set('n', '<C-p>', builtin.git_files, {})
            vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

            require('telescope').load_extension('undo')
            vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<cr>')

            require('telescope').setup {
                defaults = {
                    path_display = "truncate",
                }
            }
        end,
    },
}
