return {
    'akinsho/bufferline.nvim',
    event = { 'BufReadPost', 'BufAdd', 'BufNewFile' },
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {
        options = {
            debug = { logging = true },
            mode = 'buffers',
            indicator = { icon = '▍', style = 'none' },
            sort_by = 'insert_after_current',
            move_wraps_at_ends = true,
            right_mouse_command = 'vert sbuffer %d',
            show_close_icon = false,
            show_buffer_close_icons = false,
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count, level)
                local icon = level:match('error') and ' ' or ' '
                return ' ' .. icon .. count
            end,
            diagnostics_update_in_insert = false,
            hover = { enabled = true, reveal = { 'close' } },
            offsets = {
                {
                    filetype = 'neo-tree',
                    text = ' File Explorer',
                    highlight = 'Directory',
                    separator = false,
                },
            },
        },
    },
}
