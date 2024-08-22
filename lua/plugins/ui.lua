return {
	{
		"rcarriga/nvim-notify",
		event = "VeryLazy",
		keys = {
			{
				"<leader>mn",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss All Notifications",
			},
		},
		opts = {
			level = 2,
			minimum_width = 50,
			stages = "fade",
			timeout = 3000,
			top_down = true,
			render = "compact",
			background_colour = "#000000",
		},
	},
	{
		"folke/noice.nvim",
		event = "UIEnter",
		dependencies = {
			{ "MunifTanjim/nui.nvim", lazy = true },
			"rcarriga/nvim-notify",
		},
		opts = {
			cmdline = {
				view = "cmdline",
				format = {
					cmdline = { icon = "▍" },
					substitute = {
						pattern = "^:%%?s/",
						icon = " ",
						ft = "regex",
						opts = { border = { text = { top = " sub (old/new/) " } } },
					},
					input = { view = "cmdline_input", icon = "█" },
				},
			},
			routes = {
				{
					view = "notify",
					filter = { event = "msg_showmode" },
				},
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
			},
			lsp = {
				progress = {
					enabled = false,
					-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
					-- See the section on formatting for more details on how to customize.
					format = "lsp_progress",
					format_done = "lsp_progress_done",
					throttle = 1000 / 30, -- frequency to update lsp progress message
					view = "mini",
				},
				override = {
					-- override the default lsp markdown formatter with Noice
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					-- override the lsp markdown formatter with Noice
					["vim.lsp.util.stylize_markdown"] = true,
					-- override cmp documentation with Noice (needs the other options to work)
					["cmp.entry.get_documentation"] = true,
				},
				hover = {
					enabled = true,
					silent = false, -- set to true to not show a message if hover is not available
					view = nil, -- when nil, use defaults from documentation
					opts = {}, -- merged with defaults from documentation
				},
				signature = {
					enabled = false,
					auto_open = {
						enabled = true,
						trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
						luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
						throttle = 50, -- Debounce lsp signature help request by 50ms
					},
					view = nil, -- when nil, use defaults from documentation
					opts = {}, -- merged with defaults from documentation
				},
				message = {
					-- Messages shown by lsp servers
					enabled = true,
					view = "notify",
					opts = {},
				},
				-- defaults for hover and signature help
				documentation = {
					view = "hover",
					opts = {
						lang = "markdown",
						replace = true,
						render = "plain",
						format = { "{message}" },
						win_options = { concealcursor = "n", conceallevel = 3 },
					},
				},
			},
			presets = {
				bottom_search = true, -- use a classic bottom cmdline for search
				command_palette = false, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
		},
	},
	{
		"stevearc/dressing.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local dressing = require("dressing")

			dressing.setup({
				win_options = {
					winblend = 10,
					winhighlight = "Normal:DressingInputNormalFloat,NormalFloat:DressingInputNormalFloat,FloatBorder:DressingInputFloatBorder",
				},
				input = {
					enabled = true,
					default_prompt = "Input:",
					prompt_align = "left",
					insert_only = true,
					start_in_insert = true,
					border = "rounded",
					relative = "cursor",
					prefer_width = 40,
					width = nil,
					max_width = { 140, 0.9 },
					min_width = { 20, 0.2 },
					get_config = nil,
				},
				select = {
					enabled = true,
					backend = { "telescope", "fzf_lua", "fzf", "nui", "builtin" },
					trim_prompt = true,
				},
			})
		end,
	},
	{
		"nvim-lualine/lualine.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("configs.lualine")
		end,
	},
	-- {
	-- 	"nvim-tree/nvim-web-devicons",
	-- 	config = true,
	-- },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			exclude = {
				filetypes = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			},
		},
	},
	{
		"nvimdev/dashboard-nvim",
		cmd = "Dashboard",
		config = function()
			require("configs.dashboard")
		end,
		event = function()
			if vim.fn.argc() == 0 then
				return "VimEnter"
			end
		end,
	},
}
