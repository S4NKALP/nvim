local twilight = require('twilight')

twilight.setup({
    dimming = { alpha = 0.45, color = { 'Normal', '#ffffff' }, inactive = false },
    context = 9,
    treesitter = true,
    expand = { 'function', 'method', 'table', 'if_statement', 'element' },
    exclude = {},
})

local zen = require('zen-mode')

zen.setup({
    window = {
        backdrop = 0.95,
        width = 180,
        height = 1,
        options = {
            signcolumn = 'no',
            number = false,
            relativenumber = false,
            cursorline = false,
            cursorcolumn = false,
            foldcolumn = '0',
            list = false,
        },
    },
    plugins = {
        options = { enabled = true, ruler = true, showcmd = true },
        twilight = { enabled = true },
        gitsigns = { enabled = true },
        tmux = { enabled = true },
        kitty = { enabled = false, font = '+4' },
    },
    on_open = function(win)
        vim.o.laststatus = 0
    end,
    on_close = function()
        vim.o.laststatus = 2
    end,
})
