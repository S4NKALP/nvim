return {
    -- Syntax highlightings
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = 'FileType',
        cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            { 'windwp/nvim-ts-autotag', event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' } },
        },
        config = function()
            require('nvim-ts-autotag').setup()
            require('nvim-treesitter.configs').setup({
                highlight = {
                    enable = true,
                },
                indent = {
                    enable = true,
                },
                ensure_installed = {
                    'vim',
                    'vimdoc',
                    'markdown',
                    'markdown_inline',
                    'bash',
                    'c',
                    'cpp',
                    'java',
                    'javascript',
                    'typescript',
                    'tsx',
                    'json',
                    'toml',
                    'html',
                    'css',
                    'scss',
                    'lua',
                    'python',
                    'liquid',
                },
                auto_install = true,
                playground = {
                    enable = true,
                    disable = {},
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ['af'] = { query = '@function.outer', desc = 'Select outer part of a function region' },
                            ['if'] = { query = '@function.inner', desc = 'Select inner part of a function region' },
                            ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class region' },
                            ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class region' },
                        },
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ['<leader>xp'] = { query = '@parameter.inner', desc = 'Swap parameter with the next one' },
                        },
                        swap_previous = {
                            ['<leader>xP'] = {
                                query = '@parameter.inner',
                                desc = 'Swap parameter with the previous one',
                            },
                        },
                    },
                },
            })
        end,
    },
    {
        {
            'nvim-treesitter/nvim-treesitter-context',
            event = 'VeryLazy',
            config = function()
                require('treesitter-context').setup({ mode = 'cursor', max_lines = 3 })
            end,
        },
    },
}
