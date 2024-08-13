return {
	"kylechui/nvim-surround",
    event = { 'BufReadPre', 'BufNewFile' },
	config = function()
		require("nvim-surround").setup()
	end,
}
