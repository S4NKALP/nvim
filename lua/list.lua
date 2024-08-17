return {
    -- Delete Buffer
    {
        'famiu/bufdelete.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        init = function()
            vim.keymap.set('n', '<leader>q', function()
                require('bufdelete').bufdelete(0, false)
            end, { silent = true, desc = 'Quit Buffer' })
        end,
    },
    -- Better Escape
    {
        'max397574/better-escape.nvim',
        config = function()
            require('better_escape').setup()
        end,
    },
    -- Comment
    {
        {
            'LudoPinelli/comment-box.nvim',
            opts = {},
            vscode = true,
            keys = {
                { '<leader>cb', '<cmd>CBccbox<CR>', mode = { 'n', 'v' }, desc = 'Comment Box' },
                { '<leader>ct', '<cmd>CBllline<CR>', mode = { 'n', 'v' }, desc = 'Tiled line' },
                { '<leader>cl', '<cmd>CBline<CR>', desc = 'Line' },
                { '<leader>cm', '<cmd>CBllbox14<CR>', mode = { 'n', 'v' }, desc = 'Marked' },
                { '<leader>cc', '<cmd>CBcatalog<CR>', desc = 'Catalog' },
                { '<leader>cd', '<cmd>CBd<CR>', mode = { 'n', 'v' }, desc = 'Delete Comment Style' },
            },
        },
    },
    -- Code Screnshot
    {
        'mistricky/codesnap.nvim',
        build = 'make',
        cmd = { 'CodeSnap', 'CodeSnapSave' },
        vscode = false,
        keys = {
            { '<leader>cp', mode = 'v', "<cmd>'<,'>CodeSnap<cr>", desc = 'Screenshot (Clipboard)' },
            { '<leader>cP', mode = 'v', "<cmd>'<,'>CodeSnapSave<cr>", desc = 'Screenshot (Save)' },
        },
        cond = vim.env.KITTY_SCROLLBACK_NVIM == nil,
        opts = {
            save_path = (os.getenv('HOME') .. '/Pictures/screenshots/'),
            title = 'CodeSnap.nvim',
            watermark = '',
            bg_theme = 'summer',
        },
    },
    -- Generate dotfyle metadata for your config
    {
        'creativenull/dotfyle-metadata.nvim',
        cmd = { 'DotfyleGenerate', 'DotfyleOpen' },
    },
    -- improve the default vim.ui interfaces
    {
        'stevearc/dressing.nvim',
        event = 'VeryLazy',
    },
    -- Show diagnostics and lsp info inside a custom window, following the mouse position
    {
        'soulis-1256/eagle.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        config = function()
            require('eagle').setup({})
        end,
    },
    -- Navigate your code with search labels, enhanced character motions and Treesitter integration
    {
        'folke/flash.nvim',
        event = { 'CursorHold', 'CursorHoldI' },
        vscode = true,
        opts = {},
        keys = {
            {
                's',
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').jump()
                end,
                desc = 'Flash',
            },
            {
                'S',
                mode = { 'n', 'o', 'x' },
                function()
                    require('flash').treesitter()
                end,
                desc = 'Flash Treesitter',
            },
            {
                'r',
                mode = 'o',
                function()
                    require('flash').remote()
                end,
                desc = 'Remote Flash',
            },
            {
                'R',
                mode = { 'o', 'x' },
                function()
                    require('flash').treesitter_search()
                end,
                desc = 'Treesitter Search',
            },
            {
                '<c-s>',
                mode = { 'c' },
                function()
                    require('flash').toggle()
                end,
                desc = 'Toggle Flash Search',
            },
        },
    },
    --open files in neovim without creating a nested sessions
    {
        'willothy/flatten.nvim',
        priority = 1001,
        opts = {
            window = {
                open = 'alternate',
            },
        },
    },
    -- highlight arguments
    {
        'm-demare/hlargs.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
    },
    -- emoji picker
    {
        'ziontee113/icon-picker.nvim',
        enabled = true,
        cmd = { 'IconPickerInsert' },
        vim.keymap.set('n', '<Leader>se', '<cmd>IconPickerInsert emoji<cr>'),
        config = function()
            require('icon-picker').setup({ disable_legacy_commands = true })
        end,
    },
    -- Incremental rename
    {
        'smjonas/inc-rename.nvim',
        cmd = 'IncRename',
        config = true,
    },
    -- automtically guess indent
    {
        'nmac427/guess-indent.nvim',
        event = 'FileType',
        config = function()
            require('guess-indent').setup({})
        end,
    },
    -- Faster LuaLS setup
    {
        'folke/lazydev.nvim',
        ft = 'lua', -- only load on lua files
        cmd = 'LazyDev',
        lazy = true,
        event = 'LspAttach',
        opts = {
            library = {},
        },
    },
    -- Snippets
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
    -- Markdown preview
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && yarn install',
        ft = { 'markdown' },
        keys = {
            {
                '<leader>mp',
                '<cmd>MarkdownPreviewToggle<CR>',
                desc = 'toggle markdown preview',
            },
        },
    },
    -- Colorscheme
    {
        'bluz71/vim-moonfly-colors',
        name = 'moonfly',
        lazy = false,
        priority = 1000,
        config = function()
            require('moonfly').custom_colors({
                bg = '#000000',
            })
            vim.cmd([[colorscheme moonfly]])
        end,
    },
    -- navigate between neovim and terminal
    {
        'numToStr/Navigator.nvim',
        keys = {
            { '<C-h>', '<cmd>NavigatorLeft<cr>' },
            { '<C-j>', '<cmd>NavigatorDown<cr>' },
            { '<C-k>', '<cmd>NavigatorUp<cr>' },
            { '<C-l>', '<cmd>NavigatorRight<cr>' },
            { '<C-\\>', '<cmd>NavigatorPrevious<cr>' },
        },
        config = function()
            require('Navigator').setup()
        end,
    },
    -- popup display that provides breadcrumbs like navigation features
    {
        'SmiteshP/nvim-navbuddy',
        dependencies = {
            'neovim/nvim-lspconfig',
            'SmiteshP/nvim-navic',
        },
        keys = {
            { '<leader>nv', '<cmd>Navbuddy<cr>', desc = 'Nav' },
        },
        config = function()
            local actions = require('nvim-navbuddy.actions')
            local navbuddy = require('nvim-navbuddy')
            navbuddy.setup({
                window = {
                    border = 'double',
                },
                mappings = {
                    ['k'] = actions.next_sibling,
                    ['i'] = actions.previous_sibling,
                    ['j'] = actions.parent,
                    ['l'] = actions.children,
                },
                lsp = { auto_attach = true },
            })
        end,
    },
    -- smooth scrolling
    {
        'karb94/neoscroll.nvim',
        event = 'UIEnter',
        config = function()
            require('neoscroll').setup({
                mappings = { -- Keys to be mapped to their corresponding default scrolling animation
                    '<C-u>',
                    '<C-d>',
                    '<C-b>',
                    '<C-f>',
                    '<C-y>',
                    '<C-e>',
                    'zt',
                    'zz',
                    'zb',
                },
                hide_cursor = true, -- Hide cursor while scrolling
                stop_eof = true, -- Stop at <EOF> when scrolling downwards
                respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
                cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
                easing = 'linear', -- Default easing function
                pre_hook = nil, -- Function to run before the scrolling animation starts
                post_hook = nil, -- Function to run after the scrolling animation ends
                performance_mode = false, -- Disable "Performance Mode" on all buffers.
            })
        end,
    },
    -- Notifications
    {
        'rcarriga/nvim-notify',
        event = 'VeryLazy',
        keys = {
            {
                '<leader>un',
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
    -- Ui components
    {
        'MunifTanjim/nui.nvim',
        lazy = true,
    },
    -- Peek lines just when you intend
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
        'nvim-lua/plenary.nvim',
        lazy = true,
    },
    -- Session Management
    {
        'folke/persistence.nvim',
        event = 'BufReadPre',
        opts = { options = vim.opt.sessionoptions:get() },
        keys = {
            {
                '<leader>ss',
                function()
                    require('persistence').load()
                end,
                desc = 'Restore Session',
            },
            {
                '<leader>sl',
                function()
                    require('persistence').load({ last = true })
                end,
                desc = 'Restore Last Session',
            },
            {
                '<leader>sd',
                function()
                    require('persistence').stop()
                end,
                desc = "Don't Save Current Session",
            },
        },
    },
    -- alternating syntax highlighting
    {
        'HiPhish/rainbow-delimiters.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            local rainbow_delimiters = require('rainbow-delimiters')
            require('rainbow-delimiters.setup').setup({
                {
                    strategy = {
                        [''] = rainbow_delimiters.strategy['global'],
                        vim = rainbow_delimiters.strategy['local'],
                    },
                    query = {
                        [''] = 'rainbow-delimiters',
                        lua = 'rainbow-blocks',
                    },
                    priority = {
                        [''] = 110,
                        lua = 210,
                    },
                    highlight = {
                        'RainbowDelimiterRed',
                        'RainbowDelimiterYellow',
                        'RainbowDelimiterBlue',
                        'RainbowDelimiterOrange',
                        'RainbowDelimiterGreen',
                        'RainbowDelimiterViolet',
                        'RainbowDelimiterCyan',
                    },
                },
            })
        end,
    },
    -- Enhance the usage of macros
    {
        'chrisgrieser/nvim-recorder',
        dependencies = { 'rcarriga/nvim-notify' },
        event = 'VeryLazy',
        vscode = true,
        keys = {
            { 'q', desc = 'Start Recording' },
            { 'Q', desc = 'Play Recording' },
            { '<C-q>', desc = 'Switch Slot' },
            { 'cq', desc = 'Edit Macro' },
            { 'yq', desc = 'Yank Macro' },
            { 'dq', desc = 'Delete All Macros' },
        },
        opts = {
            useNerdFontsIcons = false,
            slots = { 'a', 'b', 'c', 'd' },
            mapping = {
                startStopRecording = 'q',
                playMacro = 'Q',
                editMacro = 'cq',
                switchSlot = '<C-q>',
                deleteAllMacros = 'dq',
                yankMacro = 'yq',
            },
        },
    },
    -- Screencast the keys
    {
        'NStefan002/screenkey.nvim',
        cmd = 'Screenkey',
        version = '*',
        vim.keymap.set('n', '<leader>kt', '<cmd>Screenkey<CR>', { desc = 'Toggle keys' }),
        config = function()
            require('screenkey').setup({
                -- see :h nvim_open_win
                win_opts = {
                    relative = 'editor',
                    anchor = 'SE',
                    width = 40,
                    height = 1,
                    border = 'single',
                },
                -- compress input when repeated <compress_after> times
                compress_after = 3,
                -- clear the input after <clear_after> seconds of inactivity
                clear_after = 3,
                -- temporarily disable screenkey (for example when inside of the terminal)
                disable = {
                    filetypes = {}, -- for example: "toggleterm"
                    -- :h 'buftype'
                    buftypes = {}, -- for example: "terminal"
                },
            })
        end,
    },
    -- search panel
    {
        'nvim-pack/nvim-spectre',
        build = false,
        cmd = 'Spectre',
        opts = { open_cmd = 'noswapfile vnew' },
        keys = {
            {
                '<leader>sr',
                function()
                    require('spectre').open()
                end,
                desc = 'Replace in Files (Spectre)',
            },
        },
    },
    {
        'luukvbaal/statuscol.nvim',
        event = 'BufReadPre',
        config = function()
            local builtin = require('statuscol.builtin')
            require('statuscol').setup({
                setopt = true,
                separator = '',
                foldfunc = 'builtin',
                relculright = true,
                segments = {
                    { text = { '%s' }, click = 'v:lua.ScSa' },
                    {
                        text = { builtin.lnumfunc, ' ' },
                        click = 'v:lua.ScLa',
                    },
                },
            })
        end,
    },
    -- undo history visualizer
    {
        'mbbill/undotree',
        keys = {
            { '<leader>uu', '<cmd>UndotreeToggle<cr>', desc = 'Toggle Undotree' },
        },
    },
    -- maximizer & restore current window
    {
        'szw/vim-maximizer',

        keys = {
            { '<leader>sm', '<cmd>MaximizerToggle<CR>', desc = 'Maximize/minimize a split' },
        },
    },
    -- for programming activity
    {
        'wakatime/vim-wakatime',
        lazy = false,
    },
    -- show keymaps
    {
        'folke/which-key.nvim',
        event = 'UIEnter',
        opts = {
            preset = 'helix',
        },
        keys = {
            {
                '<leader>?',
                function()
                    require('which-key').show({ global = false })
                end,
                desc = 'Buffer Local Keymaps (which-key)',
            },
        },
    },
    -- Distraction-free coding
    {
        'folke/zen-mode.nvim',
        cmd = { 'ZenMode' },
        opts = {},
        keys = {
            { '<leader>zz', '<cmd>ZenMode<cr>', desc = 'Toggle zen mode' },
        },
    },
    -- Prismatic line decorations
    {
        'mvllow/modes.nvim',
        event = { 'BufReadPost', 'BufNewFile' },
        tag = 'v0.2.0',
        config = function()
            require('modes').setup({

                colors = {
                    visual = '#f5c359',
                    delete = '#c75c6a',
                    copy = '#78ccc5',
                    insert = '#c5739a',
                },
                line_opacity = 0.15,
                set_cursor = true,
                set_cursorline = true,
                set_number = true,
                ignore_filetypes = { 'NvimTree', 'TelescopePrompt' },
            })
        end,
    },
    -- Make editing big files faster
    {
        'LunarVim/bigfile.nvim',
        event = { 'BufEnter', 'WinEnter' },
        opts = {
            -- Disables LSP/treesitter, etc for files above 5000 lives (even if they have really long lines)
            pattern = function(bufnr, filesize_mib)
                if filesize_mib >= 2 then
                    return true
                end
                -- you can't use `nvim_buf_line_count` because this runs on BufReadPre
                local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
                local file_length = #file_contents
                if file_length > 5000 then
                    return true
                end

                return false
            end,
        },
    },
    -- url-opener
    {
        'sontungexpt/url-open',
        event = { 'BufEnter', 'WinEnter' },
        cmd = 'URLOpenUnderCursor',
        config = function()
            local status_ok, url_open = pcall(require, 'url-open')
            if not status_ok then
                return
            end
            url_open.setup({})
        end,
        vim.keymap.set('n', 'gx', '<esc>:URLOpenUnderCursor<cr>'),
    },
}
