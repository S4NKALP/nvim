return {
    {
        'echasnovski/mini.comment',
        version = false,
        event = { 'BufReadPost', 'BufNewFile' },
        config = function()
            require('mini.comment').setup()
        end,
    },
}
