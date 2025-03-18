return {
    'brenoprata10/nvim-highlight-colors',
    config = function()
        vim.o.termguicolors = true
        require('nvim-highlight-colors').setup({
	        enable_ansi = true,
        })
    end,
}
