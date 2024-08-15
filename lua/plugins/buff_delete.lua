return {
    'famiu/bufdelete.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    init = function()
        vim.keymap.set('n', '<leader>q', function()
            require('bufdelete').bufdelete(0, false)
        end, { silent = true, desc = 'Quit Buffer' })
    end,
}
