return {
	{
		"ThePrimeagen/refactoring.nvim",
		config = function()
			require("refactoring").setup()
			-- vim.keymap.set("x", "<leader>re", ":Refactor extract ")
			-- vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")
			--
			-- vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")
			--
			-- vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")
			--
			-- vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")
			--
			-- vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
			-- vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
			-- load refactoring Telescope extension
			require("telescope").load_extension("refactoring")

			vim.keymap.set({ "n", "x" }, "<leader>rr", function()
				require("telescope").extensions.refactoring.refactors()
			end, { desc = "Refactor" })
		end,
	},
	{
		"2kabhishek/nerdy.nvim",
		dependencies = { "stevearc/dressing.nvim" },
		cmd = "Nerdy",
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = { options = vim.opt.sessionoptions:get() },
		keys = {
			{
				"<leader>ms",
				function()
					require("persistence").load()
				end,
				desc = "Restore Session",
			},
			{
				"<leader>ml",
				function()
					require("persistence").load({ last = true })
				end,
				desc = "Restore Last Session",
			},
			{
				"<leader>md",
				function()
					require("persistence").stop()
				end,
				desc = "Don't Save Current Session",
			},
		},
	},
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && yarn install",
		ft = { "markdown" },
		keys = {
			{
				"<leader>cm",
				"<cmd>MarkdownPreviewToggle<CR>",
				desc = "toggle markdown preview",
			},
		},
	},
	{
		"nvim-pack/nvim-spectre",
		build = false,
		cmd = "Spectre",
		opts = { open_cmd = "noswapfile vnew" },
		keys = {
			{
				"<leader>mr",
				function()
					require("spectre").open()
				end,
				desc = "Replace in Files (Spectre)",
			},
		},
	},
	{
		"szw/vim-maximizer",

		keys = {
			{ "<leader>mm", "<cmd>MaximizerToggle<CR>", desc = "Maximize/minimize a split" },
		},
	},
	{
		"folke/zen-mode.nvim",
		cmd = { "ZenMode" },
		opts = {},
		keys = {
			{ "<leader>wz", "<cmd>ZenMode<cr>", desc = "Toggle zen mode" },
		},
	},
	{
		"chrisgrieser/nvim-recorder",
		dependencies = { "rcarriga/nvim-notify" },
		event = "VeryLazy",
		vscode = true,
		keys = {
			{ "q", desc = "Start Recording" },
			{ "Q", desc = "Play Recording" },
			{ "<C-q>", desc = "Switch Slot" },
			{ "cq", desc = "Edit Macro" },
			{ "yq", desc = "Yank Macro" },
			{ "dq", desc = "Delete All Macros" },
		},
		opts = {
			useNerdFontsIcons = false,
			slots = { "a", "b", "c", "d" },
			mapping = {
				startStopRecording = "q",
				playMacro = "Q",
				editMacro = "cq",
				switchSlot = "<C-q>",
				deleteAllMacros = "dq",
				yankMacro = "yq",
			},
		},
	},
	{
		"creativenull/dotfyle-metadata.nvim",
		cmd = { "DotfyleGenerate", "DotfyleOpen" },
	},
	{
		"willothy/flatten.nvim",
		priority = 1001,
		opts = {
			window = {
				open = "alternate",
			},
		},
	},
	{
		"wakatime/vim-wakatime",
		event = { "VimEnter" },
		lazy = false,
	},
	{
		"mvllow/modes.nvim",
		event = { "BufReadPost", "BufNewFile" },
		tag = "v0.2.0",
		config = function()
			require("modes").setup({

				colors = {
					visual = "#f5c359",
					delete = "#c75c6a",
					copy = "#78ccc5",
					insert = "#c5739a",
				},
				line_opacity = 0.15,
				set_cursor = true,
				set_cursorline = true,
				set_number = true,
				ignore_filetypes = { "NvimTree", "TelescopePrompt" },
			})
		end,
	},
	{
		"LunarVim/bigfile.nvim",
		event = { "BufEnter", "WinEnter" },
		opts = {
			-- Disables LSP/treesitter, etc for files above 5000 lives (even if they have really long lines)
			pattern = function(bufnr, filesize_mib)
				if filesize_mib >= 2 then
					return true
				end
				-- you can't use `nvim_buf_line_count` because this runs on BufReadPre
				local file_contents = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
				local file_length = #file_contents
				if file_length > 5000 then
					return true
				end

				return false
			end,
		},
	},
	{
		"m4xshen/hardtime.nvim",
		config = function()
			require("hardtime").setup({ enabled = true })
		end,
		cmd = "Hardtime",
		init = function()
			vim.keymap.set("n", "<leader>ch", "<cmd>HardtimeToggle<cr>", { desc = "Toggle Hardtime" })
		end,
	},
}
