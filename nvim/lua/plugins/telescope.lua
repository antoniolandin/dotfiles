return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = {
        defaults = {
            layout_config = {
                horizontal = {
                    preview_cutoff = 100,
                    -- preview_width = 0.5,
                },
            },
        },
    }
}
