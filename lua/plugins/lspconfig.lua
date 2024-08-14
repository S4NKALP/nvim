return {
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
