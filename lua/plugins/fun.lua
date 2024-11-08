return {
    {
        'm4xshen/hardtime.nvim',
        config = function()
            require('hardtime').setup({ enabled = true })
        end,
        cmd = 'Hardtime',
    },
    {
        'ThePrimeagen/vim-be-good',
        cmd = 'VimBeGood',
    },
    {
        'nvchad/showkeys',
        cmd = 'ShowkeysToggle',
        opts = {
            timeout = 1,
            maxkeys = 8,
        },
    },
    {
        'meznaric/key-analyzer.nvim',
        cmd = 'KeyAnalyzer',
        opts = {},
    },
    {
        'eandrju/cellular-automaton.nvim',
        keys = {
            { '<leader>mr', '<cmd>CellularAutomaton make_it_rain<cr>', desc = 'Make it rain' },
        },
    },
    {
        'tris203/precognition.nvim',
        enabled = false,
        opts = {
            showBlankVirtLine = false,
        },
    },
    {
        'sedm0784/vim-rainbow-trails',
        cmd = 'RainbowTrails',
    },
}
