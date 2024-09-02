return {
    {
        "craftzdog/solarized-osaka.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            transparent = true,
        },
    },
    {
        "0xstepit/flow.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("flow").setup({
                transparent = true,
            })
        end,
    },
    {
        "xero/evangelion.nvim",
        lazy = false,
        priority = 1000,
    }
}
