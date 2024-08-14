return {
    'Exafunction/codeium.vim',
    event = 'InsertEnter',
    cmd = 'Codeium',
    build = 'Codeium Auth:',

    config = function()
        vim.keymap.set('i', '<M-CR>', function()
            return vim.fn['codeium#Accept']()
        end, { expr = true, silent = true })
        vim.keymap.set("n", "<leader>c", function()
            return vim.fn["codeium#Chat"]()
        end, { desc = "Chat with IA (Codeium)" })
        vim.keymap.set('i', '<M-]>', function()
            return vim.fn['codeium#CycleCompletions'](1)
        end, { expr = true, silent = true })
        vim.keymap.set('i', '<M-[,>', function()
            return vim.fn['codeium#CycleCompletions'](-1)
        end, { expr = true, silent = true })
        vim.keymap.set('i', '<M-c>', function()
            return vim.fn['codeium#Clear']()
        end, { expr = true, silent = true })
    end,
}
