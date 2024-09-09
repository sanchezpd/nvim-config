----------------------------------------------------------------------------------------

                                 -- nvim-ts-autotag --


require('nvim-ts-autotag').setup({
    opts = {
        -- Defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = true -- Auto close on trailing </
    },
    -- Also override individual filetype configs, these take priority.
    -- Empty by default, useful if one of the "opts" global settings
    -- doesn't work well in a specific filetype
    per_filetype = {
        ["typescript"] = {
            enable_close = true,
            enable_rename = true,
            enable_close_on_slash = true
        }
    }
})



----------------------------------------------------------------------------------------

                                     -- Harpoon --


local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-ñ>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)



----------------------------------------------------------------------------------------

                                    -- Hexokinase --


vim.keymap.set("n", "<leader>hexo", ":HexokinaseToggle<cr>")



----------------------------------------------------------------------------------------

                                 -- Markdown Preview --


vim.keymap.set("n", "<leader>mdp", ":MarkdownPreviewToggle<cr>")



----------------------------------------------------------------------------------------

                                     -- Lua Line --


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {{ 'filename', path = 1, }},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}



----------------------------------------------------------------------------------------


                              -- Nvim Comment (Toggle) --


vim.keymap.set({'n', 'v'}, "<leader>}", ":CommentToggle<cr>")



----------------------------------------------------------------------------------------


                                     -- Surround --

-- require("nvim-surround").setup({})



----------------------------------------------------------------------------------------

                                    -- Telescope --


local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

require('telescope').load_extension('undo')
vim.keymap.set('n', '<leader>u', '<cmd>Telescope undo<cr>')



----------------------------------------------------------------------------------------

                                    -- Treesitter --


require'nvim-treesitter.configs'.setup{
    ensure_installed = { "angular", "c", "c_sharp", "css", "dockerfile", "html", "javascript", "json", "lua", "markdown", "markdown_inline", "python", "query", "sql", "typescript", "vim", "vimdoc", "yaml", },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true, additional_vim_regex_highlighting = false, },
}



----------------------------------------------------------------------------------------
