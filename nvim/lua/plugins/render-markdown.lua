return {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {},
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite,
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons,
    config = function()
    require('render-markdown').setup({
        latex = { enabled = false },
        win_options = {
            conceallevel = { rendered = 2 },
        },
    })
    end
}



