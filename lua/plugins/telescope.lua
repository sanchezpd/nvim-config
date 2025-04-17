return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        event = 'VeryLazy',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep',
            'debugloop/telescope-undo.nvim'
        },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files)
            vim.keymap.set('n', '<leader>pg', builtin.git_files)
            vim.keymap.set('n', '<leader>pb', builtin.buffers)
            vim.keymap.set('n', '<leader>ps', builtin.live_grep)
            vim.keymap.set('n', '<leader>pw', builtin.grep_string)
            vim.keymap.set('n', '<leader>ts', builtin.treesitter)
            vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find)

            require('telescope').load_extension('undo')
            vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<cr>')

            require('telescope').setup {
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
