return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
		dependencies = {
			{ "williamboman/mason-lspconfig.nvim", event = { "BufReadPre", "BufNewFile" } },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "zapling/mason-lock.nvim", cmd = { "MasonLock", "MasonLockRestore" }, opts = {} },
		},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"nvimtools/none-ls.nvim", -- configure formatters & linters
		event = { "BufRead", "FileType" },
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
		},
		config = function()
			require("configs.none-ls")
		end,
	},
}
