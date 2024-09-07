--- set leader key ---
vim.g.mapleader = " "

--- Go to file explorer ---
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

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
vim.api.nvim_set_keymap('n', '<leader>mh', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })

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
