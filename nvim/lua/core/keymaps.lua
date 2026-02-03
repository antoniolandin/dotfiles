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
vim.keymap.set("n", "<leader><leader>h", require("smart-splits").swap_buf_left)
vim.keymap.set("n", "<leader><leader>j", require("smart-splits").swap_buf_down)
vim.keymap.set("n", "<leader><leader>k", require("smart-splits").swap_buf_up)
vim.keymap.set("n", "<leader><leader>l", require("smart-splits").swap_buf_right)

-- create new splits
vim.keymap.set("n", "<C-->", "<cmd>split<CR>")
vim.keymap.set("n", "<C-i>", "<cmd>vsplit<CR>")

--- Telescope ---
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
-- vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep String > ") })
end, {})

--- Toggle spell ---
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
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, {})
