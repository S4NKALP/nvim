return {
    {
        'echasnovski/mini.nvim',
        event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
        version = false,
        config = function()
            require('mini.comment').setup({})
            require('mini.pairs').setup({})
            require('mini.move').setup({})
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
        end,
    },
}
