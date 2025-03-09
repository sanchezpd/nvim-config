return {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    dependencies = {
        {
            'nvim-neotest/nvim-nio',
            'rcarriga/nvim-dap-ui',
            'mfussenegger/nvim-dap-python',
            'theHamsta/nvim-dap-virtual-text',
            {
                'jay-babu/mason-nvim-dap.nvim',
                dependencies = {
                    'williamboman/mason.nvim',
                }
            },
        },
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')
        local dap_python = require('dap-python')
        local dap_virtual_text = require('nvim-dap-virtual-text')
        local mason = require('mason-nvim-dap')

        -- Set path for debugger according to OS
        local debugpy_path = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/'
        if package.config:sub(1,1) == '\\' then
            -- Windows
            debugpy_path = debugpy_path .. 'Scripts/python'
        else
            -- Unix
            debugpy_path = debugpy_path .. 'bin/python3'
        end
        dap_python.setup(debugpy_path)

        dapui.setup()
        dap_virtual_text.setup({
            commented = true,
        })
        mason.setup({
            ensure_installed = { 'python' }
        })

        vim.fn.sign_define('DapBreakpoint', {
            text = '',
            texthl = 'DiagnosticSignError',
            linehl = '',
            numhl = '',
        })

        vim.fn.sign_define('DapStopped', {
            text = '󰁕',
            texthl = 'String',
            linehl = '',
            numhl = '',
        })

        -- -- Eval var under cursor
        -- vim.keymap.set("n", "<leader>?", function()
        --     require("dapui").eval(nil, { enter = true })
        -- end)

        vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)

        vim.keymap.set('n', '<leader>dc', dap.continue)
        vim.keymap.set('n', '<leader>di', dap.step_into)
        vim.keymap.set('n', '<leader>do', dap.step_over)
        vim.keymap.set('n', '<leader>dso', dap.step_out)
        vim.keymap.set('n', '<leader>dsb', dap.step_back)
        vim.keymap.set('n', '<leader>dr', dap.restart)
        vim.keymap.set('n', '<leader>dq', dap.terminate)

        vim.keymap.set('n', '<leader>du', dapui.toggle)

        dap.listeners.before.attach.dapui_config = function ()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function ()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function ()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function ()
            dapui.close()
        end
    end,
}
