return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- Solo se activa el módulo de imágenes (kitty): imágenes y fórmulas LaTeX en los .md
        image = {
            -- Resuelve los ![[imagen.png]] igual que obsidian.nvim (en imagenes/)
            resolve = function(path, src)
                local ok, api = pcall(require, "obsidian.api")
                if not ok then
                    return nil
                end
                local is_note_ok, is_note = pcall(api.path_is_note, path)
                if is_note_ok and is_note then
                    return api.resolve_attachment_path(src)
                end
            end,
            img_dirs = { "imagenes" }, -- por si lo anterior no encuentra la imagen
            math = {
                enabled = true, -- ponlo a false si usas render-latex.nvim para las fórmulas
                latex = {
                    font_size = "normalsize", -- por defecto "Large": demasiado grande en línea
                },
            },
        },
    },
}
