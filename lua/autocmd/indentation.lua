local group = vim.api.nvim_create_augroup("Filetype indentation", { clear = true })

vim.api.nvim_create_autocmd("BufEnter", {
    desc = 'Change indentation to 2 within html files.',
    group = group,
    callback = function (opts)

        local languages = { 'html' }

        local shortLanguage = function ()
            for _, language in ipairs(languages) do
                if vim.bo[opts.buf].filetype == language then
                    return true
                end
            end
            return false
        end

        if shortLanguage() then
            vim.cmd 'set tabstop=2'
            vim.cmd 'set softtabstop=2'
            vim.cmd 'set shiftwidth=2'
        else
            vim.cmd 'set tabstop=4'
            vim.cmd 'set softtabstop=4'
            vim.cmd 'set shiftwidth=4'
        end

    end,
})

-- -- vim.api.nvim_create_autocmd('Filetype', {
-- --     desc = 'Change indentation to 2 for selected filetypes.',
-- --
-- --     pattern = { 'html' },
-- --     group = group,
-- --     callback = function(opts)
-- --
-- --         vim.api.nvim_create_autocmd('BufEnter', {
-- --             buffer = opts.buf,
-- --             callback = function ()
-- --                 vim.opt.tabstop=2
-- --                 vim.opt.softtabstop=2
-- --                 vim.opt.shiftwidth=2
-- --             end
-- --         })
-- --
-- --         vim.api.nvim_create_autocmd({ 'BufLeave', 'ExitPre' }, {
-- --             buffer = opts.buf,
-- --             callback = function ()
-- --                 vim.opt.tabstop=4
-- --                 vim.opt.softtabstop=4
-- --                 vim.opt.shiftwidth=4
-- --             end
-- --         })
-- --
-- --     end,
-- -- })
