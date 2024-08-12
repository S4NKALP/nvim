return {
    {
        'williamboman/mason.nvim',

        config = function()
            require('mason').setup()
        end,
    },

    {
        'neovim/nvim-lspconfig',

        config = function()
            local lspconfig = require('lspconfig')
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
             lspconfig.biome.setup({
                capabilities = capabilities,
                handlers = handlers,
            })
        end,
    },
}
