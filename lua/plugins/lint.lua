-- Define nvim-lint linters here
local linting_servers = {
    'eslint_d',
    'cspell',
    -- 'ruff',
    -- 'mypy',
    'trivy',
    'phpcs',
    'markdownlint',
    'pylint',
    -- 'shellcheck',
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
            javascript = { 'eslint_d' },
            typescript = { 'eslint_d' },
            javascriptreact = { 'eslint_d' },
            typescriptreact = { 'eslint_d' },
            python = { 'pylint' },
            markdown = { 'markdownlint' },
            java = { 'trivy' },
            php = { 'phpcs' },
            -- bash = { 'shellcheck' },
        }

        -- Run pylint in the venv
        -- https://gist.github.com/Norbiox/652befc91ca0f90014aec34eccee27b2
        lint.linters.pylint.cmd = 'python'
        lint.linters.pylint.args = {
            '-m',
            'pylint',
            '-f',
            'json',
            '--from-stdin',
            function()
                return vim.api.nvim_buf_get_name(0)
            end,
        }
        -- To allow other plugins to add linters to require('lint').linters_by_ft,
        -- instead set linters_by_ft like this:
        -- lint.linters_by_ft = lint.linters_by_ft or {}
        -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
        --
        -- However, note that this will enable a set of default linters,
        -- which will cause errors unless these tools are available:
        -- {
        --   clojure = { "clj-kondo" },
        --   dockerfile = { "hadolint" },
        --   inko = { "inko" },
        --   janet = { "janet" },
        --   json = { "jsonlint" },
        --   markdown = { "vale" },
        --   rst = { "vale" },
        --   ruby = { "ruby" },
        --   terraform = { "tflint" },
        --   text = { "vale" }
        -- }
        --
        -- You can disable the default linters by setting their filetypes to nil:
        -- lint.linters_by_ft['clojure'] = nil
        -- lint.linters_by_ft['dockerfile'] = nil
        -- lint.linters_by_ft['inko'] = nil
        -- lint.linters_by_ft['janet'] = nil
        -- lint.linters_by_ft['json'] = nil
        -- lint.linters_by_ft['markdown'] = nil
        -- lint.linters_by_ft['rst'] = nil
        -- lint.linters_by_ft['ruby'] = nil
        -- lint.linters_by_ft['terraform'] = nil
        -- lint.linters_by_ft['text'] = nil

        local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
        vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
            group = lint_augroup,
            callback = function()
                if not vim.g.disable_linting then
                    if not vim.b.disable_linting then
                        lint.try_lint()
                    end
                end
            end,
        })

        vim.keymap.set('n', '<leader>cl', function()
            vim.b.disable_linting = not (vim.b.disable_linting == true)
        end, { desc = 'Toggle linting for file' })
        vim.keymap.set('n', '<leader>cL', function()
            vim.g.disable_linting = not (vim.g.disable_linting == true)
        end, { desc = 'Toggle linting for all files' })
    end,
}
