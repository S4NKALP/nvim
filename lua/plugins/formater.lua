-- Define conform.nvim formatting servers here
local formatting_servers = {
    'prettier',
    'isort',
    'clang-format',
    'black',
    'stylua',
    'shfmt',
    'php-cs-fixer',
    'google-java-formatter',
    'codespell',
}

return {
    'stevearc/conform.nvim',
    dependencies = { 'zapling/mason-conform.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'ConformInfo' },
    config = function()
        local conform = require('conform')
        require('mason-conform').setup({
            ensure_installed = formatting_servers,
            automatic_installation = true,
        })
        conform.setup({
            formatters_by_ft = {
                cpp = { 'clang-format' },
                c = { 'clang-format' },
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescriptreact = { 'prettier' },
                css = { 'prettier' },
                html = { 'prettier' },
                json = { 'prettier' },
                yaml = { 'prettier' },
                markdown = { 'prettier', 'markdownlint' },
                lua = { 'stylua' },
                python = { 'isort', 'black' },
                php = { 'php-cs-fixer' },
                java = { 'google-java-formatter' },
                graphql = { 'prettier' },
                liquid = { 'prettier' },
                bash = { 'shfmt' },
                sh = { 'shfmt' },
                ['*'] = { 'codespell' },
                ['_'] = { 'trim_whitespace' },
            },
            format_on_save = function(bufnr)
                -- Disable with a global or buffer-local variable
                if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                    return
                end
                return {
                    lsp_fallback = true,
                    async = false,
                    timeout_ms = 500,
                }
            end,
        })

        vim.keymap.set({ 'n', 'v' }, '<leader>cff', function()
            conform.format({
                lsp_fallback = true,
                async = true,
                timeout_ms = 1000,
            })
        end, { desc = 'Format file or range (in visual mode)' })

        vim.keymap.set({ 'n' }, '<leader>cfb', function()
            vim.b.disable_autoformat = not vim.b.disable_autoformat
            vim.notify(
                'Buffer auto-format on-save: ' .. (vim.b.disable_autoformat and 'OFF' or 'ON'),
                vim.log.levels.INFO
            )
        end, { desc = 'Toggle auto-format on-save for buffer.' })

        vim.keymap.set({ 'n' }, '<leader>cft', function()
            vim.g.disable_autoformat = not vim.g.disable_autoformat
            vim.notify(
                'Global auto-format on-save: ' .. (vim.g.disable_autoformat and 'OFF' or 'ON'),
                vim.log.levels.INFO
            )
        end, { desc = 'Toggle auto-format on-save globally.' })
    end,
}
