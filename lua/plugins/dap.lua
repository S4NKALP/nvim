return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
        },
        cmd = { 'DapUIToggle', 'DapToggleRepl', 'DapToggleBreakpoint' },
        keys = {
            { '<leader>bO', '<cmd>DapStepOut<cr>', desc = 'Out' },
            { '<leader>bR', '<cmd>DapRestartFrame<cr>', desc = 'Restart Frame' },
            { '<leader>bb', '<cmd>DapToggleBreakpoint<cr>', desc = 'Breakpoint' },
            { '<leader>bc', '<cmd>DapContinue<cr>', desc = 'Continue' },
            { '<leader>bi', '<cmd>DapStepInto<cr>', desc = 'Into' },
            { '<leader>bl', "<cmd>lua require'dap'.run_last()<cr>", desc = 'Last' },
            { '<leader>bo', '<cmd>DapStepOver<cr>', desc = 'Over' },
            { '<leader>br', '<cmd>DapToggleRepl<cr>', desc = 'Repl' },
            { '<leader>bt', '<cmd>DapUIToggle<cr>', desc = 'Debugger' },
            { '<leader>bx', '<cmd>DapTerminate<cr>', desc = 'Exit' },
        },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')

            dapui.setup({
                icons = { expanded = ' ', collapsed = ' ' },
                mappings = {
                    expand = { '<CR>', '<2-LeftMouse>' },
                    open = 'o',
                    remove = 'd',
                    edit = 'e',
                    repl = 'r',
                    toggle = 't',
                },
                expand_lines = vim.fn.has('nvim-0.7'),
                layouts = {
                    {
                        elements = {
                            { id = 'scopes', size = 0.25 },
                            'breakpoints',
                            'stacks',
                            'watches',
                        },
                        size = 40,
                        position = 'right',
                    },
                    {
                        elements = {
                            'repl',
                            'console',
                        },
                        size = 0.25,
                        position = 'bottom',
                    },
                },
                floating = {
                    max_height = nil,
                    max_width = nil,
                    border = 'rounded',
                    mappings = {
                        close = { 'q', '<Esc>' },
                    },
                },
                windows = { indent = 1 },
                render = {
                    max_type_length = nil,
                },
            })

            vim.fn.sign_define(
                'DapBreakpoint',
                { text = ' ', texthl = 'DiagnosticSignError', linehl = '', numhl = '' }
            )

            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close()
            end

            dap.adapters.python = {
                type = 'executable',
                command = '/usr/bin/python',
                args = { '-m', 'debugpy.adapter' },
            }

            dap.configurations.python = {
                {
                    type = 'python',
                    request = 'launch',
                    name = 'Launch file',

                    program = '${file}',
                    pythonPath = function()
                        local cwd = vim.fn.getcwd()
                        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                            return cwd .. '/venv/bin/python'
                        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                            return cwd .. '/.venv/bin/python'
                        else
                            return '/usr/bin/python'
                        end
                    end,
                },
            }

            -- dap.adapters.ruby = {
            --     type = 'executable',
            --     command = 'bundle',
            --     args = { 'exec', 'readapt', 'stdio' },
            -- }

            -- dap.configurations.ruby = {
            --     {
            --         type = 'ruby',
            --         request = 'launch',
            --         name = 'Rails',
            --         program = 'bundle',
            --         programArgs = { 'exec', 'rails', 's' },
            --         useBundler = true,
            --     },
            -- }

            vim.api.nvim_create_user_command('DapUIToggle', function()
                require('dapui').toggle()
            end, {})
        end,
    },
}
