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
                    format = 'lsp_progress',
                    format_done = 'lsp_progress_done',
                    throttle = 1000 / 30,
                    view = 'mini',
                },
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                    ['cmp.entry.get_documentation'] = true,
                },
                hover = {
                    enabled = true,
                    silent = false,
                    view = nil,
                    opts = {},
                },
                signature = {
                    enabled = false,
                    auto_open = {
                        enabled = true,
                        trigger = true,
                        luasnip = true,
                        throttle = 50,
                    },
                    view = nil,
                    opts = {},
                },
                message = {
                    enabled = true,
                    view = 'notify',
                    opts = {},
                },
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
                bottom_search = true,
                command_palette = false,
                long_message_to_split = true,
                inc_rename = false,
                lsp_doc_border = true,
            },
        },
    },
    {
        'stevearc/dressing.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            local dressing = require('dressing')

            dressing.setup({
                win_options = {
                    winblend = 10,
                    winhighlight = 'Normal:DressingInputNormalFloat,NormalFloat:DressingInputNormalFloat,FloatBorder:DressingInputFloatBorder',
                },
                input = {
                    enabled = true,
                    default_prompt = 'Input:',
                    prompt_align = 'left',
                    insert_only = true,
                    start_in_insert = true,
                    border = 'rounded',
                    relative = 'cursor',
                    prefer_width = 40,
                    width = nil,
                    max_width = { 140, 0.9 },
                    min_width = { 20, 0.2 },
                    get_config = nil,
                },
                select = {
                    enabled = true,
                    backend = { 'telescope', 'fzf_lua', 'fzf', 'nui', 'builtin' },
                    trim_prompt = true,
                },
            })
        end,
    },
    {},
    {
        'nvim-lualine/lualine.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('plugins.configs.lualine')
        end,
    },
    -- {
    -- 	"nvim-tree/nvim-web-devicons",
    -- 	config = true,
    -- },
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
        'nvimdev/dashboard-nvim',
        cmd = 'Dashboard',
        config = function()
            require('plugins.configs.dashboard')
        end,
        event = function()
            if vim.fn.argc() == 0 then
                return 'VimEnter'
            end
        end,
    },
}
