return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local ts = require("nvim-treesitter")

        ts.setup({
            install_dir = vim.fn.stdpath("data") .. "/site",
        })

        local parsers = {
            "bash", "c", "cpp", "css", "diff", "dockerfile", "gitcommit",
            "html", "javascript", "json", "latex", "lua", "luadoc",
            "markdown", "markdown_inline", "perl", "python", "query", "regex",
            "rust", "toml", "tsx", "typescript", "vim", "vimdoc", "yaml",
        }

        ts.install(parsers)

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                local ft = args.match
                local lang = vim.treesitter.language.get_lang(ft)
                if not lang then return end
                local ok = pcall(vim.treesitter.start, args.buf, lang)
                if not ok then return end
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.wo.foldmethod = "expr"
                vim.wo.foldlevel = 99
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
