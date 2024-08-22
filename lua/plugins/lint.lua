return {
	"mfussenegger/nvim-lint",
	enabled = false,
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		linters_by_ft = {
			lua = { "selene" },
			cpp = { "cpplint" },
			c = { "cpplint" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			python = { "pylint" },
			markdown = { "markdownlint" },
			java = { "trivy" },
			php = { "phpcs" },
		},
	},
	config = function()
		local lint = require("lint")
		-- TODO create auto command ran after Buffer Wrote
		vim.keymap.set("n", "<leader>cl", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
