require("url-open").setup({
    -- default will open url with default browser of your system or you can choose your browser like this
    -- open_app = "micorsoft-edge-stable",
    -- google-chrome, firefox, micorsoft-edge-stable, opera, brave, vivaldi
    open_app = "default",
    open_only_when_cursor_on_url = true,
    highlight_url = {
        all_urls = {
            enabled = true,
            fg = "#21d5ff", -- nil will use default color
            bg = nil, -- transparent
            underline = true,
        },
        cursor_move = {
            enabled = true,
            fg = "#199eff", -- nil will use default color
            bg = nil, -- transparent
            underline = true,
        },
    },
    deep_pattern = false,
    extra_patterns = { },
})
