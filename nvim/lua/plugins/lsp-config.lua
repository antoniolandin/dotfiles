return {
    "mason-org/mason-lspconfig.nvim",
    opts = {
        ensure_installed = { "pylsp", "ts_ls", "lua_ls", "bashls", "clangd", "jsonls" }
    },
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
}
