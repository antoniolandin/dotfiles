return{{
	"AlphaTechnolog/pywal.nvim",
	config = function()
		require("pywal").setup()
        vim.cmd[[colorscheme pywal]]
	end,	
},
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
  opts = {},
}
}
