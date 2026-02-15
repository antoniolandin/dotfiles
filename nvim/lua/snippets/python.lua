local ls = require("luasnip")

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s({ trig = "pginit", dscr = "Plantilla pygame" }, {
        t({
            "import pygame",
            "",
            "LARGO, ALTO = 800, 600",
            "BLANCO = (255, 255, 255)",
            "FPS = 60",
            "",
            "pygame.init()",
            "pantalla = pygame.display.set_mode((LARGO, ALTO))",
            'pygame.display.set_caption("'
        }),
        i(1, "Nombre del proyecto"),
        t({
            '")',
            "reloj = pygame.time.Clock()",
            "",
            "",
            "while True:",
            "\tfor evento in pygame.event.get():",
            "\t\tif evento.type == pygame.QUIT:",
            "\t\t\tpygame.quit()",
            "\t\t\texit()",
            "\t\telif evento.type == pygame.KEYDOWN:",
            "\t\t\tif evento.key == pygame.K_q:",
            "\t\t\t\tpygame.quit()",
            "\t\t\t\texit()",
            "",
            "\t# RENDER",
            "\tpantalla.fill(BLANCO)",
            ""
        }),
        i(2),
        t({
            "",
            "\tpygame.display.flip()",
            "",
            "\treloj.tick(FPS)"
        }),
        i(0)
    }),
    s("cl", {
        t({ "# %%", "" }),
        i(1),
        t({ "", "# %%" }),
        i(0)
    }),
}
