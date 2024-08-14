return {
    {
        'iamcco/markdown-preview.nvim',
        build = 'cd app && yarn install',
        ft = { 'markdown' },
        keys = {
            {
                '<leader>mp',
                '<cmd>MarkdownPreviewToggle<CR>',
                { desc = 'toggle markdown preview', noremap = true },
            },
        },
    },
}
