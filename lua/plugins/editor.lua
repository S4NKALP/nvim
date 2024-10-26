return {
    {
        'lambdalisue/suda.vim',
        cmd = { 'SudaRead', 'SudaWrite' },
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        cmd = { 'Neotree' },
        opts = {
            filesystem = {
                filtered_items = {
                    visible = true,
                    show_hidden_count = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                    hide_by_name = {
                        '.git',
                        '.DS_Store',
                        'thumbs.db',
                        '.venv',
                    },
                    never_show = {},
                },
            },
            window = {
                position = 'right',
                width = 35,
            },
        },
    },
    {
        'folke/flash.nvim',
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
                mode = { 'n', 'x', 'o' },
                function()
                    require('flash').treesitter()
                end,
                desc = 'Flash Treesitter',
            },
        },
        config = function()
            require('plugins.configs.jump')
        end,
    },
    {
        'folke/trouble.nvim',
        lazy = true,
        cmd = { 'Trouble', 'TroubleToggle', 'TroubleRefresh' },
        opts = {
            modes = {
                lsp = {
                    win = { position = 'right' },
                },
            },
        },
    },
    {
        'nvim-telescope/telescope.nvim',
        cmd = 'Telescope',
        version = false,
        lazy = true,
        dependencies = {
            { 'nvim-tree/nvim-web-devicons' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'zig' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'nvim-telescope/telescope-symbols.nvim' },
            { 'nvim-telescope/telescope-file-browser.nvim' },
            { 'debugloop/telescope-undo.nvim' },
        },
        config = function()
            require('plugins.configs.telescope')
        end,
    },
    {
        'smjonas/inc-rename.nvim',
        cmd = 'IncRename',
        config = true,
    },
    {

        'akinsho/toggleterm.nvim',
        cmd = { 'ToggleTerm' },
        version = 'v2.*',
        config = function()
            require('plugins.configs.toggleterm')
        end,
    },
    {
        '2kabhishek/termim.nvim',
        cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Vterm', 'VTerm' },
    },
    {
        'nvimdev/lspsaga.nvim',
        lazy = true,
        event = 'LspAttach',
        config = function()
            local icons = require('lib.icons')
            require('lspsaga').setup({
                ui = {
                    theme = 'round',
                    border = 'rounded',
                    devicon = true,
                    title = true,
                    winblend = 1,
                    expand = icons.ui.ArrowOpen,
                    collapse = icons.ui.ArrowClosed,
                    preview = icons.ui.List,
                    code_action = icons.diagnostics.Hint,
                    diagnostic = icons.ui.Bug,
                    incoming = icons.ui.Incoming,
                    outgoing = icons.ui.Outgoing,
                    hover = icons.ui.Comment,
                },
                lightbulb = {
                    enable = false,
                    enable_in_insert = true,
                    sign = true,
                    sign_priority = 40,
                    virtual_text = true,
                },
                symbol_in_winbar = {
                    enable = false,
                    separator = '  ',
                    hide_keyword = true,
                    show_file = true,
                    folder_level = 0,
                },
            })
        end,
    },
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
}
