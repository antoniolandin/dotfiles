-- Custom snippets
local ls = require("luasnip")

local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

return {
    snip(
        {
            trig = "splt",
            snippetType = "autosnippet"
        },
        {
            text({ "$$", "\\begin{split}", "\t& " }),
            insert(1),
            text({ "", "\\end{split}", "$$" }),
        }
    ),
    snip(
        {
            trig = "mth",
            snippetType = "autosnippet"
        },
        {
            text({ "$$", "" }),
            insert(1),
            text({ "", "$$" })
        }
    ),
    snip(
        {
            trig = "cases",
            snippetType = "autosnippet"
        },
        {
            text({ "\\begin{cases}", "\t" }),
            insert(1),
            text({ "", "\\end{cases}" })
        }
    ),
    snip(
        {
            trig = "pmatrix",
            snippetType = "autosnippet"
        },
        {
            text({ "\\begin{pmatrix}", "\t" }),
            insert(1),
            text({ "", "\\end{pmatrix}" })
        }
    )
}
