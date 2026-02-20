--- set leader key ---
vim.g.mapleader = " "

--- Unbind Tab ---
vim.keymap.set("n", "<Tab>", "<Nop>", { noremap = true, silent = true })

--- Unbind arrow keys ---
for _, mode in pairs({ "n", "i", "v", "x" }) do
    for _, key in pairs({ "<Up>", "<Down>", "<Left>", "<Right>" }) do
        vim.keymap.set(mode, key, "<nop>")
    end
end

--- Copy without updating register
vim.keymap.set("x", "<leader>p", [["_dP]])

--- Go to file explorer ---
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")

--- Move selected line / block of text in visual mode ---
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--- Keep cursor centered ---
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--- Replace word under cursor ---
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--- Rebind go to last file ---
vim.keymap.set("n", "<leader><leader>", "<C-^>")

--- Obsidian ---
vim.keymap.set("n", "<leader>os", [[<Cmd>ObsidianSearch<CR>]])
vim.keymap.set("n", "<leader>oq", [[<Cmd>ObsidianQuickSwitch<CR>]])
vim.keymap.set("n", "<leader>op", [[<Cmd>ObsidianPasteImg<CR>]])
vim.keymap.set("n", "<leader>oo", [[<CMD>ObsidianOpen<CR>]])
vim.keymap.set("n", "<leader>on", [[:ObsidianNew<CR>]])

--- Compiler/overseer ---
vim.api.nvim_set_keymap("n", "<leader>co", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>cr", "<cmd>CompilerRedo<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ct", "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

--- Spider ---
vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })

--- Text Transform ---
vim.keymap.set("n", "<leader>tc", "<cmd>TtCamel<CR>")
vim.keymap.set("n", "<leader>ts", "<cmd>TtSnake<CR>")

-- resize window
vim.keymap.set("n", "<A-h>", require("smart-splits").resize_left)
vim.keymap.set("n", "<A-j>", require("smart-splits").resize_down)
vim.keymap.set("n", "<A-k>", require("smart-splits").resize_up)
vim.keymap.set("n", "<A-l>", require("smart-splits").resize_right)

-- moving between splits
vim.keymap.set("n", "<C-h>", require("smart-splits").move_cursor_left)
vim.keymap.set("n", "<C-j>", require("smart-splits").move_cursor_down)
vim.keymap.set("n", "<C-k>", require("smart-splits").move_cursor_up)
vim.keymap.set("n", "<C-l>", require("smart-splits").move_cursor_right)
vim.keymap.set("n", "<C-\\>", require("smart-splits").move_cursor_previous)

-- swapping buffers between windows
vim.keymap.set('n', '<C-S-h>', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<C-S-j>', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<C-S-k>', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<C-S-l>', require('smart-splits').swap_buf_right)

vim.keymap.set('n', '<C-M-h>', '<C-w>H')
vim.keymap.set('n', '<C-M-j>', '<C-w>J')
vim.keymap.set('n', '<C-M-k>', '<C-w>K')
vim.keymap.set('n', '<C-M-l>', '<C-w>L')

-- create new splits
vim.keymap.set("n", "<C-->", "<cmd>split<CR>")
vim.keymap.set("n", "<C-i>", "<cmd>vsplit<CR>")

--- Telescope ---
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep String > ") })
end, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "See open buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search in vim help" })
vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Resume search" })

vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "Buscar archivos en Git" })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = "Git Status (Ver cambios)" })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = "Git Commits (Historial)" })
vim.keymap.set('n', '<leader>gl', builtin.git_bcommits, { desc = "Git Log (Archivo actual)" })
vim.keymap.set('n', '<leader>gb', builtin.git_branches, { desc = "Git Branches (Check out)" })

vim.keymap.set('n', 'grr', require('telescope.builtin').lsp_references, {})

vim.api.nvim_set_keymap("n", "<leader>g", ":set spell!<CR>", { noremap = true, silent = true })

-- Go to next error
vim.keymap.set("n", "ge", function()
    vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = 1, float = true })
end)

-- Go to previous error
vim.keymap.set("n", "gE", function()
    vim.diagnostic.jump({ severity = vim.diagnostic.severity.ERROR, count = -1, float = true })
end)

--- LSP
vim.keymap.set("n", "<leader>ft", vim.lsp.buf.format)
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = "Ver diagnóstico del LSP" })

local function select_python_cell(around)
    local start_line = vim.fn.search('^# %%', 'bnWc')

    -- Si estamos en un bloque de Markdown, NO seleccionamos
    if start_line > 0 then
        local line_content = vim.fn.getline(start_line)
        if line_content:find("%[markdown%]") then
            start_line = vim.fn.search('^# %%$')
        end
    end

    -- Lógica de inicio
    if start_line == 0 then
        start_line = 1
    elseif not around then
        start_line = start_line + 1
    end

    local next_marker = vim.fn.search('^# %%', 'nW', 0, 0, "line('.') == " .. start_line)
    local end_line

    if next_marker == 0 then
        end_line = vim.fn.line('$')
    else
        -- entre nuestra posición actual y el siguiente marcador.
        end_line = vim.fn.prevnonblank(next_marker - 1)

        -- Si por algún motivo todas las líneas son blancas hasta el marcador,
        -- simplemente nos quedamos en la línea anterior al marcador.
        if end_line < start_line then
            end_line = next_marker - 1
        end
    end

    if start_line > end_line then return end

    local keys = vim.api.nvim_replace_termcodes("<Esc>" .. start_line .. "GV" .. end_line .. "G", true, false, true)
    vim.api.nvim_feedkeys(keys, 'nx', false)
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        local opts = { buffer = true, silent = true }

        vim.keymap.set('x', 'ic', function() select_python_cell(false) end, opts)
        vim.keymap.set('x', 'ac', function() select_python_cell(true) end, opts)
        vim.keymap.set('o', 'ic', function() select_python_cell(false) end, opts)
        vim.keymap.set('o', 'ac', function() select_python_cell(true) end, opts)
    end
})
