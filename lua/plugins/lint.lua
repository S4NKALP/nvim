-- Define nvim-lint linters here
local linting_servers = {
    'cpplint',
    'eslint_d',
    'cspell',
    'ruff',
    'mypy',
    'trivy',
    'phpcs',
    'markdownlint',
}

return {
    'mfussenegger/nvim-lint',
    dependencies = {
        'rshkarin/mason-nvim-lint',
    },
    event = { 'BufReadPre', 'BufNewFile' },

    config = function()
        local lint = require('lint')
        require('mason-nvim-lint').setup({
            ensure_installed = linting_servers,
            automatic_installation = true,
        })

        lint.linters_by_ft = {
            lua = { 'selene' },
            cpp = { 'cpplint' },
            c = { 'cpplint' },
            javascript = { 'eslint_d' },
            typescript = { 'eslint_d' },
            javascriptreact = { 'eslint_d' },
            typescriptreact = { 'eslint_d' },
            python = { 'ruff', 'mypy' },
            markdown = { 'markdownlint' },
            java = { 'trivy' },
            php = { 'phpcs' },
        }

        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set('n', '<leader>cl', function()
            lint.try_lint()
        end, { desc = 'Trigger linting for current file' })
    end,
}
