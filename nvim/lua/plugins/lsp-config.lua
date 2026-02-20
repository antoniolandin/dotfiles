return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "pylsp", "ruff", "ts_ls", "lua_ls", "bashls", "clangd", "jsonls", "rust_analyzer", "perlnavigator", "texlab", "ltex" }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
