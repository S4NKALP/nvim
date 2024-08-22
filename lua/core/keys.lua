local function map(mode, lhs, rhs, opts)
	opts = opts or {}
	opts.silent = opts.silent ~= false
	vim.keymap.set(mode, lhs, rhs, opts)
end
local opts = { noremap = true, silent = true }

-- Use jj as escape
map("i", "jj", "<Esc>", opts)
map("t", "JJ", "<C-\\><C-n>", opts)

-- Visual overwrite paste
map({ "v", "x" }, "p", '"_dP', opts)

-- Do not copy on x
map({ "v", "x" }, "x", '"_x', opts)

-- Increment/decrement
map({ "n", "v", "x" }, "-", "<C-x>", opts)
map({ "n", "v", "x" }, "=", "<C-a>", opts)

-- Move to line beginning and end
map({ "n", "v", "x" }, "gl", "$", { desc = "End of line" })
map({ "n", "v", "x" }, "gh", "^", { desc = "Beginning of line" })

-- Select all
map("n", "<C-a>", "gg<S-v>G")

map("n", "<C-s>", "<CMD>up<CR>", { desc = "Save File" })

-- Center Cursors
map("n", "J", "mzJ`z", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

-- Better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move text up and down
map({ "v", "x" }, "J", ":move '>+1<CR>gv-gv", opts)
map({ "v", "x" }, "K", ":move '<-2<CR>gv-gv", opts)

-- Clear search, diff update and redraw
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Consistent n/N search navigation
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Add undo breakpoints
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

map({ "i" }, "<C-l>", "<Right>", { desc = "Move cursor to right" })
map({ "i" }, "<C-h>", "<Left>", { desc = "Move cursor to right" })

map("n", "d", '"_d', { desc = "Delete without replacing clipboad" })
map("n", "x", '"_x', { desc = "Cut without replacing clipboad" })
map("n", "c", '"_c', { desc = "Change without replacing clipboad" })
map("v", "p", '"_dP', { desc = "Paste without replacing clipboard" })
