local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local mason_tool_installer = require("mason-tool-installer")

-- enable mason and configure icons
mason.setup({
	automatic_installation = true,
	ui = {
		border = "rounded",
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

mason_lspconfig.setup({
	-- list of servers for mason to install
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"svelte",
		"lua_ls",
		"pyright",
		"jdtls",
		"bashls",
		"jsonls",
		"clangd",
		"emmet_ls",
		"prismals",
	},
})

mason_tool_installer.setup({
	ensure_installed = {
		"prettier", -- prettier formatter
		"biome", -- js formatter
		"stylua", -- lua formatter
		"black", -- python formatter
		"isort", -- python formatter
		"clang-format", -- c/c++ formatter
		"pylint",
		"eslint_d",
	},
})
