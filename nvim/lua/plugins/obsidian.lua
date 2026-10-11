return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",    -- última versión publicada
    ft = "markdown",
    cmd = "Obsidian", -- para que los keymaps funcionen también fuera de un .md
    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
        legacy_commands = false, -- solo la sintaxis nueva `:Obsidian <subcomando>`
        workspaces = {
            {
                name = "universidad",
                path = "~/Drive/notas",
            },
        },

        -- Notas nuevas en la raíz del vault (sin notes_subdir = raíz)
        new_notes_location = "notes_subdir",

        -- Nombre de las notas: <número>-<título-con-tildes>, p. ej. '1657296016-mi-nota-nueva'.
        -- Sin título: <número>-<4 mayúsculas aleatorias>, p. ej. '1657296016-ABCD'.
        ---@param title string|?
        ---@return string
        note_id_func = function(title)
            local suffix = ""
            if title ~= nil and vim.trim(title) ~= "" then
                -- title_to_slug conserva tildes y eñes (antes se perdían con gsub)
                suffix = require("obsidian.builtin").title_to_slug(title)
            else
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            return tostring(os.time()) .. "-" .. suffix
        end,

        attachments = {
            folder = "imagenes", -- donde :Obsidian paste_img guarda las imágenes
        },
        picker = {
            name = "telescope.nvim",
        },
        cache = {
            enabled = true, -- quick_switch también busca por alias
        },
        ui = {
            enable = false, -- el renderizado lo hace render-markdown (ojo: `enable`, no `enabled`)
        },
    },
}
