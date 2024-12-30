local function load_config(package)
    return function()
        require('plugins.' .. package)
    end
end

local plugins = {
    -- UI
    {
        'navarasu/onedark.nvim',
        config = load_config('ui.onedark'),
        lazy = false,
        priority = 1000,
    },
    {
        'folke/snacks.nvim',
        priority = 1000,
        lazy = false,
        config = load_config('ui.snacks'),
    },
    {
        'nvim-lualine/lualine.nvim',
        config = load_config('ui.lualine'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'stevearc/dressing.nvim',
        config = load_config('ui.dressing'),
        event = { 'BufReadPost', 'BufNewFile' },
    },

    -- Language
    {
        'mfussenegger/nvim-dap',
        dependencies = {
            'rcarriga/nvim-dap-ui',
        },
        config = load_config('lang.dap'),
        cmd = { 'DapUIToggle', 'DapToggleRepl', 'DapToggleBreakpoint' },
    },
    {
        'nvim-neotest/neotest',
        dependencies = {
            'nvim-neotest/nvim-nio',
            'olimorris/neotest-rspec',
            'nvim-neotest/neotest-jest',
            'nvim-neotest/neotest-python',
        },
        config = load_config('lang.neotest'),
        cmd = 'Neotest',
    },
    {
        'michaelb/sniprun',
        build = 'bash ./install.sh',
        config = load_config('lang.sniprun'),
        cmd = 'SnipRun',
    },
    {
        'ThePrimeagen/refactoring.nvim',
        config = load_config('lang.refactoring'),
    },
    {
        'windwp/nvim-autopairs',
        config = load_config('lang.autopairs'),
        event = 'InsertEnter',
    },
    {
        'echasnovski/mini.surround',
        version = '*',
        config = load_config('lang.surround'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'echasnovski/mini.ai',
        version = '*',
        config = load_config('lang.ai'),
        event = { 'BufReadPost', 'BufNewFile' },
    },

    -- Tresitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'RRethy/nvim-treesitter-endwise',
            'RRethy/nvim-treesitter-textsubjects',
            'windwp/nvim-ts-autotag',
        },
        config = load_config('lang.treesitter'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    -- LSP
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'saghen/blink.cmp',
        },
        config = load_config('lang.lspconfig'),
        event = { 'BufReadPre', 'BufNewFile' },
    },
    {
        'folke/lazydev.nvim',
        ft = 'lua',
    },
    {
        'nvimdev/lspsaga.nvim',
        config = load_config('lang.lspsaga'),
        event = 'LspAttach',
    },
    {
        'williamboman/mason.nvim',
        config = load_config('lang.mason'),
        cmd = 'Mason',
    },
    {
        'nvimtools/none-ls.nvim',
        dependencies = { 'neovim/nvim-lspconfig', 'jay-babu/mason-null-ls.nvim' },
        config = load_config('lang.null-ls'),
        event = { 'BufReadPost', 'BufNewFile' },
    },

    -- Completion
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets', 'giuxtaposition/blink-cmp-copilot' },
        version = '*',
        config = load_config('lang.blink'),
        opts_extend = { 'sources.default' },
        event = { 'InsertEnter' },
    },
    {
        'zbirenbaum/copilot.lua',
        dependencies = { 'giuxtaposition/blink-cmp-copilot' },
        config = load_config('lang.copilot'),
        event = 'InsertEnter',
    },
    {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {
            { 'zbirenbaum/copilot.lua' },
            { 'nvim-lua/plenary.nvim' },
        },
        branch = 'main',
        build = 'make tiktoken', -- Only on MacOS or Linux
        cmd = {
            'CopilotChat',
            'CopilotChatToggle',
            'CopilotChatDocs',
            'CopilotChatExplain',
            'CopilotChatFix',
            'CopilotChatFixDiagnostic',
            'CopilotChatCommit',
            'CopilotChatCommitStaged',
            'CopilotChatLoad',
            'CopilotChatOptimize',
            'CopilotChatReview',
            'CopilotChatSave',
            'CopilotChatTests',
        },
        config = load_config('lang.copilot-chat'),
    },
    {
        'Exafunction/codeium.vim',
        event = 'InsertEnter',
        config = function()
            vim.keymap.set('i', '<M-CR>', function()
                return vim.fn['codeium#Accept']()
            end, { expr = true, silent = true })
            vim.keymap.set('i', '<M-]>', function()
                return vim.fn['codeium#CycleCompletions'](1)
            end, { expr = true, silent = true })
            vim.keymap.set('i', '<M-[>', function()
                return vim.fn['codium#CycleCompletions'](-1)
            end, { expr = true, silent = true })
            vim.keymap.set('i', '<M-c>', function()
                return vim.fn['codeium#Clear']()
            end, { expr = true, silent = true })
            vim.keymap.set('n', '<leader>cI', '<cmd>CodeiumToggle<cr>', { desc = 'Toggle IA (Codeium)' })
        end,
    },

    -- Tools

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
        'LudoPinelli/comment-box.nvim',
        event = 'BufReadPre',
        opts = {
            box_width = 70,
        },
    },
    {
        'mistricky/codesnap.nvim',
        lazy = true,
        build = 'make',
        opts = {
            save_path = '~/Pictures/screenshots/code',
            has_breadcrumbs = false,
            show_workspace = false,
            bg_theme = 'default',
            watermark = 'S4NKALP',
            code_font_family = 'Iosevka NF',
            code_font_size = 12,
        },
        cmd = { 'CodeSnap', 'CodeSnapSave', 'CodeSnapHighlight', 'CodeSnapASCII' },
    },
    {
        'wakatime/vim-wakatime',
        event = { 'VimEnter' },
        lazy = false,
    },
    {
        'windwp/nvim-spectre',
        config = load_config('tools.spectre'),
        cmd = 'Spectre',
    },
    {
        'abecodes/tabout.nvim',
        config = load_config('tools.tabout'),
        event = 'InsertEnter',
    },
    {
        'folke/flash.nvim',
        config = load_config('tools.flash'),
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
    },
    {
        'numToStr/Navigator.nvim',
        config = load_config('tools.navigator'),
        event = function()
            if vim.fn.exists('$TMUX') == 1 then
                return 'VeryLazy'
            end
        end,
    },
    {
        'm4xshen/hardtime.nvim',
        dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
        config = function()
            require('hardtime').setup({ enabled = true })
        end,
        cmd = 'Hardtime',
    },
    {
        'chrisgrieser/nvim-spider',
        config = load_config('tools.spider'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'folke/which-key.nvim',
        config = load_config('tools.which-key'),
        event = 'VeryLazy',
    },
    {
        'iamcco/markdown-preview.nvim',
        build = function()
            vim.fn['mkdp#util#install']()
        end,
        ft = 'markdown',
        cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview' },
    },
    {
        'uga-rosa/ccc.nvim',
        config = load_config('tools.ccc'),
        cmd = { 'CccHighlighterToggle', 'CccConvert', 'CccPick' },
    },
    {
        '2kabhishek/termim.nvim',
        cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Vterm', 'VTerm' },
    },
    {

        'akinsho/toggleterm.nvim',
        cmd = { 'ToggleTerm' },
        version = 'v2.*',
        config = load_config('tools.toggleterm'),
    },
    {
        'cvigilv/esqueleto.nvim',
        event = 'VeryLazy',
        opts = {
            directories = {
                vim.fn.stdpath('config') .. '/templates',
            },
            patterns = {
                -- File
                'README',
                'LICENSE',
                -- Filetype
                'sh',
                'markdown',
                'python',
                'lua',
                'html',
                'vue',
            },
        },
    },
    {
        'creativenull/dotfyle-metadata.nvim',
        cmd = { 'DotfyleGenerate', 'DotfyleOpen' },
    },
    {
        'kndndrj/nvim-dbee',
        dependencies = {
            'MunifTanjim/nui.nvim',
        },
        build = function()
            --    "curl", "wget", "bitsadmin", "go"
            require('dbee').install('curl')
        end,
        config = load_config('tools.dbee'),
        cmd = 'DBToggle',
        enabled = false,
    },
    {
        'zapling/mason-lock.nvim',
        cmd = { 'MasonLock', 'MasonLockRestore' },
        config = function()
            require('mason-lock').setup({
                lockfile_path = vim.fn.stdpath('config') .. '/lua/plugins/mason-lock.json',
            })
        end,
    },
    {
        'epwalsh/pomo.nvim',
        cmd = { 'TimerStart', 'TimerStop', 'TimerRepeat' },
        dependencies = {
            'rcarriga/nvim-notify',
        },
        opts = {
            notifiers = {
                {
                    name = 'Default',
                    opts = {
                        sticky = false,
                    },
                },
            },
        },
    },
    {
        'nvchad/showkeys',
        cmd = 'ShowkeysToggle',
        opts = {
            timeout = 1,
            maxkeys = 8,
        },
    },
    {
        'ThePrimeagen/vim-be-good',
        cmd = 'VimBeGood',
    },
    { 'tweekmonster/django-plus.vim' },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
            'debugloop/telescope-undo.nvim',
            'nvim-telescope/telescope-file-browser.nvim',
        },
        config = load_config('tools.telescope'),
        cmd = 'Telescope',
    },
    {
        -- 'chentoast/marks.nvim',
        '2kabhishek/markit.nvim',
        config = load_config('tools.marks'),
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        '2kabhishek/nerdy.nvim',
        dependencies = { 'stevearc/dressing.nvim' },
        cmd = 'Nerdy',
    },

    -- Git
    {
        'ruifm/gitlinker.nvim',
        config = load_config('tools.gitlinker'),
        keys = '<leader>yg',
    },
    {
        'lewis6991/gitsigns.nvim',
        config = load_config('tools.gitsigns'),
        cmd = 'Gitsigns',
        event = { 'BufReadPost', 'BufNewFile' },
    },
    {
        'tpope/vim-fugitive',
        cmd = 'Git',
    },
}

