return {
	'rcarriga/nvim-notify',

	config = function()
		vim.notify = require('notify')

		require('notify')('Welcome Back!')
		require('notify').setup({
			background_colour = 'Normal',
			fps = 30,
			icons = {
				DEBUG = ' ',
				ERROR = ' ',
				INFO = ' ',
				TRACE = '✎',
				WARN = ' ',
			},
			level = 2,
			minimum_width = 40,
			maximum_width = 40,
			render = 'wrapped-compact',
			stages = 'slide',
			timeout = 2000,
		})
	end,
}
