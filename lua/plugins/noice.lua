return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    enabled = false,
    dependencies = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
    },
    config = function()
        require('noice').setup({
            cmdline = {
                format = {
                    cmdline = { pattern = '^:', icon = ' ', lang = 'vim' },
                    filter = { pattern = '^:%s*!', icon = ' ', lang = 'bash' },
                    lua = { pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' }, icon = ' ', lang = 'lua' },
                    help = { pattern = '^:%s*he?l?p?%s+', icon = ' ' },
                    search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
                    search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
                    input = { view = 'cmdline_input', icon = ' ' },
                },
            },
            lsp = {
                signature = {
                    enabled = false,
                },
            },
            presets = {
                command_palette = true,
            },
        })
    end,
}
