return {
	"stevearc/conform.nvim",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				cpp = { "clang-format" },
				c = { "clang-format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier", "biome" },
				typescriptreact = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				markdown = { "markdownlint", "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				php = { "php-cs-fixer" },
				java = { "google-java-formatter", "trivy" },
				graphql = { "prettier" },
			},
			format_on_save = function(bufnr)
				-- Disable with a global or buffer-local variable
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				}
			end,
		})

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" })

		vim.keymap.set({ "n" }, "<leader>cfb", function()
			vim.b.disable_autoformat = not vim.b.disable_autoformat
			vim.notify(
				"Buffer auto-format on-save: " .. (vim.b.disable_autoformat and "OFF" or "ON"),
				vim.log.levels.INFO
			)
		end, { desc = "Toggle auto-format on-save for buffer." })

		vim.keymap.set({ "n" }, "<leader>ftg", function()
			vim.g.disable_autoformat = not vim.g.disable_autoformat
			vim.notify(
				"Global auto-format on-save: " .. (vim.g.disable_autoformat and "OFF" or "ON"),
				vim.log.levels.INFO
			)
		end, { desc = "Toggle auto-format on-save globally." })
	end,
}
