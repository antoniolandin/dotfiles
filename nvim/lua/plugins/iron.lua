return {
    'Vigemus/iron.nvim',
    main = "iron.core",
    config = function()
        local iron = require("iron.core")
        local view = require("iron.view")

        iron.setup({
            config = {
                scratch_repl = true,
                repl_open_cmd = view.split.vertical.botright(0.40), -- Abre a la derecha, 40% de ancho

                repl_definition = {
                    python = {
                        command = { "ipython", "--no-autoindent", "--no-confirm-exit" },
                        format = require("iron.fts.common").bracketed_paste_python
                    }
                }
            },

            keymaps = {
                send_motion = "<leader>e",

                visual_send = "<leader>e",

                send_file = "<leader>ef",
                send_line = "<leader>ee",
                send_mark = "<leader>em",         -- Enviar marca
                send_until_cursor = "<leader>eu", -- Desde el inicio hasta el cursor

                cr = "<leader>i<cr>",             -- Enviar retorno de carro (Enter)
                interrupt = "<leader>ii",         -- Interrumpir (Ctrl+C)
                exit = "<leader>iq",              -- Salir del REPL
                clear = "<leader>il",             -- Limpiar pantalla
            },

            highlight = {
                italic = true
            },
            ignore_blank_lines = true,
        })
    end,
    keys = {
        { "<leader>is", "<cmd>IronRepl<cr>",    desc = "Iniciar REPL" },
        { "<leader>ir", "<cmd>IronRestart<cr>", desc = "Reiniciar REPL" },
        { "<leader>if", "<cmd>IronFocus<cr>",   desc = "Foco al REPL" },
        { "<leader>ih", "<cmd>IronHide<cr>",    desc = "Ocultar REPL" },
    },
}
