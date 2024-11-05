return {
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            -- Creates a beautiful debugger UI
            'rcarriga/nvim-dap-ui',
            -- Required dependency for nvim-dap-ui
            'nvim-neotest/nvim-nio',
        },
        cmd = { 'DapUIToggle', 'DapToggleRepl', 'DapToggleBreakpoint' },
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
            -- local dap_utils = require 'user.plugins.configs.dap.utils'
            local BASH_DEBUG_ADAPTER_BIN = vim.fn.stdpath('data')
                .. '/mason/packages/bash-debug-adapter/bash-debug-adapter'
            local BASHDB_DIR = vim.fn.stdpath('data') .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir'

            dap.adapters.sh = {
                type = 'executable',
                command = BASH_DEBUG_ADAPTER_BIN,
            }
            dap.configurations.sh = {
                {
                    name = 'Launch Bash debugger',
                    type = 'sh',
                    request = 'launch',
                    program = '${file}',
                    cwd = '${fileDirname}',
                    pathBashdb = BASHDB_DIR .. '/bashdb',
                    pathBashdbLib = BASHDB_DIR,
                    pathBash = 'bash',
                    pathCat = 'cat',
                    pathMkfifo = 'mkfifo',
                    pathPkill = 'pkill',
                    env = {},
                    args = {},
                    -- showDebugOutput = true,
                    -- trace = true,
                },
            }

            vim.api.nvim_create_user_command('DapUIToggle', function()
                require('dapui').toggle()
            end, {})
        end,
    },
    {
        'mfussenegger/nvim-dap-python',
        ft = 'python',
        dependencies = {
            'mfussenegger/nvim-dap',
            'rcarriga/nvim-dap-ui',
            'nvim-neotest/nvim-nio',
        },
        config = function(_, _)
            local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
            require('dap-python').setup(path)
        end,
    },
}
