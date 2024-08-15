return {
    'soulis-1256/eagle.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('eagle').setup({})
    end,
}
