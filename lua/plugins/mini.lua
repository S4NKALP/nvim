return {
	{
		"echasnovski/mini.nvim",
		event = { "BufReadPost", "BufAdd", "BufNewFile" },
		version = false,
		config = function()
			require("mini.comment").setup({})
			require("mini.ai").setup({})
			require("mini.cursorword").setup()
			require("mini.bracketed").setup({
				file = { suffix = "" },
				window = { suffix = "" },
				quickfix = { suffix = "" },
				yank = { suffix = "" },
				treesitter = { suffix = "n" },
			})
			require("mini.surround").setup({
				mappings = {
					add = "gsa", -- Add surrounding in Normal and Visual modes
					delete = "gsd", -- Delete surrounding
					replace = "gsr", -- Replace surrounding
					find = "gsf", -- Find surrounding (to the right)
					find_left = "gsF", -- Find surrounding (to the left)
					highlight = "gsh", -- Highlight surrounding
					update_n_lines = "gsn", -- Update `n_lines`
				},
				keys = {
					{ "gz", "", desc = "+surround" },
				},
			})
			require("mini.pairs").setup({
				-- odes = { command = true },
				-- mappings = {
				--     ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
				--     ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
				-- },
			})
			require("mini.move").setup({
				keys = {
					{ "<M-Left>", mode = { "n", "v" } },
					{ "<M-Down>", mode = { "n", "v" } },
					{ "<M-Up>", mode = { "n", "v" } },
					{ "<M-Right>", mode = { "n", "v" } },
				},

				mappings = {
					left = "<M-Left>",
					line_left = "<M-Left>",
					right = "<M-Right>",
					line_right = "<M-Right>",
					down = "<M-Down>",
					line_down = "<M-Down>",
					up = "<M-Up>",
					line_up = "<M-Up>",
				},
			})
		end,
	},
	{
		"echasnovski/mini.files",
		version = false,
		keys = {
			{ "-", "<cmd>lua require('mini.files').open(vim.api.nvim_buf_get_name(0))<CR>", { silent = true } },
		},
	},
	{
		"echasnovski/mini.icons",
		opts = {},
		lazy = true,
		specs = {
			{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				-- needed since it will be false when loading and mini will fail
				package.loaded["nvim-web-devicons"] = {}
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
}
