return {
    -- Syntax highlightings
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = 'VeryLazy',
        cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            { 'windwp/nvim-ts-autotag', ft = { 'html', 'xml', 'tsx' }, opts = {} },
        },
        config = function()
            require('nvim-ts-autotag').setup()
            require('nvim-treesitter.configs').setup({
                indent = {
                    enable = true,
                    disable = { 'ruby' },
                },
                ensure_installed = {
                    'vim',
                    'vimdoc',
                    'markdown',
                    'markdown_inline',
                    'bash',
                    'c',
                    'java',
                    'javascript',
                    'typescript',
                    'tsx',
                    'json',
                    'html',
                    'css',
                    'scss',
                    'lua',
                    'luadoc',
                    'diff',
                    'gitcommit',
                    'python',
                    'liquid',
                },
                auto_install = true,
                highlight = {
                    enable = true,
                    disable = function(_, buf)
                        local line_count = vim.api.nvim_buf_line_count(buf)
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))

                        -- vim.notify('stats: ' .. vim.inspect(stats))

                        -- if file is at least 10k and the average bytes per line is > 250, then disable treesitter
                        if ok and stats and (stats.size > (10 * 1024)) and (stats.size / line_count) > 250 then
                            vim.notify(
                                'Disabling treesitter, bytes: '
                                    .. stats.size
                                    .. ', lines: '
                                    .. line_count
                                    .. ', bytes / lines: '
                                    .. math.floor(stats.size / line_count)
                            )
                            return true
                        end
                        return false
                    end,
                    -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
                    --  If you are experiencing weird indenting issues, add the language to
                    --  the list of additional_vim_regex_highlighting and disabled languages for indent.
                    additional_vim_regex_highlighting = { 'ruby' },
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = '<C-space>',
                        node_incremental = '<C-space>',
                        scope_incremental = false,
                        node_decremental = '<bs>',
                    },
                },
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
                    move = {
                        enable = true,
                        -- don't include classes to not conflict with conflicts in a diff
                        -- (LazyVim has some clever code but i don't think we need it right now)
                        -- goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer', [']a'] = '@parameter.inner' },
                        -- goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer', [']A'] = '@parameter.inner' },
                        -- goto_previous_start = { ['[f'] = '@function.outer', ['[c'] = '@class.outer', ['[a'] = '@parameter.inner' },
                        -- goto_previous_end = { ['[F'] = '@function.outer', ['[C'] = '@class.outer', ['[A'] = '@parameter.inner' },
                        goto_next_start = { [']f'] = '@function.outer', [']a'] = '@parameter.inner' },
                        goto_next_end = { [']F'] = '@function.outer', [']A'] = '@parameter.inner' },
                        goto_previous_start = { ['[f'] = '@function.outer', ['[a'] = '@parameter.inner' },
                        goto_previous_end = { ['[F'] = '@function.outer', ['[A'] = '@parameter.inner' },
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
        event = 'VeryLazy',
        config = function()
            require('treesitter-context').setup({ mode = 'cursor', max_lines = 3 })
        end,
    },
}
