return {
  "iurimateus/luasnip-latex-snippets.nvim",
  -- vimtex isn't required if using treesitter
  requires = { "L3MON4D3/LuaSnip"},
  config = function()
    require'luasnip-latex-snippets'.setup({
        use_treesitter = true,
        allow_on_markdown = true
    })
    -- or setup({ use_treesitter = true })
    require("luasnip").config.setup { enable_autosnippets = true }
  end,
}
