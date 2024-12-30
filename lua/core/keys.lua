local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end
local opts = { noremap = true, silent = true }

-- Space as leader
map('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
-- normal_mode = "n", insert_mode = "i", visual_mode = "v",
-- visual_block_mode = "x", term_mode = "t", command_mode = "c",

-- Comment
map({ 'n', 'v' }, '<leader>/', 'gcc', { desc = 'Comment toggle', remap = true })
map({ 'v', 'x' }, '<leader>/', 'gc', { desc = 'Comment toggle', remap = true })

-- Able to use semicolon in normal mode
map('n', ';', ':', { desc = '; Command mode' })

-- Select all
map('n', '<C-a>', 'gg<S-v>G')

-- Use jj as escape
map('i', 'jj', '<Esc>', opts)
map('i', 'jk', '<Esc>', opts)
map('i', 'kj', '<Esc>', opts)
map('t', 'JJ', '<C-\\><C-n>', opts)

-- Terminal Mappings
map('t', 'jk', '<C-\\><C-n>')
map('t', 'kj', '<C-\\><C-n>')
map('t', '<ESC>', '<C-\\><C-n>')

-- Visual overwrite paste
map({ 'v', 'x' }, 'p', '"_dP', opts)

-- Do not copy on x
map({ 'v', 'x' }, 'x', '"_x', opts)

-- Increment/decrement
map({ 'n', 'v', 'x' }, '-', '<C-x>', opts)
map({ 'n', 'v', 'x' }, '=', '<C-a>', opts)

-- Move to line beginning and end
map({ 'n', 'v', 'x' }, 'gl', '$', { desc = 'End of line' })
map({ 'n', 'v', 'x' }, 'gh', '^', { desc = 'Beginning of line' })

-- Center Cursors
map('n', 'J', 'mzJ`z', opts)
map('n', '<C-d>', '<C-d>zz', opts)
map('n', '<C-u>', '<C-u>zz', opts)
map('n', 'n', 'nzzzv', opts)
map('n', 'N', 'Nzzzv', opts)

-- Better up/down
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move text up and down
map({ 'v', 'x' }, 'J', ":move '>+1<CR>gv-gv", opts)
map({ 'v', 'x' }, 'K', ":move '<-2<CR>gv-gv", opts)

-- Clear search, diff update and redraw
map({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- Cursor navigation on insert mode
map('i', '<M-h>', '<left>', { desc = 'Move Cursor Left' })
map('i', '<M-l>', '<right>', { desc = 'Move Cursor Left' })
map('i', '<M-j>', '<down>', { desc = 'Move Cursor Left' })
map('i', '<M-k>', '<up>', { desc = 'Move Cursor Left' })

-- Consistent n/N search navigation
map('n', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
map('n', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- Better indenting
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Add undo breakpoints
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- Move Lines
vim.keymap.set('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move lines', silent = true })
vim.keymap.set('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move lines', silent = true })
vim.keymap.set('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { desc = 'Move lines', silent = true })
vim.keymap.set('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move lines', silent = true })
vim.keymap.set('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move lines', silent = true })
vim.keymap.set('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { desc = 'Move lines', silent = true })
