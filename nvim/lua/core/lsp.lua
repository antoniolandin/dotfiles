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
    capabilities = {
        offsetEncoding = { "utf-16" },
    },
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

local words = { "Dummy", "Ina" }
local dummys_diccionario = {}
for _, word in ipairs(words) do
    for i = 0, 200 do
        table.insert(dummys_diccionario, word .. i)
    end
end

-- Solo para comprobar que funciona, imprimimos el último:
print(dummys_diccionario[#dummys_diccionario]) -- Debería imprimir Ina200
vim.lsp.config('ltex', {
    settings = {
        ltex = {
            language = "es",
            dictionary = {
                ["es"] = dummys_diccionario
            }
        },
        hiddenFalsePositives = {
            ["es"] = {
                "Dummy1"
            }
        }
    }
})
