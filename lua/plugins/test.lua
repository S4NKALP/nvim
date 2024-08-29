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
}
