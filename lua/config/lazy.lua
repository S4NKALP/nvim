-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
---@diagnostic disable-next-line: undefined-field
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    spec = {
        { import = 'plugins' },
        { import = 'list' },
    },
    install = {
        missing = true,
        colorscheme = { 'moonfly' },
    },
    checker = {
        enabled = true,
        notify = false,
    },
    change_detection = {
        enabled = true,
        notify = false,
    },
    ui = {
        icons = {
            cmd = ' ',
            config = ' ',
            event = '',
            ft = ' ',
            init = ' ',
            import = ' ',
            keys = ' ',
            lazy = '󰒲 ',
            loaded = '●',
            not_loaded = '○',
            plugin = ' ',
            runtime = ' ',
            require = '󰢱 ',
            source = ' ',
            start = '',
            task = '✔ ',
            list = {
                '●',
                '➜',
                '★',
                '‒',
            },
        },
    },
    performance = {
        rtp = {
            disabled_plugins = {
                '2html_plugin',
                'tohtml',
                'getscript',
                'getscriptPlugin',
                'gzip',
                'logipat',
                'netrw',
                'netrwPlugin',
                'netrwSettings',
                'netrwFileHandlers',
                'matchit',
                'tar',
                'tarPlugin',
                'rrhelper',
                'spellfile_plugin',
                'vimball',
                'vimballPlugin',
                'zip',
                'zipPlugin',
                'tutor',
                'rplugin',
                'syntax',
                'synmenu',
                'optwin',
                'compiler',
                'bugreport',
                'ftplugin',
            },
        },
    },
})