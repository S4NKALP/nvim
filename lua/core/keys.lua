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

-- save file
map({ 'x', 'i', 'n', 's' }, '<C-s>', '<cmd>w<cr>', { desc = 'Save File' })

-- Shortcut for surrounding a word (inner) with a '
map('n', 'S', '<nop>') -- Don't keep S mapping
map('n', 'Sq', "Siw'", { desc = "Wrap word with '", remap = true })
map('n', 'Sp', 'SiW(', { desc = 'Wrap word with ()', remap = true })
map('n', 'Sb', 'Saw}', { desc = 'Wrap word with {}', remap = true })

-- Remove all text
map('n', '<leader>r', '<cmd>%d+<cr>', { desc = 'General | Remove All Text', silent = true })

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

map('n', 'd', '"_d', { desc = 'Delete without replacing clipboad' })
map('n', 'x', '"_x', { desc = 'Cut without replacing clipboad' })
map('n', 'c', '"_c', { desc = 'Change without replacing clipboad' })
map('v', 'p', '"_dP', { desc = 'Paste without replacing clipboard' })

map('n', '<leader>oz', function()
    ---@diagnostic disable-next-line: undefined-field
    if vim.opt.foldcolumn:get() == '0' then
        vim.opt.foldcolumn = '1'
    else
        vim.opt.foldcolumn = '0'
    end
end, { desc = 'Toggle foldcolumn' })

map('n', '<leader>op', function()
    vim.g.minipairs_disable = not vim.g.minipairs_disable and true or false
end, { desc = 'Toggle mini.pairs' })

-- -- Indent backward
-- vim.keymap.set("n", "<", "<<", { desc = "General | Indent backward", silent = true })
--
-- -- Indent forward
-- vim.keymap.set("n", ">", ">>", { desc = "General | Indent forward", silent = true })
--
-- -- Move the line up
-- vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "General | Move the line up", silent = true })
--
-- -- Move the line down
-- vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "General | Move the line down", silent = true })
--
-- -- Move the line up (Insert Mode)
-- vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "General | Move the line up", silent = true })
--
-- -- Move the line down (Insert Mode)
-- vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "General | Move the line down", silent = true })
--
-- -- Better Down (Visual Mode)
-- vim.keymap.set("v", "j", "v:count == 0 ? 'gj' : 'j'", { desc = "General | Better Down", expr = true, silent = true })
--
-- -- Better Up (Visual Mode)
-- vim.keymap.set("v", "k", "v:count == 0 ? 'gk' : 'k'", { desc = "General | Better Up", expr = true, silent = true })
--
-- -- Better Paste (Visual Mode)
-- vim.keymap.set("v", "p", '"_dP', { desc = "General | Better Paste", silent = true })
--
-- -- Indent backward (Visual Mode)
-- vim.keymap.set("v", "<", "<gv", { desc = "General | Indent backward", silent = true })
--
-- -- Indent forward (Visual Mode)
-- vim.keymap.set("v", ">", ">gv", { desc = "General | Indent forward", silent = true })
--
-- -- Move the selected text up (Visual Mode)
-- vim.keymap.set("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", { desc = "General | Move the selected text up", silent = true })
--
-- -- Move the selected text down (Visual Mode)
-- vim.keymap.set("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", { desc = "General | Move the selected text down", silent = true })
