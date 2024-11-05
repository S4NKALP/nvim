-- Define conform.nvim formatting servers here
local formatting_servers = {
    'prettier',
    'isort',
    'uncrustify',
    'black',
    'stylua',
    'shfmt',
    'php-cs-fixer',
    'google-java-formatter',
    'codespell',
    'autoflake',
    'djlint',
}

return {
    'stevearc/conform.nvim',
    dependencies = { 'zapling/mason-conform.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'ConformInfo' },
    keys = {
        {
            '<leader>cfF',
            function()
                require('conform').format({ async = true, lsp_format = 'fallback' })
            end,
            mode = '',
            desc = 'Format Buffer',
        },
        {
            '<leader>cff',
            function()
                if vim.b.disable_autoformat then
                    vim.cmd('FormatEnable!')
                    vim.notify('Formatting enabled')
                else
                    vim.cmd('FormatDisable!')
                    vim.notify('Formatting disabled')
                end
            end,
            mode = '',
            desc = 'Toggle Format on save',
        },
    },
    config = function()
        local conform = require('conform')
        require('mason-conform').setup({
            ensure_installed = formatting_servers,
            automatic_installation = true,
        })
        conform.setup({
            notify_on_error = true,
            formatters_by_ft = {
                cpp = { 'uncrustify' },
                c = { 'uncrustify' },
                -- Conform can also run multiple formatters sequentially
                -- You can use a sub-list to tell conform to run *until* a formatter is found.
                javascript = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
                typescript = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
                javascriptreact = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
                typescriptreact = { 'eslint_d', 'prettierd', 'prettier', stop_after_first = true },
                css = { 'prettierd', 'prettier', stop_after_first = true },
                html = { 'prettierd', 'prettier', stop_after_first = true },
                json = { 'prettierd', 'prettier', stop_after_first = true },
                yaml = { 'prettierd', 'prettier', stop_after_first = true },
                markdown = { 'prettierd', 'prettier', stop_after_first = true },
                lua = { 'stylua' },
                python = { 'isort', 'black' },
                php = { 'php-cs-fixer' },
                htmldjango = { 'djlint' },
                java = { 'google-java-formatter' },
                graphql = { 'prettierd', 'prettier', stop_after_first = true },
                liquid = { 'prettierd', 'prettier', stop_after_first = true },
                bash = { 'beautysh' },
                sh = { 'beautysh' },
                -- yaml = {'yamlfix'},
                ['*'] = { 'codespell' },
                ['_'] = { 'trim_whitespace' },
            },
            formatters = {
                prettier = {
                    javascript = {
                        args = { '--single-quote' },
                    },
                },
                eslint_d = {
                    require_cwd = true,
                },
                yamlfix = {
                    env = {
                        YAMLFIX_SEQUENCE_STYLE = 'block_style',
                        YAMLFIX_preserve_quotes = 'true',
                    },
                },
            },
            -- support a global format disable
            format_on_save = function(bufnr)
                -- Disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                -- Disable "format_on_save lsp_fallback" for languages that don't
                -- have a well standardized coding style. You can add additional
                -- languages here or re-enable it for the disabled ones.
                local disable_filetypes = {
                    c = true,
                    cpp = true,
                    liquid = true,
                }
                local lsp_format_opt
                if disable_filetypes[vim.bo[bufnr].filetype] then
                    lsp_format_opt = 'never'
                else
                    lsp_format_opt = 'fallback'
                end
                return {
                    timeout_ms = 2000,
                    lsp_format = lsp_format_opt,
                }
            end,
        })

        -- From: https://github.com/stevearc/conform.nvim/blob/master/doc/recipes.md#command-to-toggle-format-on-save
        vim.api.nvim_create_user_command('FormatDisable', function(args)
            if args.bang then
                -- FormatDisable! will disable formatting just for this buffer
                vim.b.disable_autoformat = true
            else
                vim.g.disable_autoformat = true
            end
        end, {
            desc = 'Disable autoformat-on-save',
            bang = true,
        })
        vim.api.nvim_create_user_command('FormatEnable', function(args)
            if args.bang then
                vim.b.disable_autoformat = false
            else
                vim.g.disable_autoformat = false
            end
        end, {
            desc = 'Re-enable autoformat-on-save',
            bang = true,
        })
    end,
}
