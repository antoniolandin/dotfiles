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
                rope_autoimport = {
                    enabled = false,
                    memory = false,
                },
                rope_completion = {
                    enabled = false,
                },
                jedi_completion = {
                    enabled = true,
                    include_params = true,
                    fuzzy = false,
                    include_class_objects = true,
                    include_function_objects = true,
                },
                ruff = {
                    enabled = true,
                    lineLength = 150,
                },
                pycodestyle = { enabled = false },
                mccabe = { enabled = false },
                flake8 = { enabled = false },
                pylint = { enabled = false },
                pyflakes = { enabled = false },
            }
        }
    },
})

vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust_analyzer'] = {
            cargo = {
                allFeatures = true,
            },
        },
    }
})

vim.lsp.config('clangd', {
    cmd = {
        "clangd",
        "--fallback-style=webkit"
    }
})

vim.lsp.config('perlnavigator', {
    cmd = { "perlnavigator" },
    settings = {
        perlnavigator = {
            perlPath = 'perl',
            enableWarnings = true,
            perltidyProfile = "",
            perltidyEnabled = true,
            perlimportsTidyEnabled = false,
            perlcriticProfile = '',
            perlcriticEnabled = true,
        }
    }
})
