-- LSP Configuration & Plugins
return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
                event = "LspAttach",
            },
            "RRethy/vim-illuminate",
            "hrsh7th/cmp-nvim-lsp",
            "stevearc/conform.nvim",
            "m-demare/hlargs.nvim"
        },
        config = function()
            -- Set up Mason before anything else
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ruff",
                    "bashls",
                    "clangd",
                    "jsonls",
                    "ts_ls",
                    "eslint"
                },
                automatic_installation = true,
            })

            -- Quick access via keymap
            require("helpers.keys").map("n", "<leader>M", "<cmd>Mason<cr>", "Show Mason")

            -- Turn on LSP status information
            require("fidget").setup()

            -- Turn on hlargs
            require('hlargs').setup({
                color = '#d9d28c',
            })

            -- Set up cool signs for diagnostics
            local signs = { Error = " ", Warn = " ", Hint = "󰌵 ", Info = " " }
            for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
            end

            -- Diagnostic config
            local config = {
                virtual_text = true,
                signs = {
                    active = signs,
                },
                update_in_insert = false,
                underline = true,
                severity_sort = true,
                float = {
                    focusable = true,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            }

            vim.diagnostic.config(config)

            -- Keymaps for diagnostics
            vim.keymap.set("n", "ge", vim.diagnostic.goto_next)
            vim.keymap.set("n", "gE", vim.diagnostic.goto_prev)

            -- This function gets run when an LSP connects to a particular buffer.
            local on_attach = function(client, bufnr)
                local lsp_map = require("helpers.keys").lsp_map

                lsp_map("<leader>lr", vim.lsp.buf.rename, bufnr, "Rename symbol")
                lsp_map("<leader>la", vim.lsp.buf.code_action, bufnr, "Code action")
                lsp_map("<leader>ld", vim.lsp.buf.type_definition, bufnr, "Type definition")
                lsp_map("<leader>ls", require("telescope.builtin").lsp_document_symbols, bufnr, "Document symbols")

                lsp_map("gd", vim.lsp.buf.definition, bufnr, "Goto Definition")
                lsp_map("gr", require("telescope.builtin").lsp_references, bufnr, "Goto References")
                lsp_map("gI", vim.lsp.buf.implementation, bufnr, "Goto Implementation")
                lsp_map("K", vim.lsp.buf.hover, bufnr, "Hover Documentation")
                lsp_map("gD", vim.lsp.buf.declaration, bufnr, "Goto Declaration")

                require("illuminate").on_attach(client)
            end

            -- formatter options
            require("conform").setup({
                formatters_by_ft = {
                    lua = { "stylua" },
                    -- Conform will run multiple formatters sequentially
                    python = { "isort", "black" },
                    -- You can customize some of the format options for the filetype (:help conform.format)
                    rust = { "rustfmt", lsp_format = "fallback" },
                    -- Conform will run the first available formatter
                    javascript = { "prettierd", "prettier", stop_after_first = true },
                },
            })


            -- format on save
            vim.api.nvim_create_autocmd("BufWritePre", {
                pattern = "*",
                callback = function(args)
                    require("conform").format({ bufnr = args.buf })
                end,
            })

            -- create format command
            vim.api.nvim_create_user_command("Format", function(args)
                local range = nil
                if args.count ~= -1 then
                    local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
                    range = {
                        start = { args.line1, 0 },
                        ["end"] = { args.line2, end_line:len() },
                    }
                end
                require("conform").format({ async = true, lsp_format = "fallback", range = range })
            end, { range = true })

            -- bind format command
            vim.api.nvim_set_keymap('n', '<leader>ft', "<cmd>Format<cr>", { noremap = true, silent = true })

            -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
            capabilities.offsetEncoding = { "utf-16" }

            -- Lua
            require("lspconfig")["lua_ls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
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
                },
            })

            require('lspconfig')["ruff"].setup({
                init_options = {
                    settings = {
                        -- Ruff language server settings go here
                        organizeImports = true
                    }
                }
            })

            -- Bash
            require("lspconfig")["bashls"].setup({
                on_attach = on_attach,
                capabilities = capabilities
            })

            -- Clangd
            require("lspconfig")["clangd"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--background-index",
                    "-j=12",
                    "--clang-tidy",
                    "--fallback-style=webkit",
                    "--clang-tidy-checks=*",
                    "--all-scopes-completion",
                    "--cross-file-rename",
                    "--completion-style=detailed",
                    "--header-insertion-decorators",
                    "--pch-storage=memory",
                }
            })

            -- Jsonls
            require("lspconfig")["jsonls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
                init_options = {
                    provideFormatter = true,
                },
            })

            require("lspconfig")["ts_ls"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

            require("lspconfig")["eslint"].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })

        end,
    },
}
