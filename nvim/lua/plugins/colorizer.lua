return {
    'brenoprata10/nvim-highlight-colors',
    opts = {
        enable_ansi = true,
        enable_named_colors = false
    },
    config = function()
        vim.o.termguicolors = true
    end,
}
