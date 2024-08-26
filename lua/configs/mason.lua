local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local mason_tool_installer = require('mason-tool-installer')

-- enable mason and configure icons
mason.setup({
    automatic_installation = true,
    ui = {
        border = 'rounded',
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        },
    },
})

mason_lspconfig.setup({
    automatic_installation = true,
    -- list of servers for mason to install
    ensure_installed = {
        'tsserver',
        'lua_ls',
        'basedpyright',
        'jdtls',
        'bashls',
        'clangd',
    },
})

mason_tool_installer.setup({
    run_on_start = true,
    ensure_installed = {
        'prettier', -- prettier formatter
        'stylua', -- lua formatter
        'black', -- python formatter
        'isort', -- python formatter
        'clang-format', -- c/c++ formatter
        'ruff', -- python linter
        'mypy', -- type checking
        'eslint_d', --js linter
        'shfmt', -- shell formatter
    },
})
