local lspconfig = require("lspconfig")
-- import cmp-nvim-lsp plugin
local cmp_nvim_lsp = require("cmp_nvim_lsp")
-- import mason_lspconfig plugin
local mason_lspconfig = require("mason-lspconfig")
local keymap = vim.keymap -- for conciseness

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf, silent = true }

		-- set keybinds
		opts.desc = "Show LSP references"
		keymap.set("n", "lR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

		opts.desc = "Go to declaration"
		keymap.set("n", "lD", vim.lsp.buf.declaration, opts) -- go to declaration

		opts.desc = "Inlay hint"
		keymap.set(
			"n",
			"<leader>lh",
			"<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
			opts
		)

		opts.desc = "Show LSP definitions"
		keymap.set("n", "ld", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

		opts.desc = "Show LSP implementations"
		keymap.set("n", "li", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

		opts.desc = "Show LSP type definitions"
		keymap.set("n", "lt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

		opts.desc = "Smart rename"
		keymap.set("n", "<leader>mR", vim.lsp.buf.rename, opts) -- smart rename

		opts.desc = "Show buffer diagnostics"
		keymap.set("n", "<leader>lD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts) -- show diagnostics for line

		opts.desc = "Show documentation for what is under cursor"
		keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

		opts.desc = "Restart LSP"
		keymap.set("n", "<leader>ls", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
	end,
})

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

mason_lspconfig.setup_handlers({
	-- default handler for installed servers
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = capabilities,
		})
	end,

	["lua_ls"] = function()
		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					hint = { enable = true },
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
	end,
	["basedpyright"] = function()
		-- configure pyright server (with special settings)
		lspconfig["basedpyright"].setup({
			capabilities = capabilities,
			settings = {
				python = {
					hint = { enable = true },
				},
			},
			handlers = {
				["textDocument/publishDiagnostics"] = function() end,
			},
		})
	end,
})
