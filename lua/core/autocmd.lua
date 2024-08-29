local function augroup(name)
    return vim.api.nvim_create_augroup('nvim' .. name, { clear = true })
end

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                Strip trailing spaces before write                 │
--     ╰───────────────────────────────────────────────────────────────────╯

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = augroup('strip_space'),
    pattern = { '*' },
    callback = function()
        vim.cmd([[ %s/\s\+$//e ]])
    end,
})

--     ╭───────────────────────────────────────────────────────────────────╮
--     │        Check if we need to reload the file when it changed        │
--     ╰───────────────────────────────────────────────────────────────────╯

vim.api.nvim_create_autocmd({ 'FocusGained', 'TermClose', 'TermLeave' }, {
    group = augroup('checktime'),
    command = 'checktime',
})

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                         Highlight on yank                         │
--     ╰───────────────────────────────────────────────────────────────────╯

vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup('highlight_yank'),
    callback = function()
        vim.highlight.on_yank()
    end,
})

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                resize splits if window got resized                │
--     ╰───────────────────────────────────────────────────────────────────╯

vim.api.nvim_create_autocmd({ 'VimResized' }, {
    group = augroup('resize_splits'),
    callback = function()
        vim.cmd('tabdo wincmd =')
    end,
})

--     ╭───────────────────────────────────────────────────────────────────╮
--     │               go to last loc when opening a buffer                │
--     ╰───────────────────────────────────────────────────────────────────╯

vim.api.nvim_create_autocmd('BufReadPost', {
    group = augroup('last_loc'),
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                   close some filetypes with <q>                   │
--     ╰───────────────────────────────────────────────────────────────────╯

vim.api.nvim_create_autocmd('FileType', {
    group = augroup('close_with_q'),
    pattern = {
        'DressingSelect',
        'Jaq',
        'PlenaryTestPopup',
        'fugitive',
        'help',
        'lir',
        'lspinfo',
        'man',
        'notify',
        'qf',
        'spectre_panel',
        'startuptime',
        'tsplayground',
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
    end,
})

--     ╭───────────────────────────────────────────────────────────────────╮
--     │            wrap and check for spell in text filetypes             │
--     ╰───────────────────────────────────────────────────────────────────╯

vim.api.nvim_create_autocmd('FileType', {
    group = augroup('wrap_spell'),
    pattern = { 'gitcommit', 'markdown' },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

--     ╭───────────────────────────────────────────────────────────────────╮
--     │   Auto create dir when saving a file, in case some intermediate   │
--     │                     directory does not exist                      │
--     ╰───────────────────────────────────────────────────────────────────╯

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
    group = augroup('auto_create_dir'),
    callback = function(event)
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
    end,
})

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                         Set arb filetype                          │
--     ╰───────────────────────────────────────────────────────────────────╯

vim.api.nvim_create_autocmd({ 'BufEnter' }, {
    group = augroup('set_file_type'),
    pattern = { '*.arb' },
    command = require('lib.util').get_file_type_cmd('arb'),
})

--     ╭───────────────────────────────────────────────────────────────────╮
--     │                      Disable format options                       │
--     ╰───────────────────────────────────────────────────────────────────╯

vim.api.nvim_create_autocmd('FileType', {
    group = augroup('disable_formatoptions'),
    pattern = '*',
    callback = function()
        vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │                    VIM-VISUAL-MULTI                     │
-- ╰─────────────────────────────────────────────────────────╯
local visual_multi_group = vim.api.nvim_create_augroup('VisualMulti', { clear = true })
vim.api.nvim_create_autocmd('User', {
    pattern = 'visual_multi_start',
    callback = function()
        -- vim.cmd('NoiceDisable')
        vim.lsp.inlay_hint.enable(false)
    end,
    group = visual_multi_group,
})
vim.api.nvim_create_autocmd('User', {
    pattern = 'visual_multi_exit',
    callback = function()
        -- vim.cmd('NoiceEnable')
        vim.lsp.inlay_hint.enable(true)
    end,
    group = visual_multi_group,
})

-- ╭─────────────────────────────────────────────────────────╮
-- │               MESSAGE IF MACRO IS STOPPED               │
-- ╰─────────────────────────────────────────────────────────╯
local macro_group = vim.api.nvim_create_augroup('MacroRecording', { clear = true })
vim.api.nvim_create_autocmd('RecordingLeave', {
    group = macro_group,
    callback = function()
        -- Display a message when macro recording stops
        print('Macro recording stopped')
    end,
})
