return {
    'williamboman/mason.nvim',
    cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
        local mason = require('mason')
        local mason_lspconfig = require('mason-lspconfig')
        local mason_tool_installer = require('mason-tool-installer')

        -- enable mason and configure icons
        mason.setup({
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
            -- list of servers for mason to install
            ensure_installed = {
                'tsserver',
                'html',
                'cssls',
                'tailwindcss',
                'lua_ls',
                'pyright',
                'jdtls',
                'bashls',
                'jsonls',
                'clangd',
            },
        })

        mason_tool_installer.setup({
            ensure_installed = {
                'prettier', -- prettier formatter
                'biome', -- js formatter
                'stylua', -- lua formatter
                'black', -- python formatter
                'isort', -- python formatter
                'clang-format', -- c/c++ formatter
                'luacheck',
                'pylint',
                'eslint_d',
            },
        })
    end,
}
