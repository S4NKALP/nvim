-- Increment / Decrement
vim.keymap.set('n', '+', '<C-a>')
vim.keymap.set('n', '-', '<C-x>')

-- Select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Replace currently selected text with default register without yanking it
vim.keymap.set('x', '<leader>p', '"_dP')

-- Delete and change without yanking
vim.keymap.set({ 'n', 'x' }, '<A-d>', '"_d', { desc = 'Delete Without Yanking' })
vim.keymap.set({ 'n', 'x' }, '<A-c>', '"_c', { desc = 'Change Without Yanking' })

-- Deleting without yanking empty line
vim.keymap.set('n', 'dd', function()
    local is_empty_line = vim.api.nvim_get_current_line():match('^%s*$')
    if is_empty_line then
        return '"_dd'
    else
        return 'dd'
    end
end, { noremap = true, expr = true, desc = "Don't Yank Empty Line to Clipboard" })

-- Search inside visually highlighted text
vim.keymap.set('x', 'g/', '<esc>/\\%V', { silent = false, desc = 'Search Inside Visual Selection' })

-- Search visually selected text (slightly better than builtins in Neovim>=0.8)
vim.keymap.set('x', '*', [[y/\V<C-R>=escape(@", '/\')<CR><CR>]], { desc = 'Search Selected Text', silent = true })
vim.keymap.set(
    'x',
    '#',
    [[y?\V<C-R>=escape(@", '?\')<CR><CR>]],
    { desc = 'Search Selected Text (Backwards)', silent = true }
)

-- save file
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })

-- save and quit
vim.keymap.set('n', '<leader>Q', '<cmd>wq!<CR>', { desc = 'Force save and  quit' })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Visual vim.keymap.sets
vim.keymap.set('v', '<leader>r', '"hy:%s/<C-r>h//g<left><left>') -- Replace all instances of highlighted words
vim.keymap.set('v', '<A-s>', ':sort<CR>') -- Sort highlighted text in visual mode with Control+S
vim.keymap.set('v', 'K', ":m '>-2<CR>gv=gv") -- Move current line up
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv") -- Move current line down

-- for buffers
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprev<CR>', { noremap = true, silent = true })

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
vim.keymap.set('n', 'vs', ':vsp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'hs', ':sp<CR>', { noremap = true, silent = true })
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

vim.keymap.set('n', '<Leader>lo', '<cmd>lopen<CR>', { desc = 'Open location list' })
vim.keymap.set('n', '<Leader>lc', '<cmd>lclose<CR>', { desc = 'Close location list' })
vim.keymap.set('n', '<Leader>ln', '<cmd>lnext<CR>', { desc = 'Next location list item' })
vim.keymap.set('n', '<Leader>lp', '<cmd>lprev<CR>', { desc = 'Previous location list item' })

-- insert semicolon in the end
vim.keymap.set('i', '<A-;>', '<Esc>miA;<Esc>`ii', { desc = 'insert semicolon in the end' })

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
