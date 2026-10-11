-- Format on save (solo en buffers con LSP attached)
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("LspFormatOnSave", { clear = true }),
    callback = function(args)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
                vim.lsp.buf.format({ bufnr = args.buf })
            end,
        })
    end,
})

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
    capabilities = {
        offsetEncoding = { "utf-16" },
    },
    settings = {
        pylsp = {
            signature = { formatter = false },
            plugins = {
                jedi_completion = {
                    enabled = true,
                    include_params = true,
                    fuzzy = false,
                    include_class_objects = true,
                    include_function_objects = true,
                },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                pycodestyle = { enabled = false },
                pyflakes = { enabled = false },
                mccabe = { enabled = false },
                flake8 = { enabled = false },
                pylint = { enabled = false },
                pydocstyle = { enabled = false },
                rope_autoimport = { enabled = false },
                rope_completion = { enabled = false },
            }
        }
    },
})

vim.lsp.config("ruff", {
    init_options = {
        settings = {
            lineLength = 150,
        },
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

vim.lsp.enable({
    "lua_ls",
    "pylsp",
    "rust_analyzer",
    "clangd",
    "perlnavigator",
})
