return {
    'nvim-neotest/neotest',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'olimorris/neotest-rspec',
        'nvim-neotest/neotest-jest',
        'nvim-neotest/neotest-python',
    },
    cmd = 'Neotest',
    config = function()
        require('neotest').setup({
            status = { virtual_text = true },
            output = { open_on_run = true },
            adapters = {
                require('neotest-vitest'),
                require('neotest-jest')({
                    jestCommand = 'npm test --',
                    jestConfigFile = 'custom.jest.config.ts',
                    env = { CI = true },
                    cwd = function(path)
                        return vim.fn.getcwd()
                    end,
                }),
            },
        })
    end,
    keys = {
        { '<leader>uc', '<cmd>lua require("neotest").run.run()<cr>', desc = 'Run Current Test' },
        { '<leader>uf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<cr>', desc = 'Run Test File' },
        {
            '<leader>uo',
            '<cmd>lua require("neotest").output.open({ enter = true, auto_close = true })<cr>',
            desc = 'Show Output',
        },
        { '<leader>uS', '<cmd>lua require("neotest").summary.toggle<cr>', desc = 'Toggle Summary' },
        { '<leader>ur', '<cmd>lua require("neotest").run.run()', desc = 'Run Nearest Test' },
        { '<leader>us', '<cmd>lua require("neotest").run.stop()<cr>', desc = 'Stop' },
        { '<leader>uO', '<cmd>lua require("neotest").output_panel.toggle<cr>', desc = 'Toggle Output Panel' },
    },
}
