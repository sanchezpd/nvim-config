return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = 'VeryLazy',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects', },
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "angular",
                    "c",
                    "c_sharp",
                    "css",
                    "dockerfile",
                    "html",
                    "javascript",
                    "json",
                    "lua",
                    "markdown",
                    "markdown_inline",
                    "python",
                    "query",
                    "sql",
                    "typescript",
                    "vim",
                    "vimdoc",
                    "yaml",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        lazy = true,
        config = function()
            require('nvim-treesitter.configs').setup({
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ['if'] = '@function.inner',
                            ['af'] = '@function.outer',
                            ['ip'] = '@parameter.inner',
                            ['ap'] = '@parameter.outer',
                            ['ii'] = '@conditional.inner',
                            ['ai'] = '@conditional.outer',
                            ['il'] = '@loop.inner',
                            ['al'] = '@loop.outer',
                            ['ic'] = '@class.inner',
                            ['ac'] = '@class.outer',
                            ['i='] = '@assignment.inner',
                            ['a='] = '@assignment.outer',
                            ['l='] = '@assignment.lhs',
                            ['r='] = '@assignment.rhs',
                            ['it'] = '@type.inner',
                        },
                    },
                    -- move = {
                    --     enable = true,
                    --     set_jumps = true,
                    --     goto_next_start = {
                    --         [] = '@function.outer',
                    --     },
                    -- },
                },
            })
        end
    }
}
