return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        cond = vim.fn.executable('cmake') == 1,
    },

    config = function()
        require('telescope').setup({
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
            },

            defaults = {
                layout_config = {
                    horizontal = {
                        preview_cutoff = 0,
                    },
                },
            },
        })
        -- Enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')
    end,
}
