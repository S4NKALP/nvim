local telescope = require('telescope')
local fb_actions = require('telescope').extensions.file_browser.actions
telescope.setup({
    file_ignore_patterns = { '%.git/.' },
    defaults = {
        preview = {
            treesitter = false,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = 'smart_case', -- or "ignore_case" or "respect_case"
        },

        file_browser = {
            theme = 'ivy',
            hijack_netrw = true,
            mapping = {
                ['i'] = {
                    ['<A-c>'] = fb_actions.create,
                    ['<A-r>'] = fb_actions.rename,
                    ['<A-d>'] = fb_actions.remove,
                    ['<A-h>'] = fb_actions.toggle_hidden,
                },
                ['n'] = {
                    ['<A-c>'] = fb_actions.create,
                    ['<A-r'] = fb_actions.rename,
                    ['<A-d'] = fb_actions.remove,
                    ['<A-h'] = fb_actions.toggle_hidden,
                },
            },
        },
        undo = {
            use_delta = true,
            use_custom_command = nil,
            side_by_side = true,
            vim_diff_opts = {
                ctxlen = vim.o.scrolloff * 2,
            },
            entry_format = 'state #$ID, $STAT, $TIME',
            -- time_format = '%d %b %H:%M',
            saved_only = false,
            layout_strategy = 'vertical',
            layout_config = {
                preview_height = 0.7,
            },
            mapping = {
                i = {
                    ['<S-cr>'] = require('telescope-undo.actions').yank_additions,
                    ['<C-cr>'] = require('telescope-undo.actions').yank_deletions,
                    ['<cr>'] = require('telescope-undo.actions').restore,
                },
            },
        },
    },
    borderchars = {
        prompt = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
        results = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
    },
})
telescope.load_extension('ui-select')
telescope.load_extension('file_browser')
-- telescope.load_extension("refactoring")
telescope.load_extension('notify')
telescope.load_extension('undo')
