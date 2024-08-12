-- This file is automatically loaded by plugins.core
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.expandtab = false
opt.tabstop = 6
opt.shiftwidth = 6
opt.wrap = false

-- netrw file explorer settings
vim.g.netrw_winsize = 20
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 1

opt.cursorline = true -- Enable highlighting of the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.breakindent = true
opt.clipboard = 'unnamedplus' -- allows neovim to access the system clipboard
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.inccommand = 'split' -- preview incremental substitute
opt.mouse = 'a' -- allow the mouse to be used in neovim
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.scrolloff = 10
opt.shiftround = true -- round indent
opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
opt.showcmd = false
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 0 -- always show tabs
opt.signcolumn = 'yes' -- always show the sign column, otherwise it would shift the text each timeout
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter again
opt.smarttab = true
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go right of the current window
opt.swapfile = false -- creastes a swapfile
opt.tabstop = 4 -- insert 2 spaces for a tab
opt.undofile = true -- enable persistent undofile
opt.undolevels = 10000
opt.updatetime = 50 -- faster completion (4000ms default)
opt.writebackup = false -- donot edit backups
opt.backup = false -- creates a backup file
opt.autowrite = true
opt.autoindent = true
opt.ai = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

vim.opt.path:append({ '**' })
vim.opt.shortmess:append({ W = true, I = true, c = true })

-- hides `~` at the end of buffer
vim.cmd([[set fillchars+=eob:\ ]])

vim.cmd([[autocmd FileType * set formatoptions-=ro]])
