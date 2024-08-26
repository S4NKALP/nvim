return {
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		opts = {
			k = function()
				vim.api.nvim_input("<esc>")
				local current_line = vim.api.nvim_get_current_line()
				if current_line:match("^%s+j$") then
					vim.schedule(function()
						vim.api.nvim_set_current_line("")
					end)
				end
			end,
		},
	},
	{
		"mg979/vim-visual-multi",
		event = "BufReadPre",
		keys = {
			{
				"<C-S-Down>",
				":call vm#commands#add_cursor_down(0, v:count1)<cr>",
				desc = "Add Cursor Down",
				mode = { "n" },
				noremap = true,
				silent = true,
			},
			{
				"<C-S-Up>",
				":call vm#commands#add_cursor_up(0, v:count1)<cr>",
				desc = "Add Cursor Up",
				mode = { "n" },
				noremap = true,
				silent = true,
			},
			{
				"<M-S-j>",
				":call vm#commands#add_cursor_down(0, v:count1)<cr>",
				desc = "Add Cursor Down",
				mode = { "n" },
				noremap = true,
				silent = true,
			},
			{
				"<M-S-k>",
				":call vm#commands#add_cursor_up(0, v:count1)<cr>",
				desc = "Add Cursor Down",
				mode = { "n" },
				noremap = true,
				silent = true,
			},
			{
				"<M-d>",
				":call vm#commands#ctrln(v:count1)<cr>",
				desc = "Multi Edit Next",
				mode = { "n" },
				noremap = true,
				silent = true,
			},
		},
		config = function()
			vim.g.VM_default_mappings = 0
			vim.g.VM_silent_exit = 1
			vim.g.VM_set_statusline = 0
			vim.g.VM_maps = {
				["Find Under"] = "",
			}

			vim.g.VM_maps["I BS"] = ""
			vim.g.VM_maps["I CtrlC"] = ""
			vim.g.VM_maps["I CtrlN"] = ""
		end,
	},
	{
		"CRAG666/code_runner.nvim",
		config = true,
		vim.keymap.set("n", "<leader>rc", "<cmd>RunCode<CR>", { desc = "Run Code " }),
		vim.keymap.set("n", "<leader>rf", "<cmd>RunFile<CR>", { desc = "Run Code File  " }),
		vim.keymap.set("n", "<leader>rp", "<cmd>RunProject<CR>", { desc = "Run Code Project " }),
		vim.keymap.set("n", "<leader>rx", "<cmd>RunClose<CR>", { desc = "Close Code Run " }),
		opts = {
			filetype = {
				python = "python3 -u",
				c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
				cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
				sh = "bash",
				go = "go run",
				lua = "lua",
				julia = "julia",
				typescript = "ts-node",
				javascript = "node",
				rust = "cd $dir && cargo run",
				php = "php",
				java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
				kotlin = "cd $dir && kotlinc $fileName -include-runtime -d $fileNameWithoutExt.jar && java -jar $fileNameWithoutExt.jar",
			},
		},
	},
	{
		"L3MON4D3/LuaSnip",
		event = { "BufReadPost", "BufNewFile" },
		dependencies = {
			"rafamadriz/friendly-snippets",
			"mstuttgart/odoo-snippets",
		},
		opts = {
			history = true,
			updateevents = "TextChanged,TextChangedI",
		},
		keys = function()
			return {}
		end,
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recommended as each new version will have breaking changes
		opts = {},
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"saadparwaiz1/cmp_luasnip", --for autocomplete
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"onsails/lspkind.nvim", -- vs-code like pictograms
			"L3MON4D3/LuaSnip", -- snippets
			"rafamadriz/friendly-snippets", -- useful snippets
		},
		config = function()
			require("configs.cmp")
		end,
	},
	{
		"Exafunction/codeium.vim",
		event = "InsertEnter",
		config = function()
			local cmp = require("cmp")
			cmp.event:on("menu_opened", function()
				vim.g.codeium_manual = true
				vim.fn["codeium#Clear"]()
			end)
			cmp.event:on("menu_closed", function()
				vim.g.codeium_manual = false
				vim.fn["codeium#Complete"]()
			end)

			vim.g.codeium_filetypes = {
				TelescopePrompt = false,
				DressingInput = false,
				["neo-tree-popup"] = false,
				["dap-repl"] = false,
			}

			local opts = { expr = true, silent = true }
			vim.g.codeium_disable_bindings = 1

			vim.keymap.set("i", "<M-CR>", function()
				return vim.fn["codeium#Accept"]()
			end, opts)

			vim.keymap.set("n", "<leader>ch", function()
				return vim.fn["codeium#Chat"]()
			end, { desc = "Chat with IA (Codeium)" })

			vim.keymap.set("i", "<M-]>", function()
				return vim.fn["codeium#CycleCompletions"](1)
			end, opts)

			vim.keymap.set("i", "<M-[>", function()
				return vim.fn["codeium#CycleCompletions"](-1)
			end, opts)

			vim.keymap.set("i", "<M-c>", function()
				return vim.fn["codeium#Clear"]()
			end, opts)

			vim.keymap.set("n", "<leader>cI", "<cmd>CodeiumToggle<cr>", { desc = "Toggle IA (Codeium)" })
		end,
	},
	{
		"nacro90/numb.nvim",
		event = "CmdlineEnter",
		config = function()
			require("numb").setup({
				show_numbers = true, -- Enable 'number' for the window while peeking
				show_cursorline = true, -- Enable 'cursorline' for the window while peeking
				hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
				number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
				centered_peeking = true, -- Peeked line will be centered relative to window
			})
		end,
	},
	{
		"NStefan002/screenkey.nvim",
		cmd = "Screenkey",
		version = "*",
		vim.keymap.set("n", "<leader>kt", "<cmd>Screenkey<CR>", { desc = "Toggle keys" }),
		config = function()
			require("screenkey").setup({
				win_opts = {
					relative = "editor",
					anchor = "SE",
					width = 40,
					height = 1,
					border = "single",
				},
				compress_after = 3,
				clear_after = 3,
				disable = {
					filetypes = {}, -- for example: "toggleterm"
					buftypes = {}, -- for example: "terminal"
				},
			})
		end,
	},
	{
		"gbprod/yanky.nvim",
		event = "BufReadPost",
		keys = {
			{ "<C-n>", "<Plug>(YankyCycleForward)" },
			{ "<C-p>", "<Plug>(YankyCycleBackward)" },
			{
				"<leader>yp",
				function()
					require("telescope").extensions.yank_history.yank_history({})
				end,
				desc = "Open Yank History",
			},
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
			{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
			{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
			-- This is not plugin keymaps
			{ "<leader>yP", "<cmd>CopyAbsolutePath<cr>", desc = "Absolute Path" },
			{ "<leader>ya", "<cmd>%y+<cr>", desc = "Copy Whole File" },
			{ "<leader>yf", "<cmd>CopyFileName<cr>", desc = "File Name" },
			{ "<leader>yg", '<cmd>lua require"gitlinker".get_buf_range_url()<cr>', desc = "Copy Git URL" },
			{ "<leader>yp", "<cmd>CopyRelativePath<cr>", desc = "Relative Path" },
		},
		opts = {
			highlight = {
				timer = 150,
			},
		},
	},
	{
		{
			"LudoPinelli/comment-box.nvim",
			opts = {},
			vscode = true,
			keys = {
				{ "<leader>Cb", "<cmd>CBccbox<CR>", mode = { "n", "v" }, desc = "Comment Box" },
				{ "<leader>Ct", "<cmd>CBllline<CR>", mode = { "n", "v" }, desc = "Tiled line" },
				{ "<leader>Cl", "<cmd>CBline<CR>", desc = "Line" },
				{ "<leader>Cm", "<cmd>CBllbox14<CR>", mode = { "n", "v" }, desc = "Marked" },
				{ "<leader>Cc", "<cmd>CBcatalog<CR>", desc = "Catalog" },
				{ "<leader>Cd", "<cmd>CBd<CR>", mode = { "n", "v" }, desc = "Delete Comment Style" },
			},
		},
	},
	{
		"m-demare/hlargs.nvim",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"numToStr/Navigator.nvim",
		keys = {
			{ "<C-h>", "<cmd>NavigatorLeft<cr>" },
			{ "<C-j>", "<cmd>NavigatorDown<cr>" },
			{ "<C-k>", "<cmd>NavigatorUp<cr>" },
			{ "<C-l>", "<cmd>NavigatorRight<cr>" },
			{ "<C-\\>", "<cmd>NavigatorPrevious<cr>" },
		},
		config = function()
			require("Navigator").setup()
		end,
	},
}
