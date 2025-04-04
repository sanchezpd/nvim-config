return {
    'folke/noice.nvim',
    event = "VeryLazy",
    opts = {
        lsp = {
            progress = { enabled = false },
            hover = { enabled = false },
            signature = { enabled = false },
        },
        messages = { enabled = false },
        notify = { enabled = false },
        popupmenu = { enabled = true },
        cmdline = { enabled = true },
    },
    dependencies = {
        'MunifTanjim/nui.nvim',
    },
    config = function ()
        require('noice').setup({
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = false,
                inc_rename = false,
                lsp_doc_border = false,
            },
            views = {
                cmdline_popup = {
                    position = {
                        row = '50%',
                        col = '50%',
                    },
                },
                win_options = {
                    winhighlight = 'Normal:NormalFloat,FloatBOrder:TitleBorder',
                }
            },
        })
    end,
}
