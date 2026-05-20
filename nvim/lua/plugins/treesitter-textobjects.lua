return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = { "BufReadPost", "BufNewFile" },
    init = function()
        vim.g.no_plugin_maps = true
    end,
    config = function()
        require("nvim-treesitter-textobjects").setup({
            select = {
                lookahead = true,
            },
            move = {
                set_jumps = true,
            },
        })

        local select = require("nvim-treesitter-textobjects.select")
        local move = require("nvim-treesitter-textobjects.move")
        local swap = require("nvim-treesitter-textobjects.swap")
        local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

        local select_maps = {
            ["a="] = { "@assignment.outer", "Select outer part of an assignment" },
            ["i="] = { "@assignment.inner", "Select inner part of an assignment" },
            ["l="] = { "@assignment.lhs", "Select left hand side of an assignment" },
            ["r="] = { "@assignment.rhs", "Select right hand side of an assignment" },
            ["aa"] = { "@parameter.outer", "Select outer part of a parameter/argument" },
            ["ia"] = { "@parameter.inner", "Select inner part of a parameter/argument" },
            ["a?"] = { "@conditional.outer", "Select outer part of a conditional" },
            ["i?"] = { "@conditional.inner", "Select inner part of a conditional" },
            ["al"] = { "@loop.outer", "Select outer part of a loop" },
            ["il"] = { "@loop.inner", "Select inner part of a loop" },
            ["af"] = { "@call.outer", "Select outer part of a function call" },
            ["if"] = { "@call.inner", "Select inner part of a function call" },
            ["am"] = { "@function.outer", "Select outer part of a method/function definition" },
            ["im"] = { "@function.inner", "Select inner part of a method/function definition" },
            ["ac"] = { "@class.outer", "Select outer part of a class" },
            ["ic"] = { "@class.inner", "Select inner part of a class" },
        }
        for lhs, spec in pairs(select_maps) do
            vim.keymap.set({ "x", "o" }, lhs, function()
                select.select_textobject(spec[1], "textobjects")
            end, { desc = spec[2] })
        end

        local move_maps = {
            goto_next_start = {
                ["]f"] = { "@call.outer", "Next function call start" },
                ["]m"] = { "@function.outer", "Next method/function def start" },
                ["]c"] = { "@class.outer", "Next class start" },
                ["]i"] = { "@conditional.outer", "Next conditional start" },
                ["]l"] = { "@loop.outer", "Next loop start" },
            },
            goto_next_end = {
                ["]F"] = { "@call.outer", "Next function call end" },
                ["]M"] = { "@function.outer", "Next method/function def end" },
                ["]C"] = { "@class.outer", "Next class end" },
                ["]I"] = { "@conditional.outer", "Next conditional end" },
                ["]L"] = { "@loop.outer", "Next loop end" },
            },
            goto_previous_start = {
                ["[f"] = { "@call.outer", "Prev function call start" },
                ["[m"] = { "@function.outer", "Prev method/function def start" },
                ["[c"] = { "@class.outer", "Prev class start" },
                ["[i"] = { "@conditional.outer", "Prev conditional start" },
                ["[l"] = { "@loop.outer", "Prev loop start" },
            },
            goto_previous_end = {
                ["[F"] = { "@call.outer", "Prev function call end" },
                ["[M"] = { "@function.outer", "Prev method/function def end" },
                ["[C"] = { "@class.outer", "Prev class end" },
                ["[I"] = { "@conditional.outer", "Prev conditional end" },
                ["[L"] = { "@loop.outer", "Prev loop end" },
            },
        }
        for fn, maps in pairs(move_maps) do
            for lhs, spec in pairs(maps) do
                vim.keymap.set({ "n", "x", "o" }, lhs, function()
                    move[fn](spec[1], "textobjects")
                end, { desc = spec[2] })
            end
        end

        vim.keymap.set({ "n", "x", "o" }, "]s", function()
            move.goto_next_start("@scope", "locals")
        end, { desc = "Next scope" })
        vim.keymap.set({ "n", "x", "o" }, "]z", function()
            move.goto_next_start("@fold", "folds")
        end, { desc = "Next fold" })

        vim.keymap.set("n", "<leader>na", function()
            swap.swap_next("@parameter.inner")
        end, { desc = "Swap parameter with next" })
        vim.keymap.set("n", "<leader>nm", function()
            swap.swap_next("@function.outer")
        end, { desc = "Swap function with next" })
        vim.keymap.set("n", "<leader>pa", function()
            swap.swap_previous("@parameter.inner")
        end, { desc = "Swap parameter with previous" })
        vim.keymap.set("n", "<leader>pm", function()
            swap.swap_previous("@function.outer")
        end, { desc = "Swap function with previous" })

        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
        vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
    end,
}
