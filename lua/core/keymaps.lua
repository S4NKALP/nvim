local function map(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end
local opts = { noremap = true, silent = true }
local icons = require('lib.icons')

-- Space as leader
map('n', '<Space>', '', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
-- normal_mode = "n", insert_mode = "i", visual_mode = "v",
-- visual_block_mode = "x", term_mode = "t", command_mode = "c",

-- Save File
map({
    "i",
    "v",
    "n",
    "s"
}, "<C-s>", "<cmd>w<cr><esc>", {
    desc = "Save file"
})

-- ctrl a to selected all text in file
map({
    "n",
    "i",
    "v"
}, "<C-a>", "<esc>ggVG")

-- Copy whole file
map("n", "<C-y>", "<cmd>%y+<CR>", {
    desc = "Copy whole file"
})

-- Paste
map("n", "]p", "o<Esc>p", {
    desc = "Paste below"
})
map("n", "[P", "O<Esc>p", {
    desc = "Paste above"
})
map("i", "<C-v>", '<ESC>"+p<ESC>a', {
    desc = "Paste from clipboard"
})
map({
    "n",
    "x"
}, "<C-c>", '"+y<ESC>', {
    desc = "Copy to clipboard"
})

-- Use jj as escape
map('i', 'jj', '<Esc>', opts)
map('t', 'JJ', '<C-\\><C-n>', opts)

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

-- Codeium
map('i', '<M-;>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
map('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
map('i', '<M-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
map('i', '<M-c>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })


-- Oil Explorer
map('n', '<leader>e', function()
	require("oil").toggle_float()
end, { desc = icons.documents.OpenFolder .. 'Oil File Explorer' })



