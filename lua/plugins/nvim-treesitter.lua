return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
    dependencies = {
        'windwp/nvim-ts-autotag',
    },
    event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "cpp", "html", "css", "javascript", "typescript", "json", "php", "gdscript", 'markdown', 'markdown_inline', 'bash','java' },
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
