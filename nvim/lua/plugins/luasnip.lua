return {
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp",
    dependencies = {
    "rafamadriz/friendly-snippets",
    "benfowler/telescope-luasnip.nvim",
  },
    config = function()
        -- Config
        require("luasnip").config.setup({
            load_ft_func = require("luasnip.extras.filetype_functions").extend_load_ft({
	            markdown = {"latex", "tex"}
            }),
            enable_autosnippets = true
        })

        -- Custom snippets
        local ls = require("luasnip")

        ls.add_snippets("markdown", require("snippets.markdown"))
    end
}
