return {
    {
        'williamboman/mason.nvim',
        cmd = 'Mason',
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
        config = function()
            require('mason').setup()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'clangd',
                    'pylsp',
                    'bashls',
                    'jsonls',
                    'vimls',
                    'jdtls',
                    'html',
                    'cssls',
                    'tailwindcss',
                    'tsserver',
                },
            })

            require('mason-tool-installer').setup({
                ensure_installed = {
                    'prettier',
                    'stylua',
                    'clang-format',
                    'black',
                    'gdformat',
                    'djhtml',
                },
            })
        end,
    },

    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPre', 'BufNewFile' },

        config = function()
            local lspconfig = require('lspconfig')
            local handlers = {
                ['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' }),
                ['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'rounded' }),
            }
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            lspconfig.lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                        },
                    },
                },
                capabilities = capabilities,
                handlers = handlers,
            })

            lspconfig.clangd.setup({
                capabilities = capabilities,
                handlers = handlers,
            })
            lspconfig.gdscript.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                capabilities = capabilities,
                handlers = handlers,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
                handlers = handlers,
            })
        end,
    },
}
