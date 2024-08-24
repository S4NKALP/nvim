local mason_null_ls = require("mason-null-ls")

local null_ls = require("null-ls")

local null_ls_utils = require("null-ls.utils")

mason_null_ls.setup({
	ensure_installed = {
		"prettier", -- prettier formatter
		"biome", -- js formatter
		"clang-format", -- c/c++ formatter
		"stylua", -- lua formatter
		"black", -- python formatter
		"pylint", -- python linter
		"google-java-format", -- java formatter
		-- "eslint_d", -- js linter
	},
})

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters

-- to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- configure null_ls
null_ls.setup({
	root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
	sources = {
		formatting.prettier, -- js/ts formatter
		formatting.stylua, -- lua formatter
		formatting.isort,
		formatting.black,
		formatting.clang_format,
		formatting.google_java_format,
		diagnostics.pylint,
		-- diagnostics.eslint_d.with({ -- js/ts linter
		--   condition = function(utils)
		--     return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
		--   end,
		-- }),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
					})
				end,
			})
		end
	end,
})
