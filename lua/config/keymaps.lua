local opts = { noremap = true, silent = true }

-- Increment / Decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Replace currently selected text with default register without yanking it
vim.keymap.set('x', '<leader>p', '"_dP')

-- Delete without yanking
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Resize window using <ctrl> arrow keys
vim.keymap.set('n', '<A-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
vim.keymap.set('n', '<A-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
vim.keymap.set('n', '<A-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
vim.keymap.set('n', '<A-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Visual vim.keymap.sets
vim.keymap.set('v', '<leader>r', '"hy:%s/<C-r>h//g<left><left>') -- Replace all instances of highlighted words
vim.keymap.set('v', '<C-s>', ':sort<CR>') -- Sort highlighted text in visual mode with Control+S
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv") -- Move current line up
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- Move current line down

--utility vim.keymap.setpings
vim.keymap.set('n', 'n', 'nzzzv') -- keep the cursor centered when doing 'n'
vim.keymap.set('n', 'N', 'Nzzzv') -- keep the cursor centered when doing 'N'
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Join line without moving the cursor' })
vim.keymap.set('n', 'cn', '*``cgn', { desc = 'Change next match by pressing dot (.)' })
vim.keymap.set('n', 'cN', '*``cgN', { desc = 'Change previous match by pressing dot (.)' })
vim.keymap.set('n', '<leader>vp', '`[v`]<CR>', { desc = 'Select pasted text' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Scroll down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Scroll up' })

vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })

vim.keymap.set({ 'i' }, '<C-l>', '<Right>', { desc = 'Move cursor to right' })
vim.keymap.set({ 'i' }, '<C-h>', '<Left>', { desc = 'Move cursor to right' })

-- Better window management
vim.keymap.set('n', 'hs', ':split<Return>', opts)
vim.keymap.set('n', 'vs', ':vsplit<Return>', opts)
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left split' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to below split' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to above split' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' })
vim.keymap.set('n', '<A-Up>', '<cmd>resize -2<CR>', { desc = 'Resize split up' })
vim.keymap.set('n', '<A-Down>', '<cmd>resize +2<CR>', { desc = 'Resize split down' })
vim.keymap.set('n', '<A-Left>', '<cmd>vertical resize -2<CR>', { desc = 'Resize split left' })
vim.keymap.set('n', '<A-Right>', '<cmd>vertical resize +2<CR>', { desc = 'Resize split right' })

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { desc = '(V) Indent to left' })
vim.keymap.set('v', '>', '>gv', { desc = '(V) Indent to right' })

-- insert semicolon in the end
-- vim.keymap.set('i', '<A-;>', '<Esc>miA;<Esc>`ii', { desc = 'insert semicolon in the end' })

-- Change text without putting it into the vim register,
vim.keymap.set({ 'n', 'x' }, 'c', '"_c', { desc = 'Change without yanking' })
vim.keymap.set({ 'n', 'x' }, 'C', '"_C', { desc = 'Change without yanking' })
vim.keymap.set({ 'n', 'x' }, 'cc', '"_cc', { desc = 'Change without yanking' })
vim.keymap.set({ 'n', 'x' }, 'x', '"_x', { desc = 'delete without yanking' })

-- Better escape using jk in insert and terminal mode
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', 'kj', '<ESC>')
vim.keymap.set('i', 'jj', '<ESC>')

-- Terminal Mappings
vim.keymap.set('t', 'jk', '<C-\\><C-n>')
vim.keymap.set('t', 'kj', '<C-\\><C-n>')
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

-- save file
vim.keymap.set({ 'i', 'v', 'n', 's' }, '<A-s>', '<cmd>wa<cr><esc>', { desc = 'Save all file' })
