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

-- Better escape using jk in insert and terminal mode
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")
map("i", "jj", "<ESC>")

-- Terminal Mappings
map("t", "jk", "<C-\\><C-n>")
map("t", "kj", "<C-\\><C-n>")
map("t", "<ESC>", "<C-\\><C-n>")


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
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move text up and down
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":m '<-4<cr>gv=gv", { desc = "Move Up" })

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


-- Search
map({
    "n",
    "x"
}, "gw", "*N", {
    desc = "Search word under cursor"
})


-- Insert empty line in insert mode
map("i", "<A-o>", "<C-O>o", {
    desc = "Insert empty line below"
})
map("i", "<A-O>", "<C-O>O", {
    desc = "Insert empty line above"
})

-- Insert empty line without entering insert mode
map('n', '[o', ':<C-u>call append(line("."), repeat([""], v:count1))<CR>', {
    desc = "Insert empty line below"
})
map('n', ']o', ':<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>', {
    desc = "Insert empty line above"
})

-- go to beginning and end in insert mode
map("i", "<A-b>", "<ESC>^i", {
    desc = "Go to beginning of line"
})
map("i", "<A-e>", "<End>", {
    desc = "Go to end of line"
})

-- navigate within insert mode
map("i", "<C-h>", "<Left>", {
    desc = "Move Left"
})
map("i", "<C-l>", "<Right>", {
    desc = "Move Right"
})
map("i", "<C-j>", "<Down>", {
    desc = "Move Down"
})
map("i", "<C-k>", "<Up>", {
    desc = "Move Up"
})


-- Move to window using the <ctrl> hjkl keys
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })


-- Move with shift-arrows
map("n", "<S-Left>", "<C-w><S-h>", {
    desc = "Move window to the left"
})
map("n", "<S-Down>", "<C-w><S-j>", {
    desc = "Move window down"
})
map("n", "<S-Up>", "<C-w><S-k>", {
    desc = "Move window up"
})
map("n", "<S-Right>", "<C-w><S-l>", {
    desc = "Move window to the right"
})

-- Resize window using <ctrl> arrow keys
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })


-- Codeium
map('i', '<M-;>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
map('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
map('i', '<M-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
map('i', '<M-c>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })


map('n', '<leader>mu', function()
          require("notify").dismiss({ silent = true, pending = true })
        end, { desc = 'Dismiss All Notifications' })

