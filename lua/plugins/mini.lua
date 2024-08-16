return {
    {
        'echasnovski/mini.nvim',
        event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
        version = false,
        config = function()
            require('mini.comment').setup({})
            require('mini.cursorword').setup()
            -- require("mini.tabline").setup()
            local statusline = require('mini.statusline')
            statusline.setup({ use_icons = true })
            ---@diagnostic disable-next-line: duplicate-set-field
            statusline.section_location = function()
                return '%2l:%-2v'
            end

            require('mini.bracketed').setup({
                file = { suffix = '' },
                window = { suffix = '' },
                quickfix = { suffix = '' },
                yank = { suffix = '' },
                treesitter = { suffix = 'n' },
            })
            require('mini.surround').setup({
                mappings = {
                    add = 'gsa', -- Add surrounding in Normal and Visual modes
                    delete = 'gsd', -- Delete surrounding
                    replace = 'gsr', -- Replace surrounding
                    find = 'gsf', -- Find surrounding (to the right)
                    find_left = 'gsF', -- Find surrounding (to the left)
                    highlight = 'gsh', -- Highlight surrounding
                    update_n_lines = 'gsn', -- Update `n_lines`
                },
            })
            require('mini.pairs').setup({
                odes = { command = true },
                mappings = {
                    ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
                    ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
                },
            })
            require('mini.move').setup({
                keys = {
                    { '<M-Left>', mode = { 'n', 'v' } },
                    { '<M-Down>', mode = { 'n', 'v' } },
                    { '<M-Up>', mode = { 'n', 'v' } },
                    { '<M-Right>', mode = { 'n', 'v' } },
                },

                mappings = {
                    left = '<M-Left>',
                    line_left = '<M-Left>',
                    right = '<M-Right>',
                    line_right = '<M-Right>',
                    down = '<M-Down>',
                    line_down = '<M-Down>',
                    up = '<M-Up>',
                    line_up = '<M-Up>',
                },
            })
        end,
    },
}
