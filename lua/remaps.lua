local function map(mode, lhs, rhs, opts)
    local options = {
        noremap = true,
        silent = true,
    }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Save File
map(
    {
        'i',
        'v',
        'n',
        's',
    },
    '<C-s>',
    '<cmd>w<cr><esc>',
    {
        desc = 'Save file',
    }
)

map('i', '<C-v>', '<ESC>"+p<ESC>a', {
    desc = 'Paste from clipboard',
})

map('n', '<A-v>', 'm`o<ESC>p``', {
    desc = 'Paste below',
})

map('n', '<A-p>', 'm`O<ESC>p``', {
    desc = 'Paste above',
})

map(
    {
        'n',
        'x',
    },
    '<C-c>',
    '"+y<ESC>',
    {
        desc = 'Copy to clipboard',
    }
)

map(
    {
        'n',
        'x',
    },
    '<C-x>',
    '"+y<ESC>dd',
    {
        desc = 'Cut to clipboard',
    }
)

-- Reselect the text that has just been pasted, see also https://stackoverflow.com/a/4317090/6064933.
map('n', '<A-r>', "printf('`[%s`]', getregtype()[0])", {
    expr = true,
    desc = 'reselect last pasted area',
})

map(
    {
        'i',
        'v',
        'n',
        's',
    },
    '<C-q>',
    '<cmd>wq!<cr><esc>',
    {
        desc = 'Force Save file and quit',
    }
)

-- Select all text in the current buffer
map('n', '<C-a>', ':keepjumps normal! ggyG<cr>', {
    desc = 'Select all',
})

-- quit
map('n', '<A-q>', '<cmd>wqa!<cr>', {
    desc = 'Quit all',
})

-- go to beginning and end in insert mode
map('i', '<A-b>', '<ESC>^i', {
    desc = 'Go to beginning of line',
})
map('i', '<A-e>', '<End>', {
    desc = 'Go to end of line',
})

-- Go to the beginning and end of current line in insert mode quickly
map('i', '<A-h>', '<HOME>')
map('i', '<A-l>', '<END>')

-- insert semicolon in the end
map('i', '<A-;>', '<Esc>miA;<Esc>`ii', {
    desc = 'insert semicolon in the end',
})

-- Turn the word under cursor to upper case
map('i', '<c-u>', '<Esc>viwUea')
-- Turn the current word into lower case
map('i', '<c-t>', '<Esc>b~lea')

-- Undo
map('i', '<A-z>', '<C-O>u')

-- navigate within insert mode
map('i', '<C-h>', '<Left>', {
    desc = 'Move Left',
})
map('i', '<C-l>', '<Right>', {
    desc = 'Move Right',
})
map('i', '<C-j>', '<Down>', {
    desc = 'Move Down',
})
map('i', '<C-k>', '<Up>', {
    desc = 'Move Up',
})

-- Copy whole buffer
map('n', '<C-y>', '<cmd>%y+<CR>', {
    desc = 'Copy whole buffer',
})

-- Go to start or end of line easier
map(
    {
        'n',
        'x',
    },
    'H',
    '^',
    {
        desc = 'Go to beginning of line',
    }
)
map(
    {
        'n',
        'x',
    },
    'L',
    'g_',
    {
        desc = 'Go to end of line',
    }
)

-- Change text without putting it into the vim register,
map(
    {
        'n',
        'x',
    },
    'c',
    '"_c',
    {
        desc = 'Change without yanking',
    }
)
map(
    {
        'n',
        'x',
    },
    'C',
    '"_C',
    {
        desc = 'Change without yanking',
    }
)
map(
    {
        'n',
        'x',
    },
    'cc',
    '"_cc',
    {
        desc = 'Change without yanking',
    }
)
map(
    {
        'n',
        'x',
    },
    'x',
    '"_x',
    {
        desc = 'delete without yanking',
    }
)

-- Better escape using jk in insert and terminal mode
map('i', 'jk', '<ESC>')
map('i', 'kj', '<ESC>')
map('i', 'jj', '<ESC>')

-- Terminal Mappings
map("t", "jk", "<C-\\><C-n>")
map("t", "kj", "<C-\\><C-n>")
map("t", "<ESC>", "<C-\\><C-n>")

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

-- Search
map({
    "n",
    "x"
}, "gw", "*N", {
    desc = "Search word under cursor"
})

-- Some cool remaps
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "J", "mzJ`z")
map("n", "}", "}zzzv")
map("n", "{", "{zzzv")
map("n", "g,", "g,zvzz")
map("n", "g;", "g;zvzz")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "^", "g^")
map("n", "0", "g0")
-- Do not include white space characters when using $ in visual mode,
map("x", "$", "g_")
-- Always use very magic mode for searching
map("n", "/", [[/\v]])

-- Add undo break-points
map("i", "?", "?<c-g>u")
map("i", "!", "!<c-g>u")
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- compromised backward search when comma is being used as localleader
map("n", "<A-,>", ",")

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move text up and down
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-4<cr>gv=gv", { desc = "Move Up" })
