local size = function()
    return vim.o.columns * 0.5
end
return {
    'akinsho/toggleterm.nvim',
    lazy = true,
    cmd = {
        'ToggleTerm',
        'ToggleTermSetName',
        'ToggleTermToggleAll',
        'ToggleTermSendVisualLines',
        'ToggleTermSendCurrentLine',
        'ToggleTermSendVisualSelection',
    },
    keys = {
        { '<leader>1', '<cmd>1ToggleTerm<cr>', desc = 'Toggle Terminal', mode = 'n' },
        { '<A-t>', '<cmd>ToggleTerm size=' .. size() .. '<cr>', desc = 'Toggle Terminal', mode = 'n' },
        { '<leader>2', '<cmd>2ToggleTerm<cr>', desc = 'Toggle Terminal', mode = 'n' },
    },
    opts = {
        size = 10,
        open_mapping = [[<c-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = '2',
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        direction = 'float', -- Use 'float' for floating terminal windows
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
            border = 'curved', -- or 'single', 'double', 'shadow', etc.
            winblend = 0, -- Set to 0 for full transparency
            highlights = {
                border = 'Normal',
                background = 'Normal',
            },
        },
    },
    {
        '2kabhishek/termim.nvim',
        cmd = { 'Fterm', 'FTerm', 'Sterm', 'STerm', 'Vterm', 'VTerm' },
        keys = {
            { '<leader>th', '<cmd>Sterm<cr>', desc = 'Horizontal Terminal' },
            { '<leader>tv', '<cmd>Vterm<cr>', desc = 'Vertical Terminal' },
        },
    },
}
