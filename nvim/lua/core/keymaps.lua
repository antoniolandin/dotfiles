vim.g.mapleader = " "
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


--- Unbind arrow keys ---
for _, mode in pairs({ 'n', 'i', 'v', 'x' }) do
    for _, key in pairs({ '<Up>', '<Down>', '<Left>', '<Right>' }) do
        vim.keymap.set(mode, key, '<nop>')
    end
end
