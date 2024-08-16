return {
    {
        'Exafunction/codeium.vim',
        event = 'InsertEnter',
        config = function()
            local cmp = require('cmp')
            cmp.event:on('menu_opened', function()
                vim.g.codeium_manual = true
                vim.fn['codeium#Clear']()
            end)
            cmp.event:on('menu_closed', function()
                vim.g.codeium_manual = false
                vim.fn['codeium#Complete']()
            end)

            vim.g.codeium_filetypes = {
                TelescopePrompt = false,
                DressingInput = false,
                ['neo-tree-popup'] = false,
                ['dap-repl'] = false,
            }

            local opts = { expr = true, silent = true }
            vim.g.codeium_disable_bindings = 1

            vim.keymap.set('i', '<M-CR>', function()
                return vim.fn['codeium#Accept']()
            end, opts)

            vim.keymap.set('n', '<leader>ch', function()
                return vim.fn['codeium#Chat']()
            end, { desc = 'Chat with IA (Codeium)' })

            vim.keymap.set('i', '<M-]>', function()
                return vim.fn['codeium#CycleCompletions'](1)
            end, opts)

            vim.keymap.set('i', '<M-[>', function()
                return vim.fn['codeium#CycleCompletions'](-1)
            end, opts)

            vim.keymap.set('i', '<M-c>', function()
                return vim.fn['codeium#Clear']()
            end, opts)

            vim.keymap.set('n', '<leader>cI', '<cmd>CodeiumToggle<cr>', { desc = 'Toggle IA (Codeium)' })
        end,
    },
}
