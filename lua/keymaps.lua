vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left toggle<CR>')

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>')
vim.keymap.set('n', '<leader>tc', ':Telescope colorscheme<CR>')
vim.keymap.set('n', '<leader>of', ':Telescope oldfiles<CR>')
vim.keymap.set('n', '<leader>tl', ':Telescope live_grep<CR>')
vim.keymap.set('n', '<leader>km', ':Telescope keymaps<CR>')

vim.keymap.set('n', '<leader>ft', vim.lsp.buf.format, {})

