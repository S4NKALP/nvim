return {
    'numToStr/Navigator.nvim',
    keys = {
        { '<C-h>', '<cmd>NavigatorLeft<cr>' },
        { '<C-j>', '<cmd>NavigatorDown<cr>' },
        { '<C-k>', '<cmd>NavigatorUp<cr>' },
        { '<C-l>', '<cmd>NavigatorRight<cr>' },
        { '<C-\\>', '<cmd>NavigatorPrevious<cr>' },
    },
    config = function()
        require('Navigator').setup()
    end,
}
