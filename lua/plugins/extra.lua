return {
    {
        'ggandor/leap.nvim',
        -- event = { "BufAdd", "BufNewFile", "BufRead" },
        config = function()
            require('leap').add_default_mappings()
        end,
    },
    {
        'ThePrimeagen/refactoring.nvim',
        config = function()
            require('refactoring').setup({
                prompt_func_return_type = {
                    go = false,
                    java = false,
                    cpp = false,
                    c = false,
                    h = false,
                    hpp = false,
                    cxx = false,
                },
                prompt_func_param_type = {
                    go = false,
                    java = false,

                    cpp = false,
                    c = false,
                    h = false,
                    hpp = false,
                    cxx = false,
                },
                printf_statements = {},
                print_var_statements = {},
            })
        end,
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
        config = function()
            require('plugins.configs.whichkey')
        end,
    },
    {
        'zapling/mason-lock.nvim',
        cmd = { 'MasonLock', 'MasonLockRestore' },
        config = function()
            require('mason-lock').setup({
                lockfile_path = vim.fn.stdpath('config') .. '/lua/mason-lock.json', -- (default)
            })
        end,
    },
    {
        'uga-rosa/ccc.nvim',
        cmd = { 'CccHighlighterToggle', 'CccConvert', 'CccPick' },
        config = function()
            vim.opt.termguicolors = true

            local ccc = require('ccc')

            ccc.setup({
                highlighter = {
                    auto_enable = true,
                    lsp = true,
                },
            })
        end,
    },
    {
        '2kabhishek/nerdy.nvim',
        dependencies = { 'stevearc/dressing.nvim' },
        cmd = 'Nerdy',
    },
    {
        'folke/persistence.nvim',
        event = 'BufReadPre',
        opts = { options = vim.opt.sessionoptions:get() },
    },
    {
        'nvim-lua/plenary.nvim',
        lazy = true,
    },
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && yarn install',
        ft = { 'markdown' },
    },
    {
        'nvim-pack/nvim-spectre',
        cmd = 'Spectre',
        config = function()
            require('plugins.configs.spectre')
        end,
    },
    {
        'folke/zen-mode.nvim',
        dependencies = {
            'folke/twilight.nvim',
        },
        config = function()
            require('plugins.configs.zen&twilight')
        end,
        cmd = { 'ZenMode', 'Twilight' },
    },
    {
        'creativenull/dotfyle-metadata.nvim',
        cmd = { 'DotfyleGenerate', 'DotfyleOpen' },
    },
    {
        'willothy/flatten.nvim',
        priority = 1001,
        opts = {
            window = {
                open = 'alternate',
            },
        },
    },
    {
        'wakatime/vim-wakatime',
        event = { 'VimEnter' },
        lazy = false,
    },
    { -- Codesnap
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
    {
        'm4xshen/hardtime.nvim',
        config = function()
            require('hardtime').setup({ enabled = true })
        end,
        cmd = 'Hardtime',
    },
}
