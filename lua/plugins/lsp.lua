return {
    {
        'neovim/nvim-lspconfig',
        event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' },
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            { 'antosha417/nvim-lsp-file-operations', config = true },
        },
        config = function()
            require('configs.lsp')
        end,
    },
    {
        'williamboman/mason.nvim',
        cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
        dependencies = {
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',
        },
        config = function()
            require('mason').setup()
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
