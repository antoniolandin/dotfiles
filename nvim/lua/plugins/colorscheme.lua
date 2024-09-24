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
            require("flow").setup {
                transparent = true,
                mode = "bright",
                fluo_color = "pink",
                aggressive_spell = false,
            }
        end,
    },
    {
        "xero/evangelion.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("evangelion").setup({
                transparent = true,
            })
        end,
    },
    {
        "ray-x/aurora",
        lazy = false,
        priority = 1000,
        init = function()
            vim.g.aurora_transparent = true
        end,
    }
}
