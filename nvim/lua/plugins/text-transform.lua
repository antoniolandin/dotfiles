return {
    "chenasraf/text-transform.nvim",
    -- stable version
    version = "*", -- or: tag = "stable"
    -- dev version
    -- branch = "develop",
    -- Optional - for Telescope popup
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function ()
        require("text-transform").setup({})
    end
}