local treesitter_parsers = {
    'bash',
    'css',
    'c',
    'dart',
    'elixir',
    'gitcommit',
    'go',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'markdown',
    'markdown_inline', -- markdown code blocks
    'python',
    'ruby',
    'rust',
    'scss',
    'typescript',
    'vim',
    'vimdoc',
    'yaml',
}

local null_ls_sources = {
    'shellcheck', -- bash lint
}

local lsp_servers = {
    'bashls',
    'jsonls',
    'lua_ls',
    'typos_lsp', -- check typos
    'vimls',
    'tailwindcss',
}

local util = require('lib.util')

if util.is_present('npm') then
    table.insert(lsp_servers, 'eslint')
    table.insert(lsp_servers, 'ts_ls')
end

if util.is_present('gem') then
    local ror_nvim = {
        'weizheheng/ror.nvim',
        branch = 'main',
        ft = 'ruby',
        config = load_config('lang.ror'),
        keys = {
            {
                '<leader>rc',
                mode = { 'n' },
                function()
                    vim.cmd('RorCommands')
                end,
                desc = 'Rails Commands',
            },
        },
    }
    local vim_rails = {
        'tpope/vim-rails',
        ft = 'ruby',
    }

    table.insert(lsp_servers, 'solargraph')
    -- table.insert(lsp_servers, 'ruby_lsp')
    table.insert(lsp_servers, 'rubocop')
    table.insert(plugins, ror_nvim)
    table.insert(plugins, vim_rails)
end

if util.is_present('go') then
    table.insert(lsp_servers, 'gopls')
end

if util.is_present('dart') then
    table.insert(lsp_servers, 'dartls')
end

if util.is_present('java') then
    table.insert(lsp_servers, 'jdtls')
end

if util.is_present('pip') then
    table.insert(lsp_servers, 'ruff')
    table.insert(lsp_servers, 'pyright')
end

if util.is_present('mix') then
    table.insert(lsp_servers, 'elixirls')
end

if util.is_present('cargo') then
    table.insert(lsp_servers, 'rust_analyzer')
end

return {
    plugins = plugins,
    lsp_servers = lsp_servers,
    null_ls_sources = null_ls_sources,
    ts_parsers = treesitter_parsers,
}
