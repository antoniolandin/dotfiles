return {
    "lervag/vimtex",
    lazy = false,
    config = function()
        -- 1. Ajustes visuales básicos
        vim.api.nvim_create_autocmd({ "FileType" }, {
            group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
            pattern = { "bib", "tex" },
            callback = function() vim.wo.conceallevel = 0 end,
        })

        -- 2. Configuración Vimtex
        vim.g.vimtex_mappings_disable = { ["n"] = { "K" } }
        vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
        vim.g.vimtex_syntax_enabled = 0
        vim.g.vimtex_pdf_output_dir = "build"
        vim.g.vimtex_compiler_method = 'latexmk'
        vim.g.vimtex_compiler_latexmk = {
            options = {
                "-shell-escape",
                "-verbose",
                "-file-line-error",
                "-synctex=1",
                "-interaction=nonstopmode",
            },
        }

        -- Configuración para engañar a Vimtex (usamos un "dummy" general)
        vim.g.vimtex_view_method = "general"
        vim.g.vimtex_view_general_viewer = "echo" -- No dejamos que vimtex lance nada, lo hacemos nosotros
        vim.g.vimtex_view_automatic = 0           -- Desactivamos el auto de Vimtex para controlarlo manualmente

        -- ============================================================
        -- LÓGICA DE GESTIÓN DE TDF
        -- ============================================================
        local view_suffix = ".view.pdf"

        -- Función para preparar el PDF de forma SEGURA (Atómica)
        local function prepare_view_pdf()
            if not vim.b.vimtex then return nil end

            local output_dir = vim.g.vimtex_pdf_output_dir or vim.b.vimtex.root
            local real_pdf = output_dir .. "/" .. vim.b.vimtex.name .. ".pdf"
            local view_pdf = output_dir .. "/" .. vim.b.vimtex.name .. view_suffix

            -- Solo procedemos si el PDF real existe y tiene contenido
            if vim.fn.getfsize(real_pdf) > 1000 then
                -- Usamos MV (mover). Esto es atómico.
                -- El archivo viejo desaparece y aparece el nuevo instantáneamente.
                -- tdf se cerrará solo al detectar esto, lo cual es lo que queremos controlar.
                local cmd = string.format("cp '%s' '%s.tmp' && mv '%s.tmp' '%s'",
                    real_pdf, view_pdf, view_pdf, view_pdf)
                vim.fn.system(cmd)
                return vim.fn.fnamemodify(view_pdf, ":p")
            end
            return nil
        end

        -- Función para matar y revivir tdf
        local function restart_tdf()
            local pdf_path = prepare_view_pdf()
            if not pdf_path then return end

            -- 1. Cerramos cualquier instancia previa de tdf
            vim.fn.system({ "kitty", "@", "close-window", "--match", "title:tdf" })

            -- 2. Esperamos un instante minúsculo para que Kitty procese el cierre
            vim.defer_fn(function()
                vim.fn.system({
                    "kitty", "@", "kitten", "tdf_handler.py", pdf_path
                })
            end, 100) -- 100ms de retraso para asegurar estabilidad
        end

        local au_group = vim.api.nvim_create_augroup("vimtex_tdf_restart", { clear = true })

        -- EVENTO: COMPILACIÓN EXITOSA
        vim.api.nvim_create_autocmd("User", {
            group = au_group,
            pattern = "VimtexEventCompileSuccess",
            callback = restart_tdf,
        })

        -- EVENTO: AL ABRIR EL ARCHIVO (Primera vez)
        vim.api.nvim_create_autocmd("User", {
            group = au_group,
            pattern = "VimtexEventInit", -- O VimtexEventCompileStarted
            callback = function()
                -- Solo si ya existe un PDF compilado previamente
                local output_dir = vim.g.vimtex_pdf_output_dir or "build"  -- Ajusta si usas otra ruta
                local name = vim.fn.expand("%:t:r")                        -- Nombre del archivo sin extensión
                local pdf = output_dir .. "/" .. name .. ".pdf"
                if vim.fn.filereadable(pdf) == 1 then
                    restart_tdf()
                end
            end,
        })

        -- EVENTO: CERRAR TODO AL SALIR
        vim.api.nvim_create_autocmd("VimLeave", {
            group = au_group,
            callback = function()
                vim.fn.system({ "kitty", "@", "close-window", "--match", "title:tdf" })
            end,
        })
    end,
}
