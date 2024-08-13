return {
    'nvimdev/dashboard-nvim',
      dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    event = 'VimEnter',
    config = function()
        require('dashboard').setup({
            theme = 'hyper',
            disable_move = false,
            shortcut_type = 'letter',
            change_to_vcs_root = true,
            hide = {
                statusline = true,
                tabline = false,
                winbar = false,
            },
            config = {
                header = {
                    '',

                    ' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
                    ' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
                    ' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
                    ' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
                    ' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
                    ' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
                    '',
                },
                weak_header = {
                    enable = false,
                    append = { ' Learn, Make, Explore! ' },
                },
                packages = { enable = true },
                project = { enable = true, limit = 8 },
                mru = { limit = 8 },
                shortcut ={
                    {
                        desc = '  Recent files',
                        group = 'Label',
                        action = 'Telescope oldfiles',
                        key = 'r',
                    },
                    {
                        desc = '  Find file',
                        group = 'Label',
                        action = 'Telescope find_files',
                        key = 'f',
                    },
                    {
                        desc = '  Find text',
                        group = 'Label',
                        action = 'Telescope live_grep',
                        key = 't',
                    },
                },
            },
        })
    end,
}
