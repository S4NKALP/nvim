return {
    -- Syntax highlightings
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'windwp/nvim-ts-autotag',
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
                },
                auto_install = true,
                playground = {
                    enable = true,
                    disable = {},
                },
                textobjects = {
                    select = {
                        enable = true,
                        -- Automatically jump forward to textobj, similar to targets.vim
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
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('treesitter-context').setup({ enable = false })
        end,
        cmd = 'TSContextToggle',
        init = function()
            vim.keymap.set('n', '[c', function()
                require('treesitter-context').go_to_context()
            end, { silent = true, desc = 'Go to TS context' })
            vim.keymap.set('n', '<leader>tc', function()
                require('treesitter-context').toggle()
            end, { silent = true, desc = 'Toggle TS Context' })
        end,
    },
}
