require('toggleterm').setup({
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
})
