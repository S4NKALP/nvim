return {
    {
        'rcarriga/nvim-notify',
        event = 'VeryLazy',
        keys = {
            {
                '<leader>mn',
                function()
                    require('notify').dismiss({ silent = true, pending = true })
                end,
                desc = 'Dismiss All Notifications',
            },
        },
        opts = {
            level = 2,
            minimum_width = 50,
            stages = 'fade',
            timeout = 3000,
            top_down = true,
            render = 'compact',
            background_colour = '#000000',
        },
    },
    {
        'folke/noice.nvim',
        event = 'UIEnter',
        dependencies = {
            { 'MunifTanjim/nui.nvim', lazy = true },
            'rcarriga/nvim-notify',
        },
        opts = {
            cmdline = {
                view = 'cmdline',
                format = {
                    cmdline = { icon = '▍' },
                    substitute = {
                        pattern = '^:%%?s/',
                        icon = ' ',
                        ft = 'regex',
                        opts = { border = { text = { top = ' sub (old/new/) ' } } },
                    },
                    input = { view = 'cmdline_input', icon = '█' },
                },
            },
            routes = {
                {
                    view = 'notify',
                    filter = { event = 'msg_showmode' },
                },
                {
                    filter = {
                        event = 'msg_show',
                        kind = '',
                        find = 'written',
                    },
                    opts = { skip = true },
                },
            },
            lsp = {
                progress = {
                    enabled = false,
                    -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
                    -- See the section on formatting for more details on how to customize.
                    format = 'lsp_progress',
                    format_done = 'lsp_progress_done',
                    throttle = 1000 / 30, -- frequency to update lsp progress message
                    view = 'mini',
                },
                override = {
                    -- override the default lsp markdown formatter with Noice
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    -- override the lsp markdown formatter with Noice
                    ['vim.lsp.util.stylize_markdown'] = true,
                    -- override cmp documentation with Noice (needs the other options to work)
                    ['cmp.entry.get_documentation'] = true,
                },
                hover = {
                    enabled = true,
                    silent = false, -- set to true to not show a message if hover is not available
                    view = nil, -- when nil, use defaults from documentation
                    opts = {}, -- merged with defaults from documentation
                },
                signature = {
                    enabled = false,
                    auto_open = {
                        enabled = true,
                        trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
                        luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
                        throttle = 50, -- Debounce lsp signature help request by 50ms
                    },
                    view = nil, -- when nil, use defaults from documentation
                    opts = {}, -- merged with defaults from documentation
                },
                message = {
                    -- Messages shown by lsp servers
                    enabled = true,
                    view = 'notify',
                    opts = {},
                },
                -- defaults for hover and signature help
                documentation = {
                    view = 'hover',
                    opts = {
                        lang = 'markdown',
                        replace = true,
                        render = 'plain',
                        format = { '{message}' },
                        win_options = { concealcursor = 'n', conceallevel = 3 },
                    },
                },
            },
            presets = {
                bottom_search = true, -- use a classic bottom cmdline for search
                command_palette = false, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true, -- add a border to hover docs and signature help
            },
        },
    },
    {
        'stevearc/dressing.nvim',
        event = 'VeryLazy',
    },
    {
        'akinsho/bufferline.nvim',
        event = 'UIEnter',
        version = '*',
        config = function()
            require('bufferline').setup({
                options = {
                    close_command = function()
                        require('bufdelete').bufdelete(0, true)
                    end,
                    right_mouse_command = function()
                        require('bufdelete').bugdelete(0, false)
                    end,
                    diagnostics = 'nvim_lsp',
                    always_show_bufferline = true,
                    buffer_close_icon = '',
                    modified_icon = '',
                    close_icon = '',
                    left_trunc_marker = '',
                    right_trunc_marker = '',
                    offsets = {
                        {
                            filetype = 'neo-tree',
                            text = 'Neo-tree',
                            highlight = 'Directory',
                            text_align = 'left',
                        },
                    },
                },
            })
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('configs.lualine')
        end,
    },
    {
        'nvim-tree/nvim-web-devicons',
        config = true,
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        event = { 'BufReadPost', 'BufNewFile' },
        opts = {
            exclude = {
                filetypes = { 'help', 'alpha', 'dashboard', 'neo-tree', 'Trouble', 'lazy' },
            },
        },
    },

    {
        'utilyre/barbecue.nvim',
        name = 'barbecue',
        version = '*',
        event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
        dependencies = {
            'SmiteshP/nvim-navic',
        },
        opts = {},
        keys = {
            {
                '<leader>bq',
                function()
                    require('barbecue.ui').toggle()
                end,
                desc = 'toggle barbecue',
            },
        },
        config = function()
            require('barbecue').setup({
                create_autocmd = false, -- prevent barbecue from updating itself automatically
            })

            vim.api.nvim_create_autocmd({
                'WinScrolled', -- or WinResized on NVIM-v0.9 and higher
                'BufWinEnter',
                'CursorHold',
                'InsertLeave',
            }, {
                group = vim.api.nvim_create_augroup('barbecue.updater', {}),
                callback = function()
                    require('barbecue.ui').update()
                end,
            })
        end,
    },
    {
        'goolord/alpha-nvim',
        event = 'VimEnter',
        config = function()
            require('configs.alpha')
        end,
    },
}
