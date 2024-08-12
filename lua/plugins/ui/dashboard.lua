local dashboard = require('dashboard')
local icons = require('lib.icons')

dashboard.setup({
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
      header = { '',

                ' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
                ' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
                ' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
                ' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
                ' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
                ' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
                '',},
        week_header = {
            enable = false,
            append = { '', icons.ui.Circle .. ' Learn, Make, Explore! ' .. icons.ui.Circle },
        },
        packages = { enable = true },
        project = { enable = true, limit = 8 },
        mru = { limit = 8 },
        shortcut = {
            {
                desc = icons.ui.Package .. 'Mason',
                group = '@property',
                action = 'Mason',
                key = 'm',
            },
            {
                desc = icons.ui.Sleep .. 'Lazy',
                group = '@property',
                action = 'Lazy',
                key = 'l',
            },
            {
                desc = icons.documents.OpenFolder .. 'Files',
                group = 'Label',
                action = 'lua require("telescope").extensions.menufacture.find_files()',
                key = 'f',
            },
            {
                desc = icons.ui.Search .. 'Search',
                group = 'Label',
                action = 'lua require("telescope").extensions.menufacture.live_grep()',
                key = 'g',
            },
            {
                desc = icons.ui.Note .. 'Todo',
                group = 'Label',
                action = 'Tdo',
                key = 'd',
            },
            {
                desc = icons.ui.Power,
                group = 'Action',
                action = 'quit',
                key = 'q',
            },
        },
        footer = function()
            local info = {}
            local fortune = require("fortune").get_fortune()
            local footer = vim.list_extend(info, fortune)
            return footer
        end,
    },
})

-- Show dashboard when lazy closes
if vim.o.filetype == 'lazy' then
    vim.cmd.close()
    vim.api.nvim_create_autocmd('User', {
        pattern = 'DashboardLoaded',
        callback = function()
            require('lazy').show()
        end,
    })
end
