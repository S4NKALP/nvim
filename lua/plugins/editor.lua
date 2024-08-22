return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "<leader>ee", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
			{ "<leader><tab>", ":Neotree toggle left<CR>", silent = true, desc = "  Left File Explorer" },
		},
		cmd = { "Neotree" },
		opts = {
			filesystem = {
				filtered_items = {
					visible = true,
					show_hidden_count = true,
					hide_dotfiles = false,
					hide_gitignored = true,
					hide_by_name = {
						".git",
						".DS_Store",
						"thumbs.db",
						".venv",
					},
					never_show = {},
				},
			},
			window = {
				position = "right",
				width = 35,
			},
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				char = {
					jump_labels = true,
				},
			},
		},
    -- stylua: ignore
         keys = {
          {
        '<leader>jN',
        "<cmd>lua require('flash').jump({search = { forward = false, wrap = false, multi_window = false },})<cr>", mode = { "n", "v" },
        desc = 'Search Backward',
    },
    { '<leader>jc', '*', desc = 'Word' },
    { '<leader>jd', '<cmd>FlashDiagnostics<cr>', mode = { "n", "v" }, desc = 'Diagnostics' },
    { '<leader>jf', '<cmd>Telescope jumplist<cr>', desc = 'Jumplist' },
    { '<leader>jh', '<C-o>', desc = 'Backward' },
    { '<leader>jj', "<cmd>lua require('flash').remote()<cr>", mode = { "n", "v" }, desc = 'Remote' },
    { '<leader>jk', "<cmd>lua require('flash').treesitter()<cr>", mode = { "n", "v" }, desc = 'Treesitter' },
    { '<leader>jl', '<C-i>', desc = 'Forward' },
    {
        '<leader>jn',
        "<cmd>lua require('flash').jump({search = { forward = true, wrap = false, multi_window = false },})<cr>", mode = { "n", "v" },
        desc = 'Search Forward',
    },
    { '<leader>jp', "<cmd>lua require('flash').jump({continue = true})<cr>", mode = { "n", "v" }, desc = 'Previous Jump' },
    { '<leader>js', "<cmd>lua require('flash').jump()<cr>", mode = { "n", "v" }, desc = 'Search' },
    { '<leader>jt', "<cmd>lua require('flash').treesitter_search()<cr>", mode = { "n", "v" }, desc = 'Remote Treesitter' },
    {
        '<leader>jw',
        '<cmd>lua require("flash").jump({ pattern = vim.fn.expand("<cword>")})<cr>', mode = { "n", "v" },
        desc = 'Current Word',
    },

         },
	},
	{
		"folke/trouble.nvim",
		lazy = true,
		cmd = { "Trouble", "TroubleToggle", "TroubleRefresh" },
		opts = {
			modes = {
				lsp = {
					win = { position = "right" },
				},
			},
		},
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
			{ "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
			{ "<leader>xS", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/... (Trouble)" },
			{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
			{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").prev({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cprev)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Previous Trouble/Quickfix Item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok then
							vim.notify(err, vim.log.levels.ERROR)
						end
					end
				end,
				desc = "Next Trouble/Quickfix Item",
			},
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false,
		lazy = true,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "zig" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-telescope/telescope-symbols.nvim" },
			{ "nvim-telescope/telescope-file-browser.nvim" },
			{ "debugloop/telescope-undo.nvim" },
		},
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (CWD)" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Find Help" },
			{ "<leader>fo", "<cmd>Telescope oldfiles<cr>", desc = "Old Recent Files" },
			{ "<leader>fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
			{ "<leader>fH", "<cmd>Telescope highlights<cr>", desc = "Find Highlight Groups" },
			{ "<leader>fG", "<cmd>Telescope grep_string<cr>", desc = "Grep String" },
			{ "<leader>kk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
			{ "<leader>kc", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>kh", "<cmd>Telescope command_history<cr>", desc = "Command History" },
			{ "<leader>ks", "<cmd>Telescope search_history<cr>", desc = "Search History" },
			{ "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
			{ "<leader>ef", "<cmd>Telescope file_browser<cr>", desc = "File Browser" },
			{ "<leader>cr", "<cmd>Telescope reloader<cr>", desc = "Reload Module" },
			{ "<leader>cn", "<cmd>Telescope notify<cr>", desc = "Notifications" },
			{ "<leader>fu", "<cmd>Telescope undo<cr>", desc = "Undo History" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
			{ "<leader>fq", "<cmd>Telescope quickfix<cr>", desc = "Quickfix" },
			{ "<leader>fs", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Fuzzy Find in File" },
		},

		config = function()
			require("configs.telescope")
		end,
	},
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},
	{

		"akinsho/toggleterm.nvim",
		cmd = { "ToggleTerm" },
		version = "v2.*",
		keys = {
			{ "<leader>t1", "<cmd>1ToggleTerm<cr>", desc = "Toggle Terminal", mode = "n" },
			{ "<leader>t2", "<cmd>2ToggleTerm<cr>", desc = "Toggle Terminal", mode = "n" },
		},
		config = function()
			require("configs.toggleterm")
		end,
	},
	{
		"2kabhishek/termim.nvim",
		cmd = { "Fterm", "FTerm", "Sterm", "STerm", "Vterm", "VTerm" },
		keys = {
			{ "<leader>th", "<cmd>Sterm<cr>", desc = "Horizontal Terminal" },
			{ "<leader>tv", "<cmd>Vterm<cr>", desc = "Vertical Terminal" },
		},
	},
	{
		"nvimdev/lspsaga.nvim",
		lazy = true,
		event = "LspAttach",
		config = function()
			vim.keymap.set(
				"n",
				"<leader>lo",
				"<cmd>Lspsaga outline<cr>",
				{ desc = "Lspsaga | Code Outline", silent = true }
			)
			local icons = require("lib.icons")
			require("lspsaga").setup({
				ui = {
					theme = "round",
					border = "rounded",
					devicon = true,
					title = true,
					winblend = 1,
					expand = icons.ui.ArrowOpen,
					collapse = icons.ui.ArrowClosed,
					preview = icons.ui.List,
					code_action = icons.diagnostics.Hint,
					diagnostic = icons.ui.Bug,
					incoming = icons.ui.Incoming,
					outgoing = icons.ui.Outgoing,
					hover = icons.ui.Comment,
				},
				lightbulb = {
					enable = false,
					enable_in_insert = true,
					sign = true,
					sign_priority = 40,
					virtual_text = true,
				},
				symbol_in_winbar = {
					enable = false,
					separator = "  ",
					hide_keyword = true,
					show_file = true,
					folder_level = 0,
				},
			})
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")
			require("rainbow-delimiters.setup").setup({
				{
					strategy = {
						[""] = rainbow_delimiters.strategy["global"],
						vim = rainbow_delimiters.strategy["local"],
					},
					query = {
						[""] = "rainbow-delimiters",
						lua = "rainbow-blocks",
					},
					priority = {
						[""] = 110,
						lua = 210,
					},
					highlight = {
						"RainbowDelimiterRed",
						"RainbowDelimiterYellow",
						"RainbowDelimiterBlue",
						"RainbowDelimiterOrange",
						"RainbowDelimiterGreen",
						"RainbowDelimiterViolet",
						"RainbowDelimiterCyan",
					},
				},
			})
		end,
	},
	{
		"2kabhishek/tdo.nvim",
		dependencies = "nvim-telescope/telescope.nvim",
		cmd = { "Tdo", "TdoEntry", "TdoNote", "TdoTodos", "TdoToggle", "TdoFind", "TdoFiles" },
		keys = {
			{ "<leader>nd", "<cmd>Tdo<cr>", desc = "Today's Todo" },
			{ "<leader>ne", "<cmd>TdoEntry<cr>", desc = "Today's Entry" },
			{ "<leader>nf", "<cmd>TdoFiles<cr>", desc = "All Notes" },
			{ "<leader>ng", "<cmd>TdoFind<cr>", desc = "Find Notes" },
			{ "<leader>nh", "<cmd>Tdo -1<cr>", desc = "Yesterday's Todo" },
			{ "<leader>nl", "<cmd>Tdo 1<cr>", desc = "Tomorrow's Todo" },
			{ "<leader>nn", "<cmd>TdoNote<cr>", desc = "New Note" },
			{ "<leader>nt", "<cmd>TdoTodos<cr>", desc = "Incomplete Todos" },
			{ "<leader>nx", "<cmd>TdoToggle<cr>", desc = "Toggle Todo" },
		},
	},
}
