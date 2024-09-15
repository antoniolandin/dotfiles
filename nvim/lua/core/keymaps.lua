--- set leader key ---
vim.g.mapleader = " "

--- exit vim ---
vim.keymap.set("n", "<esc><esc>", "<cmd>q<CR>")

--- Go to file explorer ---
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
-- vim.keymap.set("n", "<leader>pv", "<cmd>Ex<CR>")

--- Move selected line / block of text in visual mode ---
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--- Keep cursor centered ---
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--- Rebind go to last file ---
vim.keymap.set("n", "<leader><leader>", "<C-^>")

--- Unbind arrow keys ---
for _, mode in pairs({ 'n', 'i', 'v', 'x' }) do
    for _, key in pairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
        vim.keymap.set(mode, key, '<nop>')
    end
end

--- Obsidian ---
vim.keymap.set("n", "<leader>os", [[<Cmd>ObsidianSearch<CR>]])
vim.keymap.set("n", "<leader>oq", [[<Cmd>ObsidianQuickSwitch<CR>]])
vim.keymap.set("n", "<leader>op", [[<Cmd>ObsidianPasteImg<CR>]])
vim.keymap.set("n", "<leader>oo", [[<CMD>ObsidianOpen<CR>]])
vim.keymap.set("n", "<leader>on", [[:ObsidianNew<CR>]])

--- Compiler/overseer ---
vim.api.nvim_set_keymap('n', '<leader>mo', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mr', "<cmd>CompilerRedo<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

--- Spider ---
vim.keymap.set(
    { "n", "o", "x" },
    "w",
    "<cmd>lua require('spider').motion('w')<CR>",
    { desc = "Spider-w" }
)
vim.keymap.set(
    { "n", "o", "x" },
    "e",
    "<cmd>lua require('spider').motion('e')<CR>",
    { desc = "Spider-e" }
)
vim.keymap.set(
    { "n", "o", "x" },
    "b",
    "<cmd>lua require('spider').motion('b')<CR>",
    { desc = "Spider-b" }
)

--- Text Transform ---
vim.keymap.set("n", "<leader>tc", "<cmd>TtCamel<CR>")
vim.keymap.set("n", "<leader>ts", "<cmd>TtSnake<CR>")

--- Kitty ---
-- resize window
vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)

-- moving between splits
vim.keymap.set('n', '<C-S-h>', require('smart-splits').move_cursor_left)
vim.keymap.set('n', '<C-S-j>', require('smart-splits').move_cursor_down)
vim.keymap.set('n', '<C-S-k>', require('smart-splits').move_cursor_up)
vim.keymap.set('n', '<C-S-l>', require('smart-splits').move_cursor_right)
vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)

-- swapping buffers between windows
vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)

-- create new splits
vim.keymap.set('n', '<leader>-', "<cmd>split<CR>")
vim.keymap.set('n', '<leader>i', "<cmd>vsplit<CR>")
