-- Header
local function header()
    local banner_small = {
        '                                                    ',
        '                                                    ',
        '                                                    ',
        ' ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
        ' ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
        ' ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
        ' ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
        ' ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
        ' ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
        '                                                    ',
        '         With experience comes perspective          ',
    }

    return banner_small
end
-- Footer
local function footer()
    local version = vim.version()
    local print_version = 'v' .. version.major .. '.' .. version.minor .. '.' .. version.patch
    local stats = require('lazy').stats()
    local plugins_count = stats.loaded .. '/' .. stats.count
    local ms = math.floor(stats.startuptime + 0.5)
    local time = vim.fn.strftime('%H:%M:%S')
    local date = vim.fn.strftime('%d.%m.%Y')
    local line1 = ' ' .. plugins_count .. ' plugins loaded in ' .. ms .. 'ms'
    local line2 = '󰃭 ' .. date .. '  ' .. time
    local line3 = ' ' .. print_version

    -- Calculate padding for centering lines
    local line1_width = vim.fn.strdisplaywidth(line1)
    local line2_padding = math.max(0, math.floor((line1_width - vim.fn.strdisplaywidth(line2)) / 2))
    local line3_padding = math.max(0, math.floor((line1_width - vim.fn.strdisplaywidth(line3)) / 2))

    -- Apply padding to lines
    line2 = string.rep(' ', line2_padding) .. line2
    line3 = string.rep(' ', line3_padding) .. line3

    return {
        ' ',
        line1,
        line2,
        line3,
    }
end

return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        dashboard.section.header.val = header()
        dashboard.section.footer.val = footer()

        -- Menu
        -- TODO: Add projects and Frecency?
        dashboard.section.buttons.val = {
            dashboard.button('e', '  New file', ':ene <BAR> startinsert<CR>'),
            dashboard.button('f', '  Find files', '<cmd>Telescope find_files<CR>'),
            dashboard.button('t', '󰊄  Find text', '<cmd>Telescope live_grep<CR>'),
            dashboard.button('r', '󰔠  Recent files', '<cmd>Telescope oldfiles<CR>'),
            dashboard.button('p', '󱠏  Projects', '<cmd>Telescope projects<CR>'),
            dashboard.button('c', '  Config', '<cmd>e $MYVIMRC<CR>'),
            dashboard.button('l', '  Plugins', '<cmd>Lazy<CR>'),
            dashboard.button('q', '  Quit', '<cmd>qa<CR>'),
        }

        alpha.setup(dashboard.config)
        -- Update the footer after all plugins are fully loaded
        vim.api.nvim_create_autocmd('User', {
            pattern = 'LazyVimStarted',
            callback = function()
                dashboard.section.footer.val = footer()
                pcall(vim.cmd, 'AlphaRedraw')
            end,
        })
    end,
}
