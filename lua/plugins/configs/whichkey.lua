local which_key = require('which-key')
local icons = require('lib.icons')

local setup = {
    preset = 'helix',
    plugins = {
        marks = true,
        registers = true,
        spelling = {
            enabled = true,
            suggestions = 30,
        },
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
    icons = {
        breadcrumb = icons.ui.ArrowOpen,
        separator = icons.ui.Arrow,
        group = '',
        keys = {
            Space = icons.ui.Rocket,
        },
        rules = false, -- enable auto icon rules
    },
    show_help = false,
    show_keys = true,
    triggers = {
        { '<auto>', mode = 'nixsotc' },
        { '<leader>', mode = { 'n', 'v' } },
    },
}

local n_mappings = {
    mode = 'n',

    { '<leader>b', group = ' Debug' },
    { '<leader>bO', '<cmd>DapStepOut<cr>', desc = 'Out' },
    { '<leader>bR', '<cmd>DapRestartFrame<cr>', desc = 'Restart Frame' },
    { '<leader>bb', '<cmd>DapToggleBreakpoint<cr>', desc = 'Breakpoint' },
    { '<leader>bc', '<cmd>DapContinue<cr>', desc = 'Continue' },
    { '<leader>bi', '<cmd>DapStepInto<cr>', desc = 'Into' },
    { '<leader>bl', "<cmd>lua require'dap'.run_last()<cr>", desc = 'Last' },
    { '<leader>bo', '<cmd>DapStepOver<cr>', desc = 'Over' },
    { '<leader>br', '<cmd>DapToggleRepl<cr>', desc = 'Repl' },
    { '<leader>bt', '<cmd>DapUIToggle<cr>', desc = 'Debugger' },
    { '<leader>bx', '<cmd>DapTerminate<cr>', desc = 'Exit' },

    { '<leader>c', group = ' Code' },
    { '<leader>a', '<cmd>Alternate<cr>', desc = 'Toggle Alternate' },
    { '<leader>cF', '<cmd>retab<cr>', desc = 'Fix Tabs' },
    { '<leader>cP', '<cmd>CccConvert<cr>', desc = 'Convert Color' },
    { '<leader>cR', '<cmd>ReloadConfig<cr>', desc = 'Reload Configs' },
    { '<leader>cc', '<cmd>CccHighlighterToggle<cr>', desc = 'Highlight Colors' },
    { '<leader>cd', '<cmd>RootDir<cr>', desc = 'Root Directory' },
    { '<leader>cf', group = 'Formate File' },
    { '<leader>ch', '<cmd>Hardtime toggle<cr>', desc = 'Hardtime' },
    { '<leader>cl', '<cmd>:g/^\\s*$/d<cr>', desc = 'Clean Empty Lines' },
    { '<leader>cm', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown Preview' },
    { '<leader>cn', '<cmd>Telescope notify<cr>', desc = 'Notifications' },
    { '<leader>co', '<cmd>Dashboard<cr>', desc = 'Dashboard' },
    { '<leader>cp', '<cmd>CccPick<cr>', desc = 'Pick Color' },
    { '<leader>cr', '<cmd>Telescope reloader<cr>', desc = 'Reload Module' },

    { '<leader>C', group = ' Comment' },
    { '<leader>Cb', '<cmd>CBccbox<CR>', desc = 'Comment Box' },
    { '<leader>Ct', '<cmd>CBllline<CR>', desc = 'Tiled line' },
    { '<leader>Cl', '<cmd>CBline<CR>', desc = 'Line' },
    { '<leader>Cm', '<cmd>CBllbox14<CR>', desc = 'Marked' },
    { '<leader>Cc', '<cmd>CBcatalog<CR>', desc = 'Catalog' },
    { '<leader>Cd', '<cmd>CBd<CR>', desc = 'Delete Comment Style' },

    { '<leader>d', group = ' Database' },
    { '<leader>du', '<cmd>DBUIToggle<cr>', desc = 'Toggle DB UI' },
    { '<leader>db', '<cmd>DBUIFindBuffer<cr>', desc = 'DB Find buffer' },
    { '<leader>dr', '<cmd>DBUIRenameBuffer<cr>', desc = 'DB Rename buffer' },
    { '<leader>dl', '<cmd>DBUILastQueryInfo<cr>', desc = 'DB Last query' },

    { '<leader>e', group = ' Edit' },
    { '<leader>ea', '<cmd>b#<cr>', desc = 'Alternate File' },
    { '<leader>ec', '<cmd>e $MYVIMRC<cr>', desc = 'Config' },
    {
        '<leader>eC',
        '<cmd>lua require("telescope.builtin").find_files({cwd = vim.fn.stdpath("config")})<cr>',
        desc = 'Config Dir',
    },
    { '<leader>ee', ':Neotree toggle float<CR>', silent = true, desc = 'Float File Explorer' },
    { '<leader>eE', ':Neotree toggle left<CR>', silent = true, desc = 'Left File Explorer' },
    { '<leader>ef', '<cmd>Telescope file_browser<cr>', desc = 'File Browser' },
    { '<leader>em', '<cmd>e README.md<cr>', desc = 'Readme' },
    { '<leader>en', '<cmd>new<cr>', desc = 'New File' },
    { '<leader>ex', '<Cmd>!chmod +x %<CR>', desc = 'Make Current File Executable' },
    { '<leader>es', '<Cmd>w<CR>', desc = 'Save File' },
    { '<leader>ed', '<Cmd>!rm %<CR>', desc = 'Delete File' },
    { '<leader>eD', '<Cmd>!rm %<CR><Cmd>bdelete<CR>', desc = 'Delete File and Buffer' },

    { '<leader>f', group = ' Find' },
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find Files (CWD)' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Live Grep' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Find Help' },
    { '<leader>fo', '<cmd>Telescope oldfiles<cr>', desc = 'Old Recent Files' },
    { '<leader>fm', '<cmd>Telescope marks<cr>', desc = 'Marks' },
    { '<leader>fH', '<cmd>Telescope highlights<cr>', desc = 'Find Highlight Groups' },
    { '<leader>fG', '<cmd>Telescope grep_string<cr>', desc = 'Grep String' },
    { '<leader>kk', '<cmd>Telescope keymaps<cr>', desc = 'Keymaps' },
    { '<leader>kc', '<cmd>Telescope commands<cr>', desc = 'Commands' },
    { '<leader>kh', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
    { '<leader>ks', '<cmd>Telescope search_history<cr>', desc = 'Search History' },
    { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Diagnostics' },
    { '<leader>fu', '<cmd>Telescope undo<cr>', desc = 'Undo History' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Buffers' },
    { '<leader>fq', '<cmd>Telescope quickfix<cr>', desc = 'Quickfix' },
    { '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>', desc = 'Fuzzy Find in File' },

    { '<leader>h', group = ' Help' },
    { '<leader>hh', '<cmd>Telescope help_tags<cr>', desc = 'Help Pages' },
    { '<leader>hi', 'vim.show_pos', desc = 'Inspect Position' },
    { '<leader>hk', '<cmd>Lspsaga hover_doc<cr>', desc = 'Hover Doc' },
    { '<leader>hm', '<cmd>Telescope man_pages<cr>', desc = 'Man Pages' },

    { '<leader>i', group = ' Insert' },
    { '<leader>iP', '<cmd>put %:p<cr>', desc = 'Absolute Path' },
    { '<leader>id', "<cmd>put =strftime('## %a, %d %b, %Y, %r')<cr>", desc = 'Date' },
    { '<leader>ie', '<cmd>Telescope symbols<cr>', desc = 'Emojis' },
    { '<leader>if', "<cmd>put =expand('%:t')<cr>", desc = 'File Name' },
    { '<leader>in', '<cmd>Nerdy<cr>', desc = 'Nerd Glyphs' },
    { '<leader>ip', '<cmd>put %<cr>', desc = 'Relative Path' },
    { '<leader>ir', '<cmd>Telescope registers<cr>', desc = 'Registers' },
    { '<leader>it', "<cmd>put =strftime('## %r')<cr>", desc = 'Time' },

    { '<leader>j', group = ' Jump' },
    {
        '<leader>jN',
        "<cmd>lua require('flash').jump({search = { forward = false, wrap = false, multi_window = false },})<cr>",
        desc = 'Search Backward',
    },
    { '<leader>jc', '*', desc = 'Word' },
    { '<leader>jd', '<cmd>FlashDiagnostics<cr>', desc = 'Diagnostics' },
    { '<leader>jf', '<cmd>Telescope jumplist<cr>', desc = 'Jumplist' },
    { '<leader>jh', '<C-o>', desc = 'Backward' },
    { '<leader>jj', "<cmd>lua require('flash').remote()<cr>", desc = 'Remote' },
    { '<leader>jk', "<cmd>lua require('flash').treesitter()<cr>", desc = 'Treesitter' },
    { '<leader>jl', '<C-i>', desc = 'Forward' },
    {
        '<leader>jn',
        "<cmd>lua require('flash').jump({search = { forward = true, wrap = false, multi_window = false },})<cr>",
        desc = 'Search Forward',
    },
    { '<leader>jp', "<cmd>lua require('flash').jump({continue = true})<cr>", desc = 'Previous Jump' },
    { '<leader>js', "<cmd>lua require('flash').jump()<cr>", desc = 'Search' },
    { '<leader>jt', "<cmd>lua require('flash').treesitter_search()<cr>", desc = 'Remote Treesitter' },
    {
        '<leader>jw',
        '<cmd>lua require("flash").jump({ pattern = vim.fn.expand("<cword>")})<cr>',
        desc = 'Current Word',
    },

    { '<leader>k', group = ' Keys' },
    { '<leader>kc', '<cmd>Telescope commands<cr>', desc = 'Commands' },
    { '<leader>kh', '<cmd>Telescope command_history<cr>', desc = 'Command History' },
    { '<leader>kk', '<cmd>Telescope keymaps<cr>', desc = 'Keymaps' },
    { '<leader>ks', '<cmd>Telescope search_history<cr>', desc = 'Search History' },
    { '<leader>kt', '<cmd>Screenkey<CR>', desc = 'Toggle keys' },

    { '<leader>l', group = ' LSP' },
    { '<leader>lF', '<cmd>Telescope lsp_references layout_strategy=vertical<cr>', desc = 'References' },
    { '<leader>lL', '<cmd>Lspsaga show_workspace_diagnostics<cr>', desc = 'Workspace Diagnostics' },
    { '<leader>lP', '<cmd>Telescope lsp_outgoing_calls<cr>', desc = 'Outgoing Calls' },
    { '<leader>lQ', '<cmd>LspRestart<cr>', desc = 'Restart LSP' },
    { '<leader>lR', '<cmd>Lspsaga project_replace<cr>', desc = 'Replace' },
    { '<leader>lS', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', desc = 'Workspace Symbols' },
    { '<leader>lT', '<cmd>Lspsaga goto_type_definition<cr>', desc = 'Goto Type Definition' },
    { '<leader>la', '<cmd>Lspsaga code_action<cr>', desc = 'Code Action' },
    { '<leader>ld', '<cmd>Lspsaga peek_definition<cr>', desc = 'Peek Definition' },
    { '<leader>lf', '<cmd>Lspsaga finder<cr>', desc = 'Finder' },
    { '<leader>lg', '<cmd>Lspsaga goto_definition<cr>', desc = 'Goto Definition' },
    { '<leader>lh', '<cmd>Lspsaga hover_doc<cr>', desc = 'Hover' },
    { '<leader>li', '<cmd>LspInfo<cr>', desc = 'LSP Info' },
    { '<leader>lj', '<cmd>Lspsaga diagnostic_jump_next<cr>', desc = 'Next Diagnostic' },
    { '<leader>lk', '<cmd>Lspsaga diagnostic_jump_prev<cr>', desc = 'Prev Diagnostic' },
    { '<leader>ll', '<cmd>Telescope diagnostics layout_strategy=vertical<cr>', desc = 'File Diagnostics' },
    { '<leader>lo', '<cmd>Lspsaga outline<cr>', desc = 'Outline' },
    { '<leader>lp', '<cmd>Telescope lsp_incoming_calls<cr>', desc = 'Incoming Calls' },
    { '<leader>lq', '<cmd>LspStop<cr>', desc = 'Stop LSP' },
    { '<leader>lr', '<cmd>Lspsaga rename<cr>', desc = 'Rename' },
    { '<leader>ls', '<cmd>Telescope lsp_document_symbols theme=get_ivy<cr>', desc = 'Document Symbols' },
    { '<leader>lt', '<cmd>Lspsaga peek_type_definition<cr>', desc = 'Peek Type Definition' },

    { '<leader>m', group = ' Misc' },
    {
        '<leader>ms',
        function()
            require('persistence').load()
        end,
        desc = 'Restore Session',
    },
    {
        '<leader>ml',
        function()
            require('persistence').load({ last = true })
        end,
        desc = 'Restore Last Session',
    },
    {
        '<leader>md',
        function()
            require('persistence').stop()
        end,
        desc = "Don't Save Current Session",
    },

    { '<leader>o', group = ' Options' },
    { '<leader>oc', '<cmd>Telescope colorscheme<cr>', desc = 'Colorscheme' },
    { '<leader>oh', '<cmd>Telescope highlights<cr>', desc = 'Highlight Colors' },
    { '<leader>on', '<cmd>set relativenumber!<cr>', desc = 'Relative Numbers' },
    { '<leader>oo', '<cmd>Telescope vim_options<cr>', desc = 'All Options' },

    { '<leader>p', group = ' ScreenShot' },
    { '<leader>py', '<cmd>CodeSnap<cr>', mode = 'x', desc = 'Save selected code snapshot into clipboard' },
    { '<leader>ps', '<cmd>CodeSnapSave<cr>', mode = 'x', desc = 'Save selected code snapshot in ~/Pictures' },
    {
        '<leaderp>h',
        '<cmd>CodeSnapHighlight<cr>',
        mode = 'x',
        desc = 'Highlight and snapshot selected code into clipboard',
    },
    { '<leader>pi', '<cmd>CodeSnapASCII<cr>', mode = 'x', desc = 'Save ASCII code snapshot into clipboard' },

    { '<leader>q', group = ' Quit' },
    { '<leader>qa', '<cmd>qall<cr>', desc = 'Quit All' },
    { '<leader>qc', '<cmd>bw<cr>', desc = 'Close Buffer' },
    { '<leader>qd', '<cmd>bdelete<cr>', desc = 'Delete Buffer' },
    { '<leader>qf', '<cmd>qall!<cr>', desc = 'Force Quit' },
    { '<leader>qo', ':%bdelete|b#|bdelete#<cr>', desc = 'Close Others' },
    { '<leader>qq', '<cmd>q<cr>', desc = 'Quit' },
    { '<leader>qs', '<C-w>c', desc = 'Close Split' },
    { '<leader>qw', '<cmd>wq<cr>', desc = 'Write and Quit' },

    { '<leader>r', group = ' Refactor' },
    {
        '<leader>rc',
        function()
            local file_name = vim.api.nvim_buf_get_name(0)
            local file_type = vim.bo.filetype

            if file_type == 'c' then
                vim.cmd(':terminal gcc ' .. file_name .. '; ./a.out ')
            elseif file_type == 'python' then
                vim.cmd(':terminal python ' .. file_name)
            elseif file_type == 'java' then
                vim.cmd(':terminal javac ' .. file_name .. '; java ' .. file_name)
            elseif file_type == 'lua' then
                vim.cmd(':terminal lua ' .. file_name)
                -- elseif file_type == 'js' then
                --     vim.cmd(':terminal node ' .. file_name)
                -- elseif file_type == 'rust' then
                --     vim.cmd(':terminal rustc ' .. file_name .. '; ./a.out ')
                -- elseif file_type == 'ts' then
                --     vim.cmd(':terminal tsc ' .. file_name .. '; node ' .. file_name)
            end
        end,
        desc = 'Code Runner',
    },
    {
        '<leader>rR',
        "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
        desc = 'Refactor Commands',
    },
    { '<leader>rS', "<cmd>lua require('spectre').open()<cr>", desc = 'Replace' },
    { '<leader>rb', "<cmd>lua require('spectre').open_file_search()<cr>", desc = 'Replace Buffer' },
    { '<leader>rd', '', desc = 'Go To Definition' },
    { '<leader>re', "<cmd>lua require('refactoring').refactor('Extract Block')<CR>", desc = 'Extract Block' },
    {
        '<leader>rf',
        "<cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
        desc = 'Extract To File',
    },
    { '<leader>rh', '', desc = 'List Definition Head' },
    { '<leader>ri', "<cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = 'Inline Variable' },
    { '<leader>rj', '', desc = 'Next Usage' },
    { '<leader>rk', '', desc = 'Previous Usage' },
    { '<leader>rl', '', desc = 'List Definition' },
    { '<leader>rn', '', desc = 'Swap Next' },
    { '<leader>rp', '', desc = 'Swap Previous' },
    { '<leader>rr', '', desc = 'Smart Rename' },
    { '<leader>rs', ':%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>', desc = 'Replace Word' },
    { '<leader>rv', "<cmd>lua require('refactoring').refactor('Extract Variable')<CR>", desc = 'Extract Variable' },
    { '<leader>rw', "<cmd>lua require('spectre').open_visual({select_word=true})<cr>", desc = 'Replace Word' },

    { '<leader>s', group = ' Split' },
    { '<leader>s+', '<cmd>resize +10<cr>', desc = 'Increase window height' },
    { '<leader>s-', '<cmd>vertical resize -20<cr>', desc = 'Decrease window width' },
    { '<leader>s/', '<C-w>s', desc = 'Split Below' },
    { '<leader>s=', '<cmd>vertical resize +20<cr>', desc = 'Increase window width' },
    { '<leader>sH', '<cmd>vertical resize -10<cr>', desc = 'Decrease window width' },
    { '<leader>sJ', '<cmd>resize -5<cr>', desc = 'Decrease window height' },
    { '<leader>sK', '<cmd>resize +5<cr>', desc = 'Increase window height' },
    { '<leader>sL', '<cmd>vertical resize +10<cr>', desc = 'Increase window width' },
    { '<leader>s\\', '<C-w>v', desc = 'Split Right' },
    { '<leader>s_', '<cmd>resize -10<cr>', desc = 'Decrease window height' },
    { '<leader>s`', '<C-w>p', desc = 'Previous Window' },
    { '<leader>sa', '<cmd>split<cr>', desc = 'Horizontal Split' },
    { '<leader>sc', '<cmd>tabclose<cr>', desc = 'Close Tab' },
    { '<leader>sf', '<cmd>tabfirst<cr>', desc = 'First Tab' },
    { '<leader>sh', '<C-w>h', desc = 'Move Left' },
    { '<leader>sj', '<C-w>j', desc = 'Move Down' },
    { '<leader>sk', '<C-w>k', desc = 'Move Up' },
    { '<leader>sl', '<C-w>l', desc = 'Move Right' },
    { '<leader>sp', '<cmd>NavigatorPrevious<cr>', desc = 'Previous Pane' },
    { '<leader>sq', '<C-w>c', desc = 'Close Split' },
    { '<leader>ss', '<cmd>vsplit<cr>', desc = 'Vertical Split' },

    { '<leader>t', group = ' Terminal' },
    { '<leader>t1', '<cmd>1ToggleTerm<cr>', desc = 'Toggle Terminal' },
    { '<leader>t2', '<cmd>2ToggleTerm<cr>', desc = 'Toggle Terminal' },
    { '<leader>th', '<cmd>Sterm<cr>', desc = 'Horizontal Terminal' },
    { '<leader>tv', '<cmd>Vterm<cr>', desc = 'Vertical Terminal' },
    { '<leader>tc', '<Cmd>close<CR>', desc = 'Hide Terminal' },

    { '<leader>u', group = ' Test' },
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

    { '<leader>v', group = ' Select' },
    { '<leader>vB', 'vab', desc = 'Around Bracket' },
    { '<leader>vP', 'vap', desc = 'Around Para' },
    { '<leader>vQ', 'vaq', desc = 'Around Quote' },
    { '<leader>vb', 'vib', desc = 'Bracket' },
    { '<leader>vp', 'vip', desc = 'Paragraph' },
    { '<leader>vq', 'viq', desc = 'Quote' },

    { '<leader>w', group = ' Writing' },
    { '<leader>wc', '<cmd>set spell!<cr>', desc = 'Spellcheck' },
    { '<leader>wF', ':SudaWrite<CR>', desc = 'Suda Write' },
    { '<leader>wf', "<cmd>lua require'utils'.sudo_write()<cr>", desc = 'Force Write' },
    { '<leader>wj', ']s', desc = 'Next Misspell' },
    { '<leader>wk', '[s', desc = 'Prev Misspell' },
    { '<leader>wq', '<cmd>wq<cr>', desc = 'Write and Quit' },
    { '<leader>ws', '<cmd>Telescope spell_suggest<cr>', desc = 'Suggestions' },
    { '<leader>wt', '<cmd>Twilight<cr>', desc = 'Twilight' },
    { '<leader>ww', '<cmd>w<cr>', desc = 'Write and Quit' },
    { '<leader>wz', '<cmd>ZenMode<cr>', desc = 'ZenMode' },
    { '<leader>x', '<cmd>x<cr>', desc = ' Save and Quit' },

    { '<leader>x', group = '󰁨 Diagnostics/Quickfix' },
    { '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Diagnostics (Trouble)' },
    { '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer Diagnostics (Trouble)' },
    { '<leader>xs', '<cmd>Trouble symbols toggle<cr>', desc = 'Symbols (Trouble)' },
    { '<leader>xS', '<cmd>Trouble lsp toggle<cr>', desc = 'LSP references/definitions/... (Trouble)' },
    { '<leader>xL', '<cmd>Trouble loclist toggle<cr>', desc = 'Location List (Trouble)' },
    { '<leader>xQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Quickfix List (Trouble)' },

    { '<leader>y', group = ' Yank' },
    {
        '<leader>yp',
        function()
            require('telescope').extensions.yank_history.yank_history({})
        end,
        desc = 'Open Yank History',
    },

    { '<leader>yP', '<cmd>CopyAbsolutePath<cr>', desc = 'Absolute Path' },
    { '<leader>ya', '<cmd>%y+<cr>', desc = 'Copy Whole File' },
    { '<leader>yf', '<cmd>CopyFileName<cr>', desc = 'File Name' },
    { '<leader>yg', '<cmd>lua require"gitlinker".get_buf_range_url()<cr>', desc = 'Copy Git URL' },
    { '<leader>yp', '<cmd>CopyRelativePath<cr>', desc = 'Relative Path' },
}

local v_mappings = {
    mode = 'v',

    { '<leader>c', group = ' Code' },
    { '<leader>cS', ':sort!<cr>', desc = 'Sort Desc' },
    { '<leader>ci', ':sort i<cr>', desc = 'Sort Case Insensitive' },
    { '<leader>cs', ':sort<cr>', desc = 'Sort Asc' },
    { '<leader>cu', ':!uniq<cr>', desc = 'Unique' },
    { '<leader>cx', "<esc><cmd>'<,'>SnipRun<cr>", desc = 'Run Code' },

    { '<leader>C', group = ' Comment' },
    { '<leader>Cb', '<cmd>CBccbox<CR>', desc = 'Comment Box' },
    { '<leader>Ct', '<cmd>CBllline<CR>', desc = 'Tiled line' },
    { '<leader>Cl', '<cmd>CBline<CR>', desc = 'Line' },
    { '<leader>Cm', '<cmd>CBllbox14<CR>', desc = 'Marked' },
    { '<leader>Cc', '<cmd>CBcatalog<CR>', desc = 'Catalog' },
    { '<leader>Cd', '<cmd>CBd<CR>', desc = 'Delete Comment Style' },

    { '<leader>j', group = ' Jump' },
    {
        '<leader>jN',
        "<cmd>lua require('flash').jump({search = { forward = false, wrap = false, multi_window = false },})<cr>",
        desc = 'Search Backward',
    },
    { '<leader>jd', '<cmd>FlashDiagnostics<cr>', desc = 'Diagnostics' },
    { '<leader>jj', "<cmd>lua require('flash').remote()<cr>", desc = 'Remote' },
    { '<leader>jk', "<cmd>lua require('flash').treesitter()<cr>", desc = 'Treesitter' },
    {
        '<leader>jn',
        "<cmd>lua require('flash').jump({search = { forward = true, wrap = false, multi_window = false },})<cr>",
        desc = 'Search Forward',
    },
    { '<leader>jp', "<cmd>lua require('flash').jump({continue = true})<cr>", desc = 'Previous Jump' },
    { '<leader>js', "<cmd>lua require('flash').jump()<cr>", desc = 'Search' },
    { '<leader>jt', "<cmd>lua require('flash').treesitter_search()<cr>", desc = 'Remote Treesitter' },
    {
        '<leader>jw',
        '<cmd>lua require("flash").jump({ pattern = vim.fn.expand("<cword>")})<cr>',
        desc = 'Current Word',
    },

    { '<leader>l', group = ' LSP' },
    { '<leader>la', desc = '<cmd><C-U>Lspsaga range_code_action<CR>' },

    { '<leader>r', group = ' Refactor' },
    {
        '<leader>re',
        "<esc><cmd>lua require('refactoring').refactor('Extract Function')<CR>",
        desc = 'Extract Function',
    },
    {
        '<leader>rf',
        "<esc><cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
        desc = 'Extract To File',
    },
    { '<leader>ri', "<esc><cmd>lua require('refactoring').refactor('Inline Variable')<CR>", desc = 'Inline Variable' },
    {
        '<leader>rr',
        "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
        desc = 'Refactor Commands',
    },
    {
        '<leader>rv',
        "<esc><cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
        desc = 'Extract Variable',
    },

    { '<leader>y', group = ' Yank' },
    { '<leader>yg', '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>', desc = 'Copy Git URL' },
}

local no_leader_mappings = {
    mode = 'n',
    { '<C-Down>', '<cmd>resize -10<cr>', desc = 'Decrease window height' },
    { '<C-Left>', '<cmd>vertical resize -10<cr>', desc = 'Decrease window width' },
    { '<C-Right>', '<cmd>vertical resize +10<cr>', desc = 'Increase window width' },
    { '<C-Up>', '<cmd>resize +10which_key.add(no_leader_mappings)<cr>', desc = 'Increase window height' },
    { '<C-f>', '<cmd>Telescope find_files<cr>', desc = 'Find Files' },
    { '<C-g>', '<cmd>Fterm lazygit<cr>', desc = 'Lazygit' },

    { '<C-h>', '<C-w>h', desc = 'Move Left' },
    { '<C-j>', '<C-w>j', desc = 'Move Down' },
    { '<C-k>', '<C-w>k', desc = 'Move Up' },
    { '<C-l>', '<C-w>l', desc = 'Move Right' },
    { '<C-\\>', '<C-w>p', desc = 'Previous Pane' },

    { '<S-tab>', '<cmd>bprevious<cr>', desc = 'Previous Buffer' },
    { '<tab>', '<cmd>bnext<cr>', desc = 'Next Buffer' },
    { '<S-h>', '<cmd>bprevious<cr>', desc = 'Previous Buffer' },
    { '<S-l>', '<cmd>bnext<cr>', desc = 'Next Buffer' },

    { 'K', '<cmd>Lspsaga hover_doc<cr>', desc = 'LSP Hover' },
    { 'Q', '<cmd>qall!<cr>', desc = 'Force Quit!' },
    { 'U', '<cmd>redo<cr>', desc = 'Redo' },

    { '[', group = ' Previous' },
    { '[B', '<cmd>bfirst<cr>', desc = 'First Buffer' },
    { '[b', '<cmd>bprevious<cr>', desc = 'Buffer' },
    { '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', desc = 'Diagnostic' },
    { '[e', 'g;', desc = 'Edit' },
    { '[g', '<cmd>Gitsigns prev_hunk<cr>', desc = 'Git Hunk' },
    { '[j', '<C-o>', desc = 'Jump' },

    { ']', group = ' Next' },
    { ']B', '<cmd>blast<cr>', desc = 'Buffer' },
    { ']b', '<cmd>bnext<cr>', desc = 'Buffer' },
    { ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', desc = 'Diagnostic' },
    { ']e', 'g,', desc = 'Edit' },
    { ']g', '<cmd>Gitsigns next_hunk<cr>', desc = 'Git Hunk' },
    { ']j', '<C-i>', desc = 'Jump' },

    { '<C-n>', '<Plug>(YankyCycleForward)' },
    { '<C-p>', '<Plug>(YankyCycleBackward)' },
    { 'y', '<Plug>(YankyYank)', mode = { 'n', 'x' }, desc = 'Yank text' },
    { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after cursor' },
    { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before cursor' },
    { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' }, desc = 'Put yanked text after selection' },
    { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' }, desc = 'Put yanked text before selection' },

    {
        '<C-S-Down>',
        ':call vm#commands#add_cursor_down(0, v:count1)<cr>',
        desc = 'Add Cursor Down',
        mode = { 'n' },
        noremap = true,
        silent = true,
    },
    {
        '<C-S-Up>',
        ':call vm#commands#add_cursor_up(0, v:count1)<cr>',
        desc = 'Add Cursor Up',
        mode = { 'n' },
        noremap = true,
        silent = true,
    },
    {
        '<M-S-j>',
        ':call vm#commands#add_cursor_down(0, v:count1)<cr>',
        desc = 'Add Cursor Down',
        mode = { 'n' },
        noremap = true,
        silent = true,
    },
    {
        '<M-S-k>',
        ':call vm#commands#add_cursor_up(0, v:count1)<cr>',
        desc = 'Add Cursor Down',
        mode = { 'n' },
        noremap = true,
        silent = true,
    },
    {
        '<M-d>',
        ':call vm#commands#ctrln(v:count1)<cr>',
        desc = 'Multi Edit Next',
        mode = { 'n' },
        noremap = true,
        silent = true,
    },
}

which_key.setup(setup)
which_key.add(n_mappings)
which_key.add(v_mappings)
which_key.add(no_leader_mappings)
