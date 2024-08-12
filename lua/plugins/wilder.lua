return {
    {
        'gelguy/wilder.nvim',
        keys = {
            ':',
            '/',
            '?',
        },
        dependencies = {
            'catppuccin/nvim',
        },
        config = function()
            local wilder = require('wilder')

            -- Enable wilder when pressing :, / or ?
            wilder.setup({ modes = { ':', '/', '?' } })

            -- Enable fuzzy matching for commands and buffers
            wilder.set_option('pipeline', {
                wilder.branch(
                    wilder.cmdline_pipeline({
                        fuzzy = 1,
                    }),
                    wilder.vim_search_pipeline({
                        fuzzy = 1,
                    })
                ),
            })

            wilder.set_option(
                'renderer',
                wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
                    border = 'rounded',
                    max_height = '75%',
                    min_height = 0,
                    prompt_position = 'top',
                    reverse = 0,
                }))
            )
        end,
    },
}
