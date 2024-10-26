--Coding related

return {

    {
        'max397574/better-escape.nvim',
        event = 'InsertEnter',
        opts = {
            k = function()
                vim.api.nvim_input('<esc>')
                local current_line = vim.api.nvim_get_current_line()
                if current_line:match('^%s+j$') then
                    vim.schedule(function()
                        vim.api.nvim_set_current_line('')
                    end)
                end
            end,
        },
    },
    {
        'mg979/vim-visual-multi',
        event = 'BufReadPre',
        config = function()
            vim.g.VM_default_mappings = 0
            vim.g.VM_silent_exit = 1
            vim.g.VM_set_statusline = 0
            vim.g.VM_maps = {
                ['Find Under'] = '',
            }

            vim.g.VM_maps['I BS'] = ''
            vim.g.VM_maps['I CtrlC'] = ''
            vim.g.VM_maps['I CtrlN'] = ''
        end,
    },
    {
        'michaelb/sniprun',
        build = 'bash ./install.sh',
        cmd = 'SnipRun',
        config = function()
            local sniprun = require('sniprun')
            sniprun.setup({
                display = { 'VirtualTextOk', 'VirtualTextErr' },
                show_no_output = { 'Classic', 'TempFloatingWindow' },
                display_options = {
                    terminal_width = 45,
                    notification_timeout = 5,
                },

                inline_messages = 0,
                borders = 'single',
            })
        end,
    },
    {
        'L3MON4D3/LuaSnip',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = {
            'rafamadriz/friendly-snippets',
            'mstuttgart/odoo-snippets',
        },
        opts = {
            history = true,
            updateevents = 'TextChanged,TextChangedI',
        },
        keys = function()
            return {}
        end,
        config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
        end,
    },
    {
        'altermo/ultimate-autopair.nvim',
        event = { 'InsertEnter', 'CmdlineEnter' },
        branch = 'v0.6', --recommended as each new version will have breaking changes
        opts = {},
    },
    {
        'hrsh7th/nvim-cmp',
        event = { 'InsertEnter', 'CmdlineEnter' },
        dependencies = {
            'hrsh7th/cmp-buffer', -- source for text in buffer
            'hrsh7th/cmp-path', -- source for file system paths
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'saadparwaiz1/cmp_luasnip', --for autocomplete
            'hrsh7th/cmp-nvim-lsp-signature-help',
            'onsails/lspkind.nvim', -- vs-code like pictograms
            'L3MON4D3/LuaSnip', -- snippets
            'rafamadriz/friendly-snippets', -- useful snippets
        },
        config = function()
            require('plugins.configs.cmp')
        end,
    },
    {
        'Exafunction/codeium.vim',
        event = 'InsertEnter',
        config = function()
            local cmp = require('cmp')
            cmp.event:on('menu_opened', function()
                vim.g.codeium_manual = true
                vim.fn['codeium#Clear']()
            end)
            cmp.event:on('menu_closed', function()
                vim.g.codeium_manual = false
                vim.fn['codeium#Complete']()
            end)

            vim.g.codeium_filetypes = {
                TelescopePrompt = false,
                DressingInput = false,
                ['neo-tree-popup'] = false,
                ['dap-repl'] = false,
            }

            local opts = { expr = true, silent = true }
            vim.g.codeium_disable_bindings = 1

            vim.keymap.set('i', '<M-CR>', function()
                return vim.fn['codeium#Accept']()
            end, opts)

            -- vim.keymap.set('n', '<leader>ch', function()
            --     return vim.fn['codeium#Chat']()
            -- end, { desc = 'Chat with IA (Codeium)' })

            vim.keymap.set('i', '<M-]>', function()
                return vim.fn['codeium#CycleCompletions'](1)
            end, opts)

            vim.keymap.set('i', '<M-[>', function()
                return vim.fn['codeium#CycleCompletions'](-1)
            end, opts)

            vim.keymap.set('i', '<M-c>', function()
                return vim.fn['codeium#Clear']()
            end, opts)

            vim.keymap.set('n', '<leader>cI', '<cmd>CodeiumToggle<cr>', { desc = 'Toggle IA (Codeium)' })
        end,
    },
    { -- Alternate
        'ton/vim-alternate',
        lazy = true,
        ft = { 'cpp', 'h', 'hpp', 'c' },
    },
    {
        'nacro90/numb.nvim',
        event = 'CmdlineEnter',
        config = function()
            require('numb').setup({
                show_numbers = true, -- Enable 'number' for the window while peeking
                show_cursorline = true, -- Enable 'cursorline' for the window while peeking
                hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
                number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
                centered_peeking = true, -- Peeked line will be centered relative to window
            })
        end,
    },
    {
        'NStefan002/screenkey.nvim',
        cmd = 'Screenkey',
        version = '*',
        config = function()
            require('screenkey').setup({
                win_opts = {
                    relative = 'editor',
                    anchor = 'SE',
                    width = 40,
                    height = 1,
                    border = 'single',
                },
                compress_after = 3,
                clear_after = 3,
                disable = {
                    filetypes = {}, -- for example: "toggleterm"
                    buftypes = {}, -- for example: "terminal"
                },
            })
        end,
    },
    {
        'gbprod/yanky.nvim',
        event = 'BufReadPost',
        opts = {
            highlight = {
                timer = 150,
            },
        },
    },
    {
        'LudoPinelli/comment-box.nvim',
        event = 'BufReadPre',
        opts = {
            box_width = 70,
        },
    },
    {
        'm-demare/hlargs.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'numToStr/Navigator.nvim',
        config = function()
            require('Navigator').setup()
        end,
    },
}
