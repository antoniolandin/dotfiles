-- Format on save
vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            completion = {
                callSnippet = "Replace",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    }
})

vim.lsp.config('pylsp', {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { 'W391', 'W503' },
                    maxLineLength = 150
                },
                mccabe = {
                    enabled = false
                }
            }
        }
    },
})
