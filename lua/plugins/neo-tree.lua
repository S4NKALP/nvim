return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    keys = {
        { '<leader>ee', ':Neotree toggle float<CR>', silent = true, desc = 'Float File Explorer' },
        { '<leader><tab>', ':Neotree toggle left<CR>', silent = true, desc = 'Left File Explorer' },
    },
}
