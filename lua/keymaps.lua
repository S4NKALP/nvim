-- File Explorer
vim.keymap.set('n', '<leader>n', ':Neotree filesystem reveal left toggle<CR>')

-- Telescope
vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>tc', ':Telescope colorscheme<CR>')
vim.keymap.set('n', '<leader>of', ':Telescope oldfiles<CR>')
vim.keymap.set('n', '<leader>tl', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>km', ':Telescope keymaps<CR>')
vim.keymap.set('n', '<leader>tf', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        previewer = false,
    }))
end)

-- formatter
vim.keymap.set('n', '<leader>ft', vim.lsp.buf.format, {})

-- buffer
vim.keymap.set('n', '<tab>', ':BufferNext<CR>')
vim.keymap.set('n', '<S-tab>', ':BufferPrevious<CR>')
vim.keymap.set('n', '<leader>q', ':BufferClose<CR>')

-- comment
vim.keymap.set('n', '<leader>/', 'gcc', { remap = true })

-- terminal
vim.keymap.set('n', '<leader>tr', ':ToggleTerm<CR>')

-- File Explorer
vim.keymap.set('n', '<leader>e', function()
    require('oil').toggle_float()
end)

-- Clear search, diff update and redraw
vim.keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- Move to window using the <ctrl> hjkl keys
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Move with shift-arrows
vim.keymap.set('n', '<S-Left>', '<C-w><S-h>', {
    desc = 'Move window to the left',
})
vim.keymap.set('n', '<S-Down>', '<C-w><S-j>', {
    desc = 'Move window down',
})
vim.keymap.set('n', '<S-Up>', '<C-w><S-k>', {
    desc = 'Move window up',
})
vim.keymap.set('n', '<S-Right>', '<C-w><S-l>', {
    desc = 'Move window to the right',
})

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- clear notification
vim.keymap.set('n', '<leader>mu', function()
    require('notify').dismiss({ silent = true, pending = true })
end, { desc = 'Dismiss All Notifications' })

