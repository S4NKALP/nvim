return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            { 'antosha417/nvim-lsp-file-operations', config = true },
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            require('configs.lsp')
        end,
    },
    {
        'williamboman/mason.nvim',
        cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
        config = function()
            -- import mason
            local mason = require('mason')

            -- enable mason and configure icons
            mason.setup({
                ui = {
                    icons = {
                        package_installed = '✓',
                        package_pending = '➜',
                        package_uninstalled = '✗',
                    },
                },
            })
        end,
    },
    -- {
    -- 	"nvimtools/none-ls.nvim", -- configure formatters & linters
    -- 	event = { "BufRead", "FileType" },
    -- 	dependencies = {
    -- 		"jay-babu/mason-null-ls.nvim",
    -- 	},
    -- 	config = function()
    -- 		require("configs.none-ls")
    -- 	end,
    -- },
}
