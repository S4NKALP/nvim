return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "cpp", "html", "css", "javascript", "typescript", "json", "php" },
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
