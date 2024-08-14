    return {
	"nvim-lualine/lualine.nvim",
	event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		require("lualine").setup()
	end,
}
