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
        })

        -- Custom snippets
        local ls = require("luasnip")

        local snip = ls.snippet
        local node = ls.snippet_node
        local text = ls.text_node
        local insert = ls.insert_node
        local func = ls.function_node
        local choice = ls.choice_node
        local dynamicn = ls.dynamic_node

        ls.add_snippets("markdown", {
            snip("splt", {
                text({"$$", "\\begin{split}", "\t& "}),
                insert(1),
                text({"\t", "\\end{split}", "$$"}),
            })
        })
    end
}
