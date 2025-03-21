local spider = require('spider')

spider.setup({
    skipInsignificantPunctuation = true,
})

vim.keymap.set({ 'n', 'o', 'x' }, 'w', ":lua require('spider').motion('w')<CR>", { desc = 'Spider-w' })
vim.keymap.set({ 'n', 'o', 'x' }, 'e', ":lua require('spider').motion('e')<CR>", { desc = 'Spider-e' })
vim.keymap.set({ 'n', 'o', 'x' }, 'b', ":lua require('spider').motion('b')<CR>", { desc = 'Spider-b' })
vim.keymap.set({ 'n', 'o', 'x' }, 'ge', ":lua require('spider').motion('ge')<CR>", { desc = 'Spider-ge' })
